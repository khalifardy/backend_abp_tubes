from django.shortcuts import render
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.core.cache import cache
from django.contrib.auth.hashers import make_password
from django.db.models import Q
from django.core.cache import cache

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework_jwt.settings import api_settings

from apps.auths.models import UserSima

import datetime
from lib.lib_apps_auth import generate_unique_no_anggota,mapping_gender,mapping_pekerjaan,mapping_pendidikan

class Login(APIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        print(username)
        print(password)

        user = authenticate(request, username=username, password=password)

        if user is not None:
            jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
            jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

            payload = jwt_payload_handler(user)
            token = jwt_encode_handler(payload)
            
            query = UserSima.objects.get(user__username=username)
            name = query.first_name + " " + query.last_name
            no_anggota = query.no_anggota

            try:
                role = query.tipe
            except Exception as _:
                role = "-"
            
            
            msg = {
                'role': role,
                'token': token,
                'nama':name,
                'no_anggota':no_anggota           
            }

            return Response(msg, status=status.HTTP_200_OK)
        else:
            return Response({"msg": "username atau password salah"}, status=status.HTTP_400_BAD_REQUEST)


class Signup(APIView):

    permission_classes = (AllowAny,)

    def post(self, request):
        first_name = request.data.get("first_name")
        last_name = request.data.get('last_name')
        email = request.data.get('email')
        alamat = request.data.get('alamat')
        mobile_phone = request.data.get('mobile_phone')
        jenis_kelamin = request.data.get('jenis_kelamin')
        pekerjaan = request.data.get('pekerjaan')
        pendidikan = request.data.get('pendidikan')
        username = request.data.get('username')
        password = request.data.get('password')
        tanggal_lahir = request.data.get('tanggal_lahir')
        nip = request.data.get('nip')
        
        tanggal_lahir = datetime.datetime.strptime(tanggal_lahir, "%d-%m-%Y").date()
        no_anggota = generate_unique_no_anggota()

        try:
            hashed_password = make_password(password)
            obj = User.objects.filter(username=username)
            if len(obj) != 0:
                return Response({"message": "Username sudah ada"},status=status.HTTP_400_BAD_REQUEST)
            obj = UserSima.objects.filter(Q(nip=nip) | Q(email=email))
            if len(obj) != 0:
                return Response({"message": "Anda sudah terdaftar"},status=status.HTTP_400_BAD_REQUEST)

            User.objects.create(username=username,
                                password=hashed_password, is_staff=False)
            obj = User.objects.get(username=username)
            UserSima.objects.create(user=obj, first_name=first_name, last_name=last_name,email=email,
                                    alamat=alamat,mobile_phone=mobile_phone,jenis_kelamin=mapping_gender(jenis_kelamin.lower()),
                                    pekerjaan=mapping_pekerjaan(pekerjaan.lower()),pendidikan=mapping_pendidikan(pendidikan.lower()),tanggal_lahir=tanggal_lahir,
                                    no_anggota=no_anggota, tipe=2, nip=nip)
            return Response({"message": "OK"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"message": str(e)}, status=status.HTTP_400_BAD_REQUEST)


class LogoutView(APIView):

    permission_classes = (AllowAny,)
    authentication_classes = []

    def post(self, request):

        http_status = 200
        request_status = "OK"

        try:
            token = request.META['HTTP_AUTHORIZATION']

            if "JWT " in token:
                token = token.replace("JWT ", "")
                cache.set(('token-%s' % token), token, timeout=1200)

        except Exception as e:
            print(str(e))
            

        return Response({"status": request_status, "message": "Logout success"}, status=http_status)