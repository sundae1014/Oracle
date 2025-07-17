/*
    날짜 : 2025/07/17
    이름 : 정순권
    내용 : 5장 데이터베이스 객체
*/

// 워크북 p13
-- 실습하기
SELECT * FROM DICTIONARY;

SELECT table_name FROM user_tables;

SELECT owner, table_name from all_tables;
SELECT * from dba_tables;
select * from dba_users;

select instance_name, status, database_status, host_name from V$INSTANCE;

-- 실습하기 3-2

select * from user_indexes;
select * from user_ind_columns;

-- 실습 3-3
create index idx_user1_id on USER1(USER_ID);
select * from user_ind_columns;

-- 실습 3-4
drop index idx_user1_id;

-- 실습 3-6
create view VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);
create view VW_USER2_AGE_UNDER30 AS (SELECT * FROM USER2 WHERE AGE < 30);
select * from user_views;

-- 실습 3-7
select * from VW_USER1;
select * from VW_USER2_AGE_UNDER30;

-- 실습 3-8
drop view vw_user1;
drop view VW_USER2_AGE_UNDER30;

-- 실습 3-9
create table user6(
    SEQ     NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20),
    GENDER  CHAR(1),
    AGE     NUMBER,
    ADDR    VARCHAR2(255)
);

-- 실습 3-10
create sequence seq_user6 increment by 1 start with 1;

-- 실습 3-11
insert into user6 values(seq_user6.nextval, '김유신', 'M', 25, '김해시');
insert into user6 values(seq_user6.nextval, '김춘추', 'M', 23, '경주시');
insert into user6 values(seq_user6.nextval, '신사임당', 'F', 27, '강릉시');

-- 실습 4-1
// Oracle 에서 내부 스크립트 실행이나 일반 사용자 생성을 가능하게 하기 위한 세션 설정
alter session set "_ORACLE_SCRIPT"=true; 
create user test1 identified by 1234;

-- 실습 4-2
select * from all_users;

-- 실습 4-3
alter user test1 identified by 1111;

-- 실습 4-4
grant connect, resource to test1;
grant unlimited tablespace to test1;

grant connect, resource, unlimited tablespace to test1;





































