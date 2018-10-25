﻿SET SCHEMA 'keskusdivari';

-- DROP FUNCTION hae_kayttaja() CASCADE;
-- Luonut: *** ***

CREATE OR REPLACE FUNCTION hae_teokset(hakusana varchar(50))
RETURNS TABLE(
    isbn VARCHAR(20),
    nimi VARCHAR(60),
    etunimi VARCHAR(45),
    sukunimi VARCHAR(45),
    luokka VARCHAR(20),
    tyyppi VARCHAR(20)	
)
AS $$

   SELECT isbn, nimi, etunimi, sukunimi, luokka, tyyppi
   FROM teos t
      LEFT JOIN teosten_tekijat ktt ON t.isbn = ktt.teos_isbn
      LEFT JOIN tekija kt ON ktt.tekija_id = kt.id
      WHERE LOWER(etunimi) LIKE hakusana OR LOWER(sukunimi) LIKE hakusana OR
            LOWER(nimi) LIKE hakusana OR LOWER(tyyppi) LIKE hakusana OR
            LOWER(luokka) LIKE hakusana OR LOWER(kuvaus) LIKE hakusana;

$$ LANGUAGE SQL;