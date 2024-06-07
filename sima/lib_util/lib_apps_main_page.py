def book_kategori(kategori):
    kat = {
        'fiksi':1,
        'non fiksi':2
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