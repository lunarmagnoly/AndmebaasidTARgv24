create database procTARgv24;
use procTARgv24;

create table uudised(
uudisID int primary key identity(1,1),
uudisTeema varchar(50),
kuupaev date,
autor varchar (25),
kirjeldus text
)

select * from uudised;
insert into uudised (uudisTeema, kuupaev, autor, kirjeldus)
values(
'udune ilm', '2025-02-06', 'postimees', 'Lounani on udune ilm')

--pritseduuri loomine
--sisestab uudised tabelisse ja kohe naitab

create procedure lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar (20),
@kirjeldus text
AS
BEGIN
INSERT INTO uudised(
uudisTeema, kuupaev, autor, kirjeldus)
values(
@uusTeema, @paev, @autor, @kirjeldus);
select * from uudised;
end;
--kutse
EXEC lisaUudis 
@uusTeema = '1.marts on juba kevad',
@paev = '2025-02-06',
@autor = 'test',
@kirjeldus = 'puudub'

--protseduur, mis kustutab tabelist id jargi
create procedure kustutaUudis
@id int
AS
BEGIN
select * from uudised;
delete from uudised where uudisID=@id;
select * from uudised;
end;

--kutse
exec kustutauUdis 2;
exec kustutaUudis @id=2;

update uudised set kirjeldus = 'uus kirjeldus'
where kirjeldus like 'puudub'
select * from uudised;

--protseduur mis uuendab andmed tebelis/UPDATE

create procedure uuendaKirjeldus
@uusKirjeldus text
AS
BEGIN
select * from uudised;
update uudised set kirjeldus = 'uus kirjeldus'
where kirjeldus like 'puudub'
select * from uudised;
END;

select * from uudised;

--kutse
exec uuendaKirjeldus 'uus tekst kirjeldus'
exec uuendaKirjeldus @uusKirjeldus = 'uus tekst kirjeldus'

--protseduur, mis otsid=b ja naitab uudis esimese tahte jargi

create procedure otsingUudiseTeema
@taht char(1)
as 
begin
select * from uudised
where uudisTeema like @taht + '%'
end;

--kutse

exec otsingUudiseTeema 'u'

