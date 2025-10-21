USE 20251009kcs;

-- Allek�rdez�sek: 
    -- Bizonyos esetekben a rekordhalmaz kiv�laszt�s�n�l, m�s rekordhalmazb�l kisz�molt �rt�kek alapj�n szeretn�nk kiv�lasztani.
-- Skal�r visszat�r�s� allek�rdez�sek:Szabv�nyosan:
-- �WHERE <oszlop> =,<>,<,>,>=,<= (<lek�rdez�s>)�
-- <f�ggv�ny>(�,(<lek�rdez�s>),..)



-- a.V�lasszuk ki az �sszes olyan dolgoz�t, akinek KING a f�n�ke.

SELECT * FROM emp
WHERE mgr = ( -- kint a f�n�k
  SELECT empno FROM emp 
  WHERE ename = 'KING'
);

-- b.V�lasszuk ki az �sszes olyan dolgoz�t, akinek a juttat�sa nagyobb mint ALLEN-�.

SELECT * FROM emp
WHERE comm > ( -- fizet�sen fel�li juttat�s
  SELECT comm FROM emp
  WHERE ename = 'ALLEN'
);

-- c.V�lasszuk ki az �sszes olyan dolgoz�t, aki t�bbet keres, mint az �sszes olyan dolgoz�, akit 1982-ben vett�nk fel.

SELECT * FROM emp -- az �ssze ilyen dolgoz�t.
WHERE sal > ALL ( -- neki a fizuja
  SELECT sal FROM emp  -- 1982-vel vettek fel
  WHERE YEAR(hiredate) = 1982
);

-- d.V�lasszuk ki az �sszes olyan dolgoz�t, aki a RESEARCH oszt�lyon dolgozik.

SELECT * FROM emp
WHERE deptno = (
  SELECT deptno FROM dept --
  WHERE dname = 'RESEARCH'
);

-- e.K�rdezz�k le az �sszes olyan dolgoz�t, aki t�bbet keres, mint b�rmelyik a PRESIDENT al� k�zvetlen beosztott ember.

/*�k az �sszes olyan dolgoz�k.*/SELECT * FROM emp -- � al�
WHERE sal > ANY ( -- de csak azokat, akinek megegyezik az allek�rdez�sben
 /*president alatt dolgoz�k-azonos�t�val*/ SELECT sal FROM emp -- lek�rdezz�k azokat akik a president alatt dolgoznak k�zvetlen
  WHERE mgr = ( -- akik t�bbet keresnek b�rmelyik az allek�rdez�s allek�rd�s ut�n.
  /*president azonos�t�ja*/  SELECT empno FROM emp
    WHERE job = 'PRESIDENT'
  )
);