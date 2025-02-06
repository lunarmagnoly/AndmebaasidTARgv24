CREATE TABLE kasutajad (
    kasutajaID INT PRIMARY KEY AUTO_INCREMENT,
    isikukood VARCHAR(11),
    sunnipaev DATE,
    nimi VARCHAR(25)
);

INSERT INTO kasutajad (isikukood, sunnipaev, nimi)
VALUES ('23435353212', '2000-02-06', 'Mini Nimi');

DELIMITER //

CREATE PROCEDURE lisaKasutaja(
    IN p_isikukood VARCHAR(11),
    IN p_sunnipaev DATE,
    IN p_nimi VARCHAR(25)
)
BEGIN
    INSERT INTO kasutajad (isikukood, sunnipaev, nimi)
    VALUES (p_isikukood, p_sunnipaev, p_nimi);

    SELECT * FROM kasutajad;
END //

DELIMITER ;

CALL lisaKasutaja('46567890098', '1965-02-06', 'Mingi Nimi');


DELIMITER //

CREATE PROCEDURE uuendaNimi(
    IN p_vanaNimi VARCHAR(25),
    IN p_uusNimi VARCHAR(25)
)
BEGIN
    SELECT * FROM kasutajad WHERE nimi = p_vanaNimi;

    UPDATE kasutajad
    SET nimi = p_uusNimi
    WHERE nimi = p_vanaNimi;

    SELECT * FROM kasutajad WHERE nimi = p_uusNimi;
END //

DELIMITER ;

CALL uuendaNimi('Mingi Nimi', 'Uus Nimi');

DELIMITER //

CREATE PROCEDURE otsingIsikukoodJargi(
    IN p_esimeneNumber CHAR(1)
)
BEGIN
    SELECT * FROM kasutajad
    WHERE isikukood LIKE CONCAT(p_esimeneNumber, '%');
END //

DELIMITER ;

CALL otsingIsikukoodJargi('4');
