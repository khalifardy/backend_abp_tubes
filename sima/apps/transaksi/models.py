from django.db import models
from django_extensions.db.models import TimeStampedModel
from apps.auths.models import UserSima
from apps.main_page.models import Book

# Create your models here.

class DaftarKunjungan(TimeStampedModel):
    anggota = models.ForeignKey(UserSima, on_delete=models.CASCADE)
    masuk = models.DateTimeField()
    keluar = models.DateTimeField()
    

class DaftarPinjam(TimeStampedModel):
    anggota = models.ForeignKey(UserSima, on_delete=models.CASCADE)
    buku = models.ForeignKey(Book, on_delete=models.CASCADE)
    tgl_pinjam = models.DateTimeField()
    tgl_kembali = models.DateTimeField()
    status = models.BooleanField(default=False)
    keterangan = models.TextField(null=True,default = '')   
