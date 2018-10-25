/*
	
	Raportti 3 (versio 2) :: *** *** :: muokattu viimeksi 2018-04-18
	
	Haetaan kaikki käyttäjät - lisäksi lasketaan jokaiselle viim. vuoden sisään tehtyjen ERI teosten
	lukumäärä. Esimerkiksi jos teoksia on tilattu A,B,B ja C, on eri teoksia 3 kpl.
	
	Haetaan esin kaikki käyttäjät [vasen puoli], jonka lisäksi omassa kyselyssä
	lasketaan vanhan kaavan mukaisesti eri teosten määrä kullekin käyttäjälle [oikea puoli].
	Nämä kaksi relaatiota JOINataan lopuksi LEFT JOIN:lla, jotta varmasti kaikki käyttäjät pysyvät
	mukana. Coalesce() muuntaa lopputuloksesta NULL:n nollaksi. Järjestys spostin mukaan, ASC.
	
	-- HUOM: 'teoksen' tulkitaan tarkoittavan abstraktia kirjaa, ei kopiota kirjasta (eli kappaletta).
	
	[kayttaja@foo.fi] <-- LEFT JOIN --> [kayttaja@foo.fi, 10]
	[kayttaja_2@foo.fi] <-- LEFT JOIN --> (ei vastaavaa tuplea) = 0
	
	HUOMAUTUS :: Päivitä myös itse funktiotiedosto!
	
*/
SELECT kayttaja.email, COALESCE(laskenta.eri_teosten_lkm_viime_vuonna, 0) as eri_teosten_lkm_viime_vuonna FROM kayttaja
-- Joinaa laskentatuloksen kanssa
LEFT JOIN (
	SELECT kayttaja.email as k_e, COUNT(DISTINCT(kappale.teos_isbn)) as eri_teosten_lkm_viime_vuonna FROM tilaus
	INNER JOIN ostoskori ON tilaus.id=ostoskori.tilaus_id
	INNER JOIN kappale ON ostoskori.kappale_id=kappale.id
	RIGHT JOIN kayttaja ON tilaus.kayttaja_email=kayttaja.email
	WHERE
	tilaus.tila=2 AND -- 2 = valmis tilaus
	-- tilaus.pvm >= CURRENT_DATE - '1 year'::interval  -- VANHA
    EXTRACT(YEAR FROM NOW()::date)-1 = EXTRACT(YEAR FROM tilaus.pvm)
	GROUP BY(kayttaja.email)
) as laskenta ON kayttaja.email=laskenta.k_e
ORDER BY kayttaja.email ASC;