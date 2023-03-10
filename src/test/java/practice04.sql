CREATE TABLE kitaplarım
(
id integer,
isim varchar(50),
yazar varchar (50)
);

INSERT INTO kitaplarım VALUES (1,'Memleketimden İnsan Manzaraları','Nazım Hikmet');
INSERT INTO kitaplarım VALUES (2,'Masumiyet Müzesi','Orhan Pamuk');
INSERT INTO kitaplarım VALUES (3,'Beni Kör Kuyularda','Hasan Ali Toptaş');

select * from kitaplarım;

-------------- Practice 1 -----------------
-- Tabloya kitap ekleyen methodu yazınız.
create or replace function kitap_ekle (kitap_id integer,kitap_isim varchar, kitap_yazar varchar)

returns void
language plpgsql
as
$$
begin
insert into kitaplarım (id,isim,yazar) values (kitap_id,kitap_isim,kitap_yazar);
end $$;

select kitap_ekle (4,'Huzursuzluk', 'Zülfi Livaneli');
select kitap_ekle (5,'Bozbulanık', 'Nezihe Meriç');

select * from kitaplarım

--------------- Practice 2 ---------------
-- Tabloyu update eden methodu yazınız.
create or replace function kitap_guncelle(kitap_id integer, kitap_isim varchar,kitap_yazar varchar)

returns void
language plpgsql
as
$$
begin
update kitaplarım set isim=kitap_isim where id=kitap_id;
update kitaplarım set yazar=kitap_yazar where id=kitap_id;
end $$;

select kitap_guncelle(5,'Tutunamayanlar','Oğuz Atay');

select * from kitaplarım;

--------------- Practice 3 ---------------
-- Tablodan veri silen bir method yazınız.

create or replace function kitap_silme(kitap_id integer, kitap_isim varchar, kitap_yazar varchar)

returns void
language plpgsql
as
$$
begin
delete from kitaplarım where isim=kitap_isim ;
delete from kitaplarım where yazar=kitap_yazar;
delete from kitaplarım where id=kitap_id;
end $$;

select kitap_silme(4,'Huzursuzluk','Zülfi Livaneli');
select * from kitaplarım;
