﻿-- CREATE-lauseet "normidivarille" (ei-keskusdivari)

-- Poistaa vanhan ja aloittaa puhtaalta pöydältä

-- Muokannut viimeksi: *** 2018-04-13
	-- Muutettu teos.nimi VARCHAR(45) --> 60

DROP SCHEMA d1 CASCADE; -- Kommentoi rivi pois 1. ajokerralla
CREATE SCHEMA d1;

SET SCHEMA 'd1';

CREATE TABLE IF NOT EXISTS tekija (
  id SERIAL NOT NULL,
  etunimi VARCHAR(45) NOT NULL,
  sukunimi VARCHAR(45) NOT NULL,
  kansallisuus VARCHAR(45),
  synt_vuosi INTEGER,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS teos (
  isbn VARCHAR(20) NOT NULL,
  nimi VARCHAR(60),
  kuvaus VARCHAR(1000),
  luokka VARCHAR(20),
  tyyppi VARCHAR(20),
  PRIMARY KEY(isbn)
);

CREATE TABLE IF NOT EXISTS kappale (
  divari_nimi VARCHAR(10) CHECK(divari_nimi = 'D1'), -- EDIT: Tulee tarkistaa, ei voi olla muuta kuin 'D1'
  id SERIAL, -- Yksilöivä
  teos_isbn VARCHAR(20) NOT NULL,
  paino INTEGER NOT NULL CHECK(paino > 0),
  tila INTEGER NOT NULL DEFAULT(0), -- muutettu nollaksi 
  sisosto_hinta NUMERIC(5,2),
  hinta NUMERIC(5,2),
  myynti_pvm DATE,
  PRIMARY KEY(divari_nimi, id),
  FOREIGN KEY (teos_isbn) REFERENCES teos, -- isbn
  CHECK(tila <= 2 AND tila >= 0)
);

CREATE TABLE IF NOT EXISTS teosten_tekijat (
  tekija_id INTEGER NOT NULL,
  teos_isbn VARCHAR(20) NOT NULL,
  PRIMARY KEY(tekija_id, teos_isbn),
  FOREIGN KEY (tekija_id) REFERENCES tekija, -- id
  FOREIGN KEY (teos_isbn) REFERENCES teos -- teos
);