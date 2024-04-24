from django.db import models

# Create your models here.
class Author(models.Model):
    name = models.CharField(max_length=100)
    def __str__(self):
        return self.name

class Publisher(models.Model):
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    website = models.URLField()
    contact = models.EmailField()
    phone = models.CharField(max_length=100)
    def __str__(self):
        return self.name

class Book(models.Model):
    FIKSI = 1
    NON_FIKSI = 2
    
    kategori_choice = [
        (FIKSI,"FIksi"),
        (NON_FIKSI,"Non-Fiksi")
    ]
    
    NOVEL = 1
    KOMIK = 2
    SAINS = 3
    HUMANIORA = 4
    BIOGRAFI = 5
    PENDIDIKAN = 6
    AGAMA = 7
    PSIKOLOGI = 8
    HUMANIORAN = 9
    PERTANIAN = 10
    JOURNAL = 11
    
    sub_kategori_choice = [
        (NOVEL,"Novel"),
        (KOMIK,"Komik"),
        (SAINS,"Sains, Matematika dan Enginnering"),
        (HUMANIORA,"HUmaniora"),
        (BIOGRAFI,"Biografi"),
        (PENDIDIKAN,"Pendidikan"),
        (AGAMA,"Agama"),
        (PSIKOLOGI,"Psikologi"),
        (HUMANIORA,"HUmanioran"),
        (PERTANIAN,"Pertanian"),
        (JOURNAL,"Journal"),
    
    ]
    title = models.CharField(max_length=100)
    code = models.CharField(max_length=100)
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    isbn = models.CharField(max_length=100)
    publisher = models.ForeignKey(Publisher, on_delete=models.CASCADE,null=True,default="")
    category = models.PositiveSmallIntegerField(choices=kategori_choice)
    sub_category = models.PositiveSmallIntegerField(choices=sub_kategori_choice)
    url_buku = models.URLField()
    url_image = models.URLField()
    stok = models.IntegerField()
    premium = models.BooleanField(default=False)
    
    def __str__(self):
        return self.title

class Review(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    review = models.TextField()
    rating = models.IntegerField()
    def __str__(self):
        return self.book.title