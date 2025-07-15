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