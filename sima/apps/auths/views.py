from django.shortcuts import render,redirect
from django.contrib import messages
import requests
import datetime
# Create your views here.

def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        response = requests.post('http://127.0.0.1:8000/api/auth/login/', data={'username': username, 'password': password})

        if response.status_code == 200:    
            messages.success(request, "login Sukses")
            return render(request,'')
        else:
            pesan = response.json().get('msg')
            messages.error(request, pesan)
    
    return render(request, 'login.html')

def signup(request):
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        born = request.POST.get('birthdate')
        gender = request.POST.get('gender')
        alamat = request.POST.get('address')
        email = request.POST.get('email')
        no_hp = request.POST.get('mobile')
        nip = request.POST.get('nip')
        pekerjaan = request.POST.get('job')
        pendidikan = request.POST.get('education')
        
        born = datetime.datetime.strptime(born, '%Y-%m-%d')
        born = born.strftime('%d-%m-%Y')
        
        data = {
            'username': username,
            'password': password,
            'first_name': first_name,
            'last_name': last_name,
            'tanggal_lahir': born,
            'nip':nip,
            'mobile_phone': no_hp,
            'jenis_kelamin':gender,
            'alamat':alamat,
            'email':email,
            'pekerjaan':pekerjaan,
            'pendidikan':pendidikan
        }
        
        response = requests.post('http://127.0.0.1:8000/api/auth/signup/', data=data)
        print(response.json())
        
        if response.status_code == 200:    
            messages.success(request, "Pendaftaran Sukses Silahkan Login")
            #render(request,'login.html')
            return redirect('login')
        else:
            pesan = response.json().get('message')
            messages.error(request, pesan)
            return render(request,'signup.html')
        
        
    else:
        return render(request, 'signup.html')