from django.shortcuts import render,redirect
from .models import word
from django.contrib.auth.models import User,auth
from django.contrib import messages
from .models import word
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
dataSet = [
    {
        "word": "กิน",
        "question": "หลังตื่นมีอาการไหม",
        "choice":"มี/ไม่มี",
        "id":"1",
        "sound":"karen.mp3"
    },
    {
        "word": "ข้าว",
        "question": "หลังปวดรักษาอย่างไร",
        "choice":"หาหมอผี/ทายา/ไม่รักษา",
        "id":"2",
        "sound":"ipone.mp3"
    },
    {
        "word": "ดื่ม",
        "question": "เคยเกิดอุบัติเหตุไหม",
        "choice":"เคย/ไม่เคย",
        "id":"3",
        "sound":"Karen.mp3"
    },
    {
        "word": "น้ำ",
        "question": "เริ่มปวดเมื่อไร"
        ,"choice":"ระบุวันที่",
        "id":"4",
        "sound":"Karen.mp3"
    },
]
# Create your views here.

def login(request):
    return render(request, 'login.html')

@login_required(login_url="/")
def mainpage(request):
    data = word.objects.all()
    if request.method == 'POST' and request.FILES['myfile'] and request.POST['wordth']:
        word_th = request.POST['wordth']
        myfile = request.FILES['myfile']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)

        if word.objects.filter(Word_th = word_th).exists() :
            word.objects.filter(Word_th = word_th).update(Word_th = word_th,Sound = filename)
            data = word.objects.all()
            return render(request, 'mainpage.html', {
            'uploaded_file_url': 'มีคำนี้แล้ว','allword': data
        })
            
        else:
            word_thai = word.objects.create(Word_th = word_th,Sound = filename)
        return render(request, 'mainpage.html', {
            'uploaded_file_url': uploaded_file_url,'allword': data
        })
    else:
        data = word.objects.all()
        return render(request, 'mainpage.html', {'allword': data})

@login_required(login_url="/")
def addanswer(request):
    return render(request, 'addanswer.html', {'allword': dataSet})

def username_pass(request):
    username = request.POST['username']
    password = request.POST['password']

    user = auth.authenticate(username = username,password = password)
    
    if user is not None :
        data = word.objects.all()
        auth.login(request,user)
        return redirect('/mainpage', {'allword': data})

    else :
        return render(request, 'login.html', {'user': 'nouser'})
@login_required(login_url="/")
def logout( request):
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

def delete(request,pk):
    print(pk)
    word.objects.filter(pk = pk).delete()
    data = word.objects.all()
    return render(request, 'mainpage.html', {'allword': data})

