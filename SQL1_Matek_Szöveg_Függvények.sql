-- Skalárfüggvények: 
/* 
- A skalárfüggvények feladatukat tekintve az egyes attribútumok, vagy statikus értékek manipulálásában használatosak.
- Segítségükkel az egyes oszlopok értékei átalakíthatók, vagy tovább bonthatók annak megfelelően, hogy mit szeretnénk elérni belőle.
- A skalárfüggvények használata, az aggregáló függvényekkel szemben, bárhol történhet, ahol skalár érték kerül megadásra.

Matematikai függvények:
    - ABS (<ÉRTÉK>): visszaadja az érték abszolút értékét. 0-tól való távolság
    - RAND ([<alap>]): Pszeudó véletlen szám generátor
     - ROUND(<érték>,<jegy_pozícióig>)
Kerekít egy bizonyos értéket, egy bizonyos tizedes jegyig, vagy hatványig
    - FLOOR(<érték>)
      Levágja a tizedes jegyek a számról.
   - CEILING(<érték>)
        Felfele kerekíti a számot.
    - PI()
        Visszaadja a PI értékét.
    - POWER(<érték>, <hatvány>)
        Hatványozza a megadott értéket a megadott hatványra.
    - SQRT(<érték>)
        Négyzetgyököt von a megadott értékből.

Szöveg függvények:

Olyan függvények, melyek valamilyen szöveggel, vagy karakterrel térnek vissza és / vagy azzal dolgoznak.
     - ASCII(<karakter>)
        Megadja az ASCII táblában, az adott karakterhez tartozó pozíciót. Pl.: ASCII(’A’)  65
     - UNICODE(<karakter>) (MSSQL)
          Megadja a UNICODE táblában, az adott karakterhez tartozó pozíciót.
    - SOUNDEX(<szöveg>)
        Egy 4 karakteres SOUNDEX kódot ad vissza, amivel le lehet kérdezni, egy szöveg hangzás utáni kódját.
    - DIFFERENCE(<szöveg1>, <szöveg2>) (MSSQL)
        Két szöveg közötti SOUNDEX érték összehasonlítását végzi.
        Egy számot ad vissza, ami maximum 4 lehet, amennyiben a két szöveg szinte teljesen megegyezik, minél kisebb a szám, annál nagyobb az eltérés.
    - CHAR(<szám>)
        Megadja az ASCII kódtáblában, az adott pozícióhoz tartozó karaktert.
    - NCHAR(<szám>) (MSSQL)
        Megadja a UNICODE kódtáblában, az adott pozícióhoz tartozó karaktert.
    - SPACE(<szám>)
        Visszatér annyi ‚space’-el amennyit paraméterül megadtunk.
    - CHARINDEX(<szöveg_mit>, <szöveg_miben>) (MSSQL)
     - LOCATE(<szöveg_mit>, <szöveg_miben>) (MySQL)
        Lényegében az IndexOf függvény SQL-es változata.
        Megadja, hogy hol található a szövegben a keresett szöveg.
        MSSQL esetén a szöveg nem lehet hosszabb 8000 karakternél.
     - PATINDEX(<szöveg_kifejezés_mit>, <szöveg_miben>) (MSSQL)
          A LIKE-nál már látott szövegkifejezés első előfordulását tudja keresni és visszaadni.
      - STR(<szám>, [<hossz>], [<decimális_helyek>]) (MSSQL)
        Szöveggé konvertál egy megadott számot.
        Két opcionális paraméterével szabályozható, hogy a kimenet mekkora lehet maximum karakterben, és a megadott számból hány decimális helyet tartson meg.
       - CONCAT(<szöveg1>, <szöveg2>,…,<szövegN>)
          Összefűzi a megadott szövegeket.
      - STUFF(<szöveg>, <kezdő_karakter>, <törlendő_hossz>, <beillesztendő_szöveg>)
          Segítségével bele lehet fűzni, egy meglévő szövegbe, egy másikat úgy, hogy közben az eredeti szövegből bizonyos karakterszámot kitörlünk.
       - REPLACE(<szöveg_miben>, <szöveg_mit>, <szöveg_mire>)
        Kicseréli a a megadott szövegben a megadott szöveget, egy másik megadott szövegre.
        - SUBSTRING(<szöveg>, <honnan>, <mennyit>)
        Visszaad a szöveg bizonyos karakterétől, bizonyos mennyiségű karaktert.
      -  LOWER / UPPER(<szöveg>)
          Kis- nagybetűsítő függvények.
      - LEFT / RIGHT(<szöveg>, <hossz>)
         Visszaadja a szöveg bal, vagy jobb oldaláról a megadott hossznyi karaktert.
       - LEN(<szöveg>)
          Visszaadja a megadott szöveg hosszát.


Dátum és időt visszaadó, vagy azokkal dolgozó függvények:

      -SYSDATETIME() [MSSQL]
        Visszaadja DATETIME2(7) típusban, a jelenlegi dátumot és időpontot, amit az SQL Server alatt futó géptől kérdez le.
      - CURRENT_TIMESTAMP
          Visszaadja DATETIME típusban, a jelenlegi dátumot és időpontot, amit az SQL Server alatt futó géptől kérdez le.
          A CURRENT_TIMESTAMP után nincs zárójel.
          Pontatlanabb mint a SYSDATETIME(), viszont több SQL szerverrel kompatibilis.
      - GETDATE() [MSSQL] / NOW() [MySQL]
        Ugyan azt adja vissza mint aCURRENT_TIMESTAMP
        DATEPART(<dátumrész>, <dátum>) [MSSQL]
        Visszaadja a megadott dátum, megadott részét.
      - DAY(<dátum>)
        A megadott dátumból visszaadja a napot.
       - MONTH(<dátum>)
          A megadott dátumból visszaadja a hónapot.
      -YEAR(<dátum>)
          A megadott dátumból visszaadja az évet.
       - DATEFROMPARTS(<év>, <hónap>, <nap>) [MSSQL]
          DATE típusú értékké konvertálja a számban megadott értékeket.
       - MAKEDATE(<év>,<év hányadik napja>) [MySQL]
          DATE típust készít a megadott év és a napja alapján.
       - TIMEFROMPARTS(<óra>, <perc>, <másodperc>) [MSSQL] / MAKETIME(<óra>, <perc>, <másodperc>) [MySQL]
           TIME típusú értékké konvertálja a számban megadott értéket.
       - DATEDIFF(<dátumrész>, <dátum1>, <dátum2>)
          Megadja, a két dátum között eltelt időt, dátumrész pontosságban.


Logikai függvények:
Logikai kimenettel rendelkező, az elágazás vezérlési szerkezetet megvalósító függvények:
 - IIF(<logikai_kifejezés>, <ha_igaz>, <ha_hamis>) [MSSQL]
A feltételes értékadás megvalósítása SQL-ben, segítségével bizonyos logikai feltétel segítségével tudunk 2 értéket átadni.
 - CHOOSE(<index>, <érték1>, <érték2>,…,<értékN>) [MSSQL]
A Switch-Case szerkezethez hasonlóan, azonban nem logikai alapon tudunk több értéket felsorolni segítségével, és az index által kiválasztani az adott helyen megfelelőt.




*/