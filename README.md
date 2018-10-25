# Divarit

###### Tietokantaohjelmointi (2018) -kurssin harjoitustyön SQL:t

Tehtävänanto 2018 :: http://www.sis.uta.fi/~tiko/materiaali/18/Tiko_harkkatyo_18_v2.pdf (tosin salasanan takana)

Osa SQL:stä/Triggereistä on toteutettu todella "purkasti", koska osaaminen ja aika ei riittänyt. Tämä koskee lähinnä tilanteita joissa toiminnon pitäisi kohdistua dynaamisesti eri skeemoihin (<skeema>.<taulu>). Näissä tapauksissa on päädytty kovakoodaukseen.

*-- Harjoitustyössä oletetaan, että keskusdivari
tarjoaa tietokantapalveluja, joihin yksittäinen divari voi tallentaa ja käsitellä teoksiin liittyviä tietoja.
Yksittäisellä divarilla voi olla myös oma tietokanta, joka kommunikoi keskusdivarin tietokannan kanssa.
Oletetaan, että keskusdivarilla ei ole omaa myyntitoimintaa, vaan se vain vastaa yhteisestä tietokannasta ja
palveluista. Keskusdivari pitää yllä asiakasrekisteriä. Yksittäisellä divarilla saattaa olla oma rekisterinsä,
mutta sitä ei tässä työssä käsitellä.*

*Työssä ei toteuteta varsinaisesti eri tietokantoja divareilla, vaan yksittäiselle divarille ja keskusdivarille pitää
muodostaa oma skeema (osatietokanta). Perusratkaisussa rajoitutaan kahteen yksittäiseen divariin D1
(Lassen lehti) ja D2 (Galleinn Galle). Divari D1 käyttää omaa tietokantaa ja D2 keskusdivarin tietokantaa.
Toisin sanoen työssä pitää toteuttaa vähintään kaksi kaavioita*

