CREATE DATABASE db_transaksi ;

-- Table One to One

--  CREATE TABLE
CREATE TABLE pengguna(id_pengguna INT GENERATED ALWAYS AS IDENTITY,
                    nama_pengguna VARCHAR(64),
                    umur INT,
                    alamat VARCHAR(225),
                    PRIMARY KEY(id_pengguna)
                    );

CREATE TABLE telepon(id INT GENERATED ALWAYS AS IDENTITY,
                    no_tlpn VARCHAR(64),
                    id_pengguna INT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP,
                    PRIMARY KEY (id),
                    FOREIGN KEY (id_pengguna) REFERENCES pengguna(id_pengguna)
                    );
-- INSERT QUERY
INSERT INTO pengguna(nama_pengguna,umur,alamat) VALUES ('Agung',20,'jalan cempaka putih no 20'),
                                                        ('Soleh',30,'jalan pulomas no 30'),
                                                        ('Kanina',29,'jalan kayu laut no 28'),
                                                        ('Bambang',60,'jalan bunga angsa no 399'),
                                                        ('Bruno',25,'jalan manchester no 40');

INSERT INTO telepon(no_tlpn,id_pengguna)VALUES('0988987',1),
                                                ('08325616',2),
                                                ('0832382892',3),
                                                ('9389127',4),
                                                ('089382721',5);
--  Show Table                                               
SELECT * FROM pengguna;
SELECT * FROM telepon;
-- UPDATE QUERY
UPDATE pengguna SET nama_pengguna = 'Gilang Agung' WHERE id = 3;
-- DELETE DATA
 Delete from pengguna where id = 5;
-- relasi inier join 
SELECT pengguna.*, telepon.no_tlpn AS no_telepon, FROM pengguna join telepon ON pengguna.id_pengguna = telepon.id_pengguna ;



-- Table one to many

CREATE TABLE penjual(id_penjual INT GENERATED ALWAYS AS IDENTITY,
                    nama_penjual VARCHAR(64),
                    alamat VARCHAR(225),
                    PRIMARY KEY(id_penjual)
                    );
CREATE TABLE produk(id INT GENERATED ALWAYS AS IDENTITY,
                    nama VARCHAR(64),
                    harga INT,
                    id_penjual INT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP,
                    PRIMARY KEY (id),
                    FOREIGN KEY (id_penjual) REFERENCES penjual(id_penjual)
                    );


INSERT INTO penjual(nama_penjual,alamat)VALUES('Aldi jaidi','jalan sawi merah no 90'),
                                                ('Ramos','jalan tanjung anom no 555'),
                                                ('Sergio abidal','jalan parapat no 402'),
                                                ('Lala','jalan lanto jauh no 932'),
                                                ('Komar','jalan satago no9 27');
INSERT INTO produk(nama,harga,id_penjual)VALUES('bang-bang',2000,1),
                                               ('sarimi isi dua',4000,1),
                                               ('sakura',8000,3),
                                               ('bayam',7000,2),
                                               ('ale-ale',3000,3),
                                               ('puding',5000,5),
                                               ('jahe merah',8000,4),
                                               ('donat',5000,5);
--  Show Table                                               
SELECT * FROM penjual;
SELECT * FROM produk;
-- UPDATE QUERY
UPDATE penjual SET nama_penjual = 'Zen Sun' WHERE id = 3;
-- DELETE DATA
 Delete from penjual where id = 5;
-- relasi
SELECT penjual.*, produk.nama AS nama_produk,produk.harga FROM penjual join produk ON penjual.id_penjual = produk.id_penjual ;



-- Table many to many



CREATE TABLE pembeli(id_pembeli INT GENERATED ALWAYS AS IDENTITY,
                    nama_pembeli VARCHAR(64),
                    jenis_kelamin VARCHAR(64),
                    PRIMARY KEY(id_pembeli)
                    );

CREATE TABLE barang(id_barang INT GENERATED ALWAYS AS IDENTITY,
                    nama_barang VARCHAR(64),
                    harga INT,
                    stok INT,
                    id_pembeli INT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP,
                    PRIMARY KEY (id_barang),
                    FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli)
                    );

CREATE TABLE trnsaksi(id_transaksi INT GENERATED ALWAYS AS IDENTITY,
                    id_barang INT,
                    id_pembeli INT,
                    keterangan VARCHAR(64),
                    PRIMARY KEY(id_transaksi),
                    FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
                    FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli)
                    );

INSERT INTO pembeli(nama_pembeli,jenis_kelamin)VALUES('yabes','laki-laki'),
                                                     ('dimas','laki-laki'),
                                                     ('anri','laki-laki'),
                                                     ('susi','perempuan'),
                                                     ('sara','perempuan');
INSERT INTO barang(nama_barang,harga,stok,id_pembeli)VALUES('sepatu adidas',200000,3,1),
                                                           ('baju badut',70000,50,2),
                                                           ('Handuk',6000,20,5),
                                                           ('kulkas',6002000,3,1),
                                                           ('Lemari',20000,5,4),
                                                           ('HanPhone',83929,8,3);

INSERT INTO trnsaksi(id_barang,id_pembeli,keterangan)VALUES(1,1,'lunas'),
                                                            (2,1,'belum lunas'),
                                                            (3,2,'lunas'),
                                                            (1,2,'lunas'),
                                                            (4,3,'belum lunas');

-- Show table
SELECT * FROM pembeli;
SELECT * FROM barang;
SELECT * FROM trnsaksi;

-- UPDATE QUERY
UPDATE pembeli SET pembeli = 'Zega' WHERE id = 5;
-- DELETE DATA
 Delete from pembeli where id = 5;
-- Relasi TABLE INERJOIN
SELECT trnsaksi.*, pembeli.nama_pembeli AS nama_produk,pembeli.jenis_kelamin,barang.nama_barang FROM trnsaksi join pembeli ON trnsaksi.id_transaksi = pembeli.id_pembeli  join barang  ON trnsaksi.id_transaksi = barang.id_barang;