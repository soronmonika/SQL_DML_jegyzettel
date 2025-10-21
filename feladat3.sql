USE `20251009kcs`;

-- 

-- a.Adjuk meg a dolgozók fizetésének négyzete alapján kiszámított átlagfizetést azon alkalmazottak körében, akik 2000$ és 4000$ közötti keresettel rendelkeznek.

SELECT AVG(POWER(sal, 2)) AS FizuNegyzetAtlag2k4k FROM emp
WHERE sal BETWEEN 2000 AND 4000;

-- b.Adjuk meg, hogy melyek azok a dolgozók, akik már több mint 35 éve a cég alkalmazottai.

SELECT * FROM emp
WHERE ROUND(DATEDIFF(NOW(), hiredate) / 365) > 40;

-- c.Adjuk meg azokat a dolgozókat, akik nevének hossza több, mint 4 karakter.

SELECT * FROM emp
WHERE LENGTH(ename) > 4;

-- d.Adjuk meg minden alkalmazotthoz, hogy mennyire cseng össze a neve a „SHERLOCK” névvel. [MSSQL]

/*
MySQL-ben sajat fuggveny megirasaval kell dolgozni.
*/

-- e.Válasszuk ki az összes dolgozót úgy, hogyha a fizetése több mint 4000$ akkor a [Túlfizetett] oszlop legyen „igen” különben „nem” értékû.

SELECT *, IF(sal > 4000, 'igen', 'nem') AS Tulfizetett FROM emp;