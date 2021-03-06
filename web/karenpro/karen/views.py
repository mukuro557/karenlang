from django.shortcuts import render, redirect
from .models import word 
from django.contrib.auth.models import User, auth
from django.contrib import messages
from .models import word, questions, choice, usedquestion
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.http import JsonResponse
from django.db.models import Count
import difflib

from pythainlp import word_tokenize
import speech_recognition as sr
import json

dataSet = [

]

def login(request):
    return render(request, 'login.html')

@login_required(login_url="/")
def dashboad(request):
    alldata = []
    data = usedquestion.objects.all().values('wordque','type','miss').annotate(total=Count('wordque')).order_by('-total')
    countword = word.objects.all().values('id','Word_th')
    countques = questions.objects.all().values("Question")
    countnotfound = usedquestion.objects.all().values('wordque','type','miss').filter(miss=1).count()
    ata = usedquestion.objects.all().values('wordque','type','miss').filter(miss = 0).count()
    print(countnotfound)
    for i in data:
        alldata.append([i,len(countword),len(countques),countnotfound,ata])
    
    return render(request, 'dashboad.html' , {'allword': alldata})

@login_required(login_url="/")
def mainpage(request):
    data = word.objects.all()

    return render(request, 'mainpage.html', {'allword': data})

@login_required(login_url="/")
def addanswer(request):
    dataSet.clear()
    ques = questions.objects.all()
    for i in ques:
        num = 0
        cho = choice.objects.all().filter(Question_id = i.pk)
        allchoice = ''
        for j in cho:

            if num == 0:
                allchoice = j.Choice
                num = 1
            else:
                allchoice = allchoice+'/'+j.Choice
        dataSet.append({'id': i.pk, 'question': i.Question,
                        'Sound': i.Sound, 'choice': allchoice, 'type': i.Type})
        print(dataSet)
    return render(request, 'addanswer.html', {'allword': dataSet})

def username_pass(request):
    username = request.POST['username']
    password = request.POST['password']
    print(username)
    user = auth.authenticate(username=username, password=password)

    if user is not None:
        data = word.objects.all()
        auth.login(request, user)
        return redirect('/mainpage', {'allword': data})

    else:
        return render(request, 'login.html', {'user': 'nouser'})

# @login_required(login_url="/")
def logout(request):
    auth.logout(request)
    return redirect('/')

def adduser(request):
    username = 'admin'
    password = '1234'
    user = User.objects.create_user(
        username=username,
        password=password
    )
    user.save()
    return render(request, 'test.html')

def delete(request, pk):
    word.objects.filter(pk=pk).delete()
    data = word.objects.all()
    return render(request, 'mainpage.html', {'allword': data})


def addword(request):
    data = word.objects.all()
    
    if request.method == 'POST' and request.FILES['myfile'] and request.POST['wordth']:
        word_th = request.POST['wordth']
        myfile = request.FILES['myfile']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)

        if word.objects.filter(Word_th=word_th).exists():
            messages.info(request, 'Hello!')
            return render(request, 'mainpage.html', {
                'uploaded_file_url': '?????????????????????????????????', 'allword': data
            })

        else:
            word_thai = word.objects.create(Word_th=word_th, Sound=filename)
            data = word.objects.all()
            return render(request, 'mainpage.html', {'allword': data})
    else:
        data = word.objects.all()
        return render(request, 'mainpage.html', {'allword': data})


def editword(request, pk):

    if request.method == 'POST' and request.FILES['myfile'] and request.POST['wordth']:
        word_th = request.POST['wordth']
        myfile = request.FILES['myfile']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)

        word.objects.filter(pk=pk).update(
            Word_th=word_th, Sound=filename)
        data = word.objects.all()
        return render(request, 'mainpage.html', {'allword': data})

    else:
        data = word.objects.all()
        return render(request, 'mainpage.html', {'allword': data})


def addquestion(request, number , type):
    
    if request.method == 'POST' and request.FILES['myfile'] and request.POST['wordth'] :
        
        word_th = request.POST['wordth']
        mysound = request.FILES['myfile']
        fs = FileSystemStorage()
        filenameQ = fs.save(mysound.name, mysound)

        uploaded_file_url = fs.url(filenameQ)

        if questions.objects.filter(Question=word_th).exists():
            dataSet.clear()
            ques = questions.objects.all()
            for i in ques:
                num = 0
                cho = choice.objects.all().filter(Question_id = i.pk)
                allchoice = ''
                for j in cho:

                    if num == 0:
                        allchoice = j.Choice
                        num = 1
                    else:
                        allchoice = allchoice+'/'+j.Choice
                dataSet.append({'id': i.pk, 'question': i.Question,'Sound': i.Sound, 'choice': allchoice, 'type': i.Type})
            return render(request, 'addanswer.html', {
                'uploaded_file_url': '?????????????????????????????????????????????', 'allword': dataSet
            })

        else:
            question_thai = questions.objects.create(
                Question=word_th, Sound=filenameQ,Type = type)
            question_thai.save()
            data = questions.objects.all()
            
            if type == 3 :
                for i in range(1, number+1):
                    findimg = request.FILES['ansfile%s' % i]
                    findicon = request.FILES['icon%s' % i]
                    iconic = fs.save(findicon.name, findicon)
                    filenameC = fs.save(findimg.name, findimg)
                    uploaded_file_url = fs.url(filenameC)
                    choicef = request.POST['answer%s' % i]
                    choicework = choice.objects.create(
                        Choice=choicef, Question_id=question_thai.id, Sound=filenameC, Icon=iconic)
                    choicework.save()

                return redirect('/addquestion')
            elif type == 2: 
                choicef = request.POST['answer%s' % 1]
                findimg = request.FILES['ansfile%s' % 1]
                filenameC = fs.save(findimg.name, findimg)
                choicework = choice.objects.create(
                        Choice=choicef, Question_id=question_thai.id, Sound=filenameC)
                choicework.save()
                choicef = request.POST['answer%s' % 2]
                findimg = request.FILES['ansfile%s' % 2]
                filenameC = fs.save(findimg.name, findimg)
                choicework = choice.objects.create(
                        Choice=choicef, Question_id=question_thai.id, Sound=filenameC)
                choicework.save()
                return redirect('/addquestion')
            else:
                return redirect('/addquestion')
    return redirect('/addquestion')




def deleteques(request, id):
    questions.objects.filter(pk=id).delete()
    choice.objects.filter(Question_id=id).delete()

    return redirect('/addquestion')


def editques(request, id, number):
    if request.method == 'POST':
        word_th = request.POST['wordth']
        mysound = request.FILES['myfile']
        fs = FileSystemStorage()
        filenameQ = fs.save(mysound.name, mysound)
        questions.objects.filter(pk=id).update(
            Question=word_th, Sound=filenameQ)
        choice.objects.filter(Question_id=id).delete()
        for i in range(1, number+1):
            findimg = request.FILES['ansfile%s' % i]
            findicon = request.FILES['icon%s' % i]
            iconic = fs.save(findicon.name, findicon)
            filenameC = fs.save(findimg.name, findimg)
            uploaded_file_url = fs.url(filenameC)
            choicef = request.POST['answer%s' % i]
            choicework = choice.objects.create(
                Choice=choicef, Question_id=id, Sound=filenameC, Icon=iconic)
            choicework.save()

    return redirect('/addquestion')

from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status , generics, filters
from .serializer import getquestion


class cutkum(generics.ListCreateAPIView):

    search_field = ['Question']
    all_athletes = questions.objects.all()
    filter_backends = (filters.SearchFilter,)
    serializer_class = getquestion
    serializer = getquestion(all_athletes, many=True)
    # sound = questions.objects.filter(Question=id)

    def get_queryset(self):

        word = self.request.query_params.get('word')
        proc = word_tokenize(word, engine='newmm')
        print(proc)


def get_queryset(request, word):

    sound = questions.objects.all().filter(Question=word)
    for j in sound:
        print(j.Sound)
    return HttpResponse(sound[0].Sound, content_type='application/json')


def get_question(request, word):

    if questions.objects.filter(Question=word):
        ques = questions.objects.all().filter(Question=word)
        data = []
        data.append([ques[0].id, ques[0].Type, ques[0].Sound, ques[0].Question,1],)
        list_to_json_array = json.dumps(data)
        quest = usedquestion.objects.create(
            wordque=word, type=1, miss=0)
        quest.save()
        print(data)
        return HttpResponse(list_to_json_array)

    else:
        data = []
        all_athletes = questions.objects.all()
        count = 0
        for j in all_athletes:
            temp = difflib.SequenceMatcher(None,word,j.Question)
            if temp.ratio()>0.69:
                count+=1
                data.append([j.id, j.Type, j.Sound,j.Question,0],)
        if count ==0 :
            data.append(['',5,'','',5])
        # y = json.loads(ques)
        list_to_json_array = json.dumps(data)
        choicework = usedquestion.objects.create(
            wordque=word, type=1, miss=1)
        choicework.save()
        print(data)
        return HttpResponse(list_to_json_array)


def get_allquestion(request):

    ques = questions.objects.all()
    data = []
    for j in ques:
        data.append([j.Question])
    print(data)
    list_to_json_array = json.dumps(data)
    return HttpResponse(list_to_json_array)


def get_setanswer(request, id):
    ques = choice.objects.all().filter(Question_id=id)
    data = []
    for j in ques:
        data.append([j.Choice, j.Icon, j.Sound])
    # y = json.loads(ques)

    list_to_json_array = json.dumps(data)
    return HttpResponse(list_to_json_array)


def get_recommen(request):
    questt = usedquestion.objects.all().filter(miss=0).values(
        'wordque', 'type', 'miss').annotate(total=Count('wordque')).order_by('-total')
    data = []
    for j in questt:
        data.append(j)
    # y = json.loads(ques)

    list_to_json_array = json.dumps(data)
    print(list_to_json_array)
    return HttpResponse(list_to_json_array)


def get_history(request):
    questt = usedquestion.objects.all().filter(miss=0).values(
        'wordque', 'type', 'miss', 'id').distinct().order_by('-id')
    data = []
    for j in questt:
        data.append(j)
    # y = json.loads(ques)

    list_to_json_array = json.dumps(data)
    print(list_to_json_array)
    return HttpResponse(list_to_json_array)
