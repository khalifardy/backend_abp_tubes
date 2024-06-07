import random
from apps.auths.models import UserSima


def generate_unique_no_anggota():
    while True:
        no_anggota = str(random.randint(100000000000, 999999999999))  # Generate a 12 digit number
        if not UserSima.objects.filter(no_anggota=no_anggota).exists():
            return no_anggota

def mapping_gender(gender):
    gen = {
        'pria':1,
        'wanita':2
    }
    
    return gen[gender]

def mapping_tipe(tipe):
    tip = {
        'regular':2,
        'admin':1,
        'premium':3
    }
    
    return tip[tipe]

def mapping_pekerjaan(pekerjaan):
    pek = {
        'asn':1,
        'swasta':2,
        'mahasiswa':3,
        'pelajar':4,
        'wiraswasta':5,
        'pegawai_negara_non_asn':6,
        'other':7
    }
    
    return pek[pekerjaan]

def mapping_pendidikan(pendidikan):
    pend = {
        'tk':1,
        'sd':2,
        'smp':3,
        'sma':4,
        'd3':5,
        's1':6,
        's2':7,
        's3':8,
        'other':9
    }
    
    return pend[pendidikan]

def book_kategori(kategori):
    kat = {
        'fiksi':1,
        'non_fiksi':2
    }
    
    return kat[kategori]

def book_sub_kategori(sub_kategori):
    sub_kat = {
        'novel':1,
        'komik':2,
        'sains':3,
        'humaniora':4,
        'biografi':5,
        'pendidikan':6,
        'agama':7,
        'psikologi':8,
        'humanioran':9,
        'pertanian':10,
        'journal':11
    }
    
    return sub_kat[sub_kategori]
