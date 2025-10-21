USE `20251009kcs`;

-- 

-- a.Adjuk meg a dolgoz�k fizet�s�nek n�gyzete alapj�n kisz�m�tott �tlagfizet�st azon alkalmazottak k�r�ben, akik 2000$ �s 4000$ k�z�tti keresettel rendelkeznek.

SELECT AVG(POWER(sal, 2)) AS FizuNegyzetAtlag2k4k FROM emp
WHERE sal BETWEEN 2000 AND 4000;

-- b.Adjuk meg, hogy melyek azok a dolgoz�k, akik m�r t�bb mint 35 �ve a c�g alkalmazottai.

SELECT * FROM emp
WHERE ROUND(DATEDIFF(NOW(), hiredate) / 365) > 40;

-- c.Adjuk meg azokat a dolgoz�kat, akik nev�nek hossza t�bb, mint 4 karakter.

SELECT * FROM emp
WHERE LENGTH(ename) > 4;

-- d.Adjuk meg minden alkalmazotthoz, hogy mennyire cseng �ssze a neve a �SHERLOCK� n�vvel. [MSSQL]

/*
MySQL-ben sajat fuggveny megirasaval kell dolgozni.
*/

-- e.V�lasszuk ki az �sszes dolgoz�t �gy, hogyha a fizet�se t�bb mint 4000$ akkor a [T�lfizetett] oszlop legyen �igen� k�l�nben �nem� �rt�k�.

SELECT *, IF(sal > 4000, 'igen', 'nem') AS Tulfizetett FROM emp;