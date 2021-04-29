from django.shortcuts import render, redirect
from .models import word
from django.contrib.auth.models import User, auth
from django.contrib import messages
from .models import word, questions, choice
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
dataSet = [

]


def login(request):
    return render(request, 'login.html')


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
        cho = choice.objects.all().filter(Question_id=i.pk)
        allchoice = ''
        for j in cho:

            if num == 0:
                allchoice = j.Choice
                num = 1
            else:
                allchoice = allchoice+'/'+j.Choice
        dataSet.append({'id': i.pk, 'question': i.Question,
                        'Sound': i.Sound, 'choice': allchoice})
    return render(request, 'addanswer.html', {'allword': dataSet})


def username_pass(request):
    username = request.POST['username']
    password = request.POST['password']

    user = auth.authenticate(username=username, password=password)

    if user is not None:
        data = word.objects.all()
        auth.login(request, user)
        return redirect('/mainpage', {'allword': data})

    else:
        return render(request, 'login.html', {'user': 'nouser'})


@login_required(login_url="/")
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
            return render(request, 'mainpage.html', {
                'uploaded_file_url': 'มีคำนี้แล้ว', 'allword': data
            })

        else:
            word_thai = word.objects.create(Word_th=word_th, Sound=filename)
            data = word.objects.all()
            return render(request, 'mainpage.html', {'allword': data})
    else:
        data = word.objects.all()
        return render(request, 'mainpage.html', {'allword': data})


def editword(request, pk):

    if request.method == 'POST' and request.FILES['myfile'] and request.POST['wordth'] and request.POST['answer'] and request.FILES['ansfile1']:
        word_th = request.POST['wordth']
        myfile = request.FILES['myfile']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)

        word.objects.filter(pk=pk).update(
            Word_th=word_th, Sound=filename)
        data = word.objects.all()
        return render(request, 'addanswer.html', {'allword': data})

    else:
        data = word.objects.all()
        return render(request, 'addanswer.html', {'allword': data})


def addquestion(request, number):
    
    if request.method == 'POST' and request.FILES['myfile'] and request.POST['wordth'] and request.POST['answer1']:
        
        word_th = request.POST['wordth']
        mysound = request.FILES['myfile']
        fs = FileSystemStorage()
        filenameQ = fs.save(mysound.name, mysound)

        uploaded_file_url = fs.url(filenameQ)
        print(uploaded_file_url)

        if questions.objects.filter(Question=word_th).exists():
            print('มีคำนี้แล้ว')
            return render(request, 'addanswer.html', {
                'uploaded_file_url': 'มีคำนี้แล้ว', 'allword': dataSet
            })

        else:
            question_thai = questions.objects.create(
                Question=word_th, Sound=filenameQ)
            question_thai.save()
            data = word.objects.all()

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
                data1 = choice.objects.all()

            return redirect('/addquestion')

    return redirect('/addquestion')


def deleteques(request, id):
    questions.objects.filter(pk=id).delete()
    choice.objects.filter(Question_id=id).delete()

    return redirect('/addquestion')
