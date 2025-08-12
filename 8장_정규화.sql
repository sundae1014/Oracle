/*
    날짜 : 2025/08/12
    이름 : 정순권
    내용 : 8장 정규화 실습
*/

-- 정규화 x 테이블 생성
CREATE TABLE bookorder (
    order_no   NUMBER NOT NULL,
    order_date DATE,
    cust_id    VARCHAR2(20 BYTE),
    cust_name  VARCHAR2(20 BYTE),
    address    VARCHAR2(100 BYTE),
    book_id    NUMBER,
    book_name  VARCHAR2(100 BYTE),
    count      NUMBER,
    price      NUMBER
);

ALTER TABLE bookorder ADD CONSTRAINT bookorder_pk PRIMARY KEY ( order_no );

-- 1정규화
insert into bookorder values ('10001', '2024-01-12', 'a101', '김유신', '김해', '101', '프로그래밍', 1, 28000);
insert into bookorder values ('10002', '2024-01-12', 'a102', '김춘추', '경주', '101', '프로그래밍', 1, 28000);
insert into bookorder values ('10003', '2024-01-12', 'a102', '김춘추', '경주', '102', '자료구조', 2, 32000);
insert into bookorder values ('10004', '2024-01-12', 'a103', '장보고', '완도', '102', '자료구조', 2, 32000);
insert into bookorder values ('10005', '2024-01-12', 'a104', '강감찬', '서울', '110', '데이터베이스', 1, 25000);
insert into bookorder values ('10006', '2024-01-12', 'a105', '이순신', '서울', '110', '데이터베이스', 1, 25000);
insert into bookorder values ('10007', '2024-01-12', 'a105', '이순신', '서울', '102', '자료구조', 1, 16000);

select * from bookorder;



CREATE TABLE bo_book (
    book_id    NUMBER NOT NULL,
    book_name  VARCHAR2(100),
    book_price NUMBER
);

ALTER TABLE bo_book ADD CONSTRAINT book_pk PRIMARY KEY ( book_id );

CREATE TABLE bo_customer (
    cust_id   VARCHAR2(20 BYTE) NOT NULL,
    cust_name VARCHAR2(20 BYTE),
    address   VARCHAR2(100)
);

ALTER TABLE bo_customer ADD CONSTRAINT user_pk PRIMARY KEY ( cust_id );

CREATE TABLE bo_orders (
    order_no    NUMBER NOT NULL,
    cust_id     VARCHAR2(20 BYTE),
    book_id     NUMBER,
    order_date  DATE,
    order_count NUMBER
);

ALTER TABLE bo_orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_no );

ALTER TABLE bo_orders
    ADD CONSTRAINT orders_book_fk FOREIGN KEY ( book_id )
        REFERENCES bo_book ( book_id );

ALTER TABLE bo_orders
    ADD CONSTRAINT orders_customer_fk FOREIGN KEY ( cust_id )
        REFERENCES bo_customer ( cust_id );



CREATE TABLE bo_book3 (
    book_id   NUMBER NOT NULL,
    book_name VARCHAR2(100)
);

ALTER TABLE bo_book3 ADD CONSTRAINT bo_bookv1_pk PRIMARY KEY ( book_id );

CREATE TABLE bo_customer3 (
    cust_id   VARCHAR2(20 BYTE) NOT NULL,
    cust_name VARCHAR2(20 BYTE),
    address   VARCHAR2(100)
);

ALTER TABLE bo_customer3 ADD CONSTRAINT bo_customerv1_pk PRIMARY KEY ( cust_id );

CREATE TABLE bo_orders3 (
    order_no   NUMBER NOT NULL,
    order_id   VARCHAR2(20 BYTE),
    order_date DATE
);

ALTER TABLE bo_orders3 ADD CONSTRAINT bo_ordersv1_pk PRIMARY KEY ( order_no );

CREATE TABLE bo_ordersitem (
    order_no NUMBER NOT NULL,
    book_id  NUMBER NOT NULL,
    count    NUMBER,
    price    NUMBER
);

ALTER TABLE bo_ordersitem ADD CONSTRAINT bo_orders3v1_pk PRIMARY KEY ( order_no,
                                                                       book_id );

ALTER TABLE bo_orders3
    ADD CONSTRAINT bo_orders3_bo_customer3_fk FOREIGN KEY ( order_id )
        REFERENCES bo_customer3 ( cust_id );

ALTER TABLE bo_ordersitem
    ADD CONSTRAINT bo_ordersitem_bo_book3_fk FOREIGN KEY ( book_id )
        REFERENCES bo_book3 ( book_id );

ALTER TABLE bo_ordersitem
    ADD CONSTRAINT bo_ordersitem_bo_orders3_fk FOREIGN KEY ( order_no )
        REFERENCES bo_orders3 ( order_no );
























