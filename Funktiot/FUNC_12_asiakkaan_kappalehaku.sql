﻿SET SCHEMA 'keskusdivari';

-- Korjattu tilatarkistus [***]

CREATE OR REPLACE FUNCTION hae_kappaleet(hakusana varchar(50))
RETURNS TABLE(
    divari_nimi VARCHAR(10),
    id integer,
    nimi VARCHAR(60),  
    kuvaus VARCHAR(1000),
    luokka VARCHAR(20),
    tyyppi VARCHAR(20),
    hinta NUMERIC(5,2)
)
AS $$
    -- Teokset niiden nimen, tekijän nimen, luokan, tyypin tai kuvauksen perusteella
    SELECT divari_nimi, kp.id, nimi, kuvaus, luokka, tyyppi, hinta
    FROM teos t
      INNER JOIN kappale kp ON t.isbn = kp.teos_isbn
      LEFT JOIN teosten_tekijat ktt ON t.isbn = ktt.teos_isbn
      LEFT JOIN tekija kt ON ktt.tekija_id = kt.id
      WHERE (LOWER(etunimi) LIKE hakusana OR LOWER(sukunimi) LIKE hakusana OR
            LOWER(nimi) LIKE hakusana OR LOWER(tyyppi) LIKE hakusana OR
            LOWER(luokka) LIKE hakusana OR LOWER(kuvaus) LIKE hakusana)
            AND tila = 0;

$$ LANGUAGE SQL;


