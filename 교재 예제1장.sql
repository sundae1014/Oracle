-- 교재 p26
select * from emp;

-- 교재 p27
select *
    from emp;

select * fr
    om emp; // 키워드 줄을 바꿔서 에러

select *
    from em
    p; // 테이블 이름 줄을 바꿔서 에러

select em
    pno from emp; // 컬럼 이름 줄을 바꿔서 에러

-- 교재 p28
DESC dept;

-- 교재 P29
SELECT * FROM tab;

SELECT EMPNO, ENAME
    FROM EMP;
    
-- 교재 P30
SET PAGESIZE 150
SET LINESIZE 2000
SELECT EMPNO, ENAME
    FROM EMP;
    
-- 교재 P32
SET PAGESIZE 50
COL NAME FOR A20

SELECT NAME, 'good mornig~~!' "Good Mornig"
    FROM PROFESSOR;

-- 교재 P33    
select DNAME, ',it''s deptno: ', DEPTNO "DNAME AND DEPTNO"
    FROM DEPT;

SELECT DNAME, Q'[, it's deptno : ]', DEPTNO "DNAME AND DEPTNO"
    FROM DEPT;
    
-- 교재 P34
SELECT PROFNO, NAME, PAY
    FROM PROFESSOR;

SELECT PROFNO "Prof's NO", NAME AS "Prof's NAME", PAY Prof_Pay
    FROM PROFESSOR;

-- 교재 P35
SELECT deptno FROM emp;
SELECT DISTINCT deptno
    FROM emp;

-- 교재 p36
SELECT job, ename
    FROM emp
    ORDER BY 1,2;

SELECT DISTINCT job, ename
    FROM emp
    ORDER BY 1,2;

-- 교재 p37 ~ 38
SELECT ename, job FROM emp;

SELECT ename || job FROM emp;

SELECT ename||'-'||job FROM emp;

SELECT ename||' ''s job is '|| job "NAME AND JOB"
    FROM emp;

-- 연습문제 p39 ~ 40
SELECT name||' ''s ID: '|| id ||' , WEIGHT is '|| weight ||'kg' "ID AND WEIGHT"
    FROM student;

SELECT ename||'('||job||')'||', '||ename||''''||job||'''' "NAME AND JOB"
    FROM emp;

SELECT ename||'''s sal is $'||sal "Name And Sal"
    FROM emp;

-- 교재 p41 ~ 43 / WHERE
SELECT empno, ename
    FROM emp
    WHERE empno = 7900;

SELECT ename, sal
    FROM emp
    WHERE sal < 900;

SELECT empno, ename, sal
    FROM emp
    WHERE ename='SMITH';

SELECT empno, ename, sal
    FROM emp
    WHERE hiredate = '80/12/17';

-- 교재 P44 / 산술연산자
SELECT ENAME, SAL
    FROM EMP
    WHERE DEPTNO = 10;

SELECT ENAME, SAL, SAL+100
    FROM EMP
    WHERE DEPTNO = 10;

SELECT ENAME, SAL, SAL*1.1
    FROM EMP
    WHERE DEPTNO = 10;

-- 교재 p45 ~ 56 / 비교 연산자
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL >= 4000;
    
SELECT empno, ename, sal
    FROM emp
    WHERE ename >= 'W';

SELECT ENAME, HIREDATE
    FROM EMP;

SELECT ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE >= '81/12/25' ;
    
SELECT empno, ename, sal
    FROM emp
    WHERE sal BETWEEN 2000 AND 3000;

SELECT empno, ename, sal
    FROM emp
    WHERE sal >= 2000
    AND sal <= 3000;

SELECT ename FROM emp
    ORDER BY ename;

SELECT ename FROM emp
    WHERE ename BETWEEN ' JAMES' AND 'MARTIN'
    ORDER BY ename;

SELECT empno, ename, deptno
    FROM emp
    WHERE deptno IN (10,20);

SELECT empno, ename, sal
    FROM emp
    WHERE sal LIKE '1%';

SELECT empno, ename, sal
    FROM emp
    WHERE ename LIKE 'A%';

SELECT empno, ename, hiredate
    FROM emp
    WHERE hiredate LIKE '%00';

SELECT empno, ename, hiredate
    FROM emp
    WHERE hiredate LIKE '_____12%';

SELECT empno , ename , comm
    FROM emp
    WHERE deptno IN (20,30);

SELECT empno, ename, comm
    FROM emp
    WHERE comm IS NULL;

SELECT empno, ename, comm
    FROM emp
    WHERE comm IS NOT NULL;

SELECT empno, ename, sal, comm
    FROM emp
    WHERE sal > 1000
    AND (comm < 1000 OR comm IS NULL);

SELECT empno, ename
    FROM &table
    WHERE sal = 3000;

-- 교재 p57 ~ 58 / ORDER BY
SELECT ename, sal, hiredate
    FROM emp;

SELECT ename, sal, hiredate
    FROM emp
    ORDER BY ename;

SELECT deptno, sal, ename
    FROM emp
    ORDER BY deptno ASC, sal DESC;

SELECT ename, sal, hiredate
    FROM emp
    WHERE sal > 1000
    ORDER BY 2, 1;

--  교재 p59 ~ 64 / 집합연산자
SELECT studno, name, deptno1, 1
    FROM student
    WHERE deptno1 = 101
    UNION ALL
    SELECT profno, name, deptno, 2
    FROM professor
    WHERE deptno = 101;

SELECT studno, name, deptno1, 1
    FROM student
    WHERE deptno1 = 101
    UNION
    SELECT profno, name, deptno, 2
    FROM professor
    WHERE deptno = 101;

SELECT studno, name
    FROM student
    WHERE deptno1 = 101
    UNION
    SELECT studno, name
    FROM student
    WHERE deptno2 = 201;

SELECT studno, name
    FROM student
    WHERE deptno1 = 101
    UNION ALL
    SELECT studno, name
    FROM student
    WHERE deptno2 = 201;

SELECT studno, name
    FROM student
    WHERE deptno1 = 101
    INTERSECT
    SELECT studno, name
    FROM student
    WHERE deptno2 = 201;

SELECT empno, ename, sal
    FROM emp
    MINUS
    SELECT empno, ename, sal
    FROM emp
    WHERE sal > 2500;