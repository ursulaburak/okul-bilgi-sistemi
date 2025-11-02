CREATE TABLE bolumler (
    bolum_id SERIAL PRIMARY KEY,
    bolum_adi VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE ogretmenler (
    ogretmen_id SERIAL PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    bolum_id INTEGER REFERENCES bolumler(bolum_id) ON DELETE SET NULL
);

CREATE TABLE ogrenciler (
    ogrenci_id SERIAL PRIMARY KEY,
    ogrenci_no VARCHAR(20) NOT NULL UNIQUE,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    bolum_id INTEGER REFERENCES bolumler(bolum_id) ON DELETE SET NULL
);

CREATE TABLE dersler (
    ders_id SERIAL PRIMARY KEY,
    ders_kodu VARCHAR(20) NOT NULL UNIQUE,
    ders_adi VARCHAR(100) NOT NULL,
    kredi INTEGER NOT NULL CHECK (kredi > 0),
    ogretmen_id INTEGER REFERENCES ogretmenler(ogretmen_id) ON DELETE SET NULL
);

CREATE TABLE ogrenci_dersleri (
    kayit_id SERIAL PRIMARY KEY,
    ogrenci_id INTEGER REFERENCES ogrenciler(ogrenci_id) ON DELETE CASCADE,
    ders_id INTEGER REFERENCES dersler(ders_id) ON DELETE CASCADE,
    vize_notu NUMERIC(5,2) CHECK (vize_notu BETWEEN 0 AND 100),
    final_notu NUMERIC(5,2) CHECK (final_notu BETWEEN 0 AND 100),
    yil INTEGER NOT NULL,
    donem VARCHAR(20) NOT NULL,
    UNIQUE(ogrenci_id, ders_id, yil, donem)
);