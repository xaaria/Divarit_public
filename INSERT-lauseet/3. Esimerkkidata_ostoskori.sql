﻿-- ostoskori
-- Juokseva numerointi (!!) kappaleissa

SET SCHEMA 'keskusdivari';

TRUNCATE ostoskori CASCADE;

INSERT INTO ostoskori VALUES (10000, 'D1', 1);
INSERT INTO ostoskori VALUES (10010, 'D1', 1);
INSERT INTO ostoskori VALUES (10020, 'D1', 1);
INSERT INTO ostoskori VALUES (10070, 'D2', 1);

INSERT INTO ostoskori VALUES (10011, 'D1', 2);

INSERT INTO ostoskori VALUES (10050, 'D1', 3);
INSERT INTO ostoskori VALUES (10060, 'D2', 3);

-- Tepon tilaukset (tilaus ID:t 4,)
INSERT INTO ostoskori VALUES (10060, 'D1', 4);
INSERT INTO ostoskori VALUES (10061, 'D1', 4);
INSERT INTO ostoskori VALUES (10070, 'D1', 4);
INSERT INTO ostoskori VALUES (10090, 'D2', 4);
INSERT INTO ostoskori VALUES (10091, 'D2', 4);
INSERT INTO ostoskori VALUES (10092, 'D2', 4);

-- Liisan tilauksia
INSERT INTO ostoskori VALUES (10095, 'D2', 5);
INSERT INTO ostoskori VALUES (10107, 'D2', 5);