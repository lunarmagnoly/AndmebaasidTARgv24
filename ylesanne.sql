create table kasutajad(
kasutajaID int primary key identity(1,1),
isikukood varchar(11),
sunnipaev date,
nimi varchar (25),

)

insert into kasutajad (isikukood, sunnipaev, nimi)
values(
'23435353212', '2000-02-06', 'Mini Nimi')
--mis lisab uue kasutaja
create procedure lisaKasutaja

@isikukood varchar(11),
@sunnipaev date,
@nimi varchar (25)

AS
BEGIN
INSERT INTO kasutajad(
isikukood, sunnipaev, nimi)
values(
@isikukood, @sunnipaev, @nimi);
select * from kasutajad;
end;
--kutse

EXEC lisaKasutaja 
@isikukood = '46567890098',
@sunnipaev = '1965-02-06',
@nimi = 'Mingi Nimi'

--mis vahetab nimi
CREATE PROCEDURE uuendaNimi
    @vanaNimi varchar(25),
    @uusNimi varchar(25)
AS
BEGIN
    
    SELECT * FROM kasutajad WHERE nimi = @vanaNimi;
	UPDATE kasutajad
    SET nimi = @uusNimi
    WHERE nimi = @vanaNimi;

    SELECT * FROM kasutajad WHERE nimi = @uusNimi;
END;
--kutse
EXEC uuendaNimi 
@vanaNimi = 'Mingi Nimi', 
@uusNimi= 'Uus Nimi';

--mis otsib kasutaja isikukoodi esimese numbri järgi
create procedure otsingIsikukoodJargi
@esimeneNumber char(1)
as 
begin
select * from kasutajad
where isikukood like @esimeneNumber + '%'
end;
--kutse
EXEC otsingIsikukoodJargi '4'
