from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class UserSima(models.Model):
    ADMIN = 1
    REGULAR =2
    PREMIUM = 3
    
    PRIA = 1
    WANITA = 2
    
    ASN = 1
    SWASTA = 2
    MAHASISWA = 3
    PELAJAR = 4
    WIRASWASTA = 5
    PEGAWAI_NEGARA_NON_ASN = 6
    OTHER = 7
    
    TK = 1
    SD = 2
    SMP = 3
    SMA = 4
    D3 = 5
    S1 = 6
    S2 = 7
    S3 = 8
    OTHER_PENDIDIKAN = 9
    
    
    GENDER = [
        (PRIA,"Pria"),
        (WANITA,"Wanita")
    ]
    
    USER_TYPE = [
        (ADMIN,"Admin"),
        (REGULAR,"Regular"),
        (PREMIUM,"Premium")
    ]
    
    pekerjaan = [
        (ASN,"ASN"),
        (SWASTA,"Swasta"),
        (MAHASISWA,"Mahasiswa"),
        (PELAJAR,"Pelajar"),
        (WIRASWASTA,"Wiraswasta"),
        (PEGAWAI_NEGARA_NON_ASN,"Pegawai Negara Non ASN"),
        (OTHER,"Other")
    ]
    
    pendidikan = [
        (TK,"TK"),
        (SD,"SD"),
        (SMP,"SMP"),
        (SMA,"SMA"),
        (D3,"D3"),
        (S1,"S1"),
        (S2,"S2"),
        (S3,"S3"),
        (OTHER_PENDIDIKAN,"Other")
    ]
    
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    no_anggota = models.CharField(max_length=100)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100,blank=True,default="")
    email = models.EmailField(null=True,default="")
    alamat = models.TextField()
    mobile_phone = models.CharField(max_length=100)
    jenis_kelamin = models.PositiveSmallIntegerField(choices=GENDER)
    pekerjaan = models.PositiveSmallIntegerField(choices=pekerjaan)
    pendidikan = models.PositiveBigIntegerField(choices=pendidikan)
    tipe = models.PositiveBigIntegerField(choices=USER_TYPE)
    tanggal_lahir = models.DateField()
    nip = models.CharField(max_length=100,default=None)
    
    
    def __str__(self):
        return self.first_name
    
    