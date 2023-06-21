CREATE USER pet
IDENTIFIED BY zico6;

GRANT CONNECT, RESOURCE, CREATE VIEW TO pet;

CREATE TABLE mypet(
    nickname VARCHAR2(20) UNIQUE NOT NULL CONSTRAINT u_nickname_fk REFERENCES MEMBERS(nickname),
    pname VARCHAR2(20),
    species1 VARCHAR2(30),
    species2 VARCHAR2(30),
    gender VARCHAR2(10),
    bday VARCHAR2(10),
    weight VARCHAR2(10),
    particulars VARCHAR2(300),
    image VARCHAR2(500),
    pno NUMBER(8) PRIMARY KEY
);


CREATE TABLE wish(
    unickname VARCHAR2(20) UNIQUE NOT NULL CONSTRAINT user_nickname_fk REFERENCES MEMBERS(nickname),
    ino NUMBER(8) UNIQUE NOT NULL CONSTRAINT ino_fk REFERENCES INTRODUCE(ino),
    snickname VARCHAR2(30) CONSTRAINT s_nickname_fk REFERENCES MEMBERS(nickname),
    saddr VARCHAR2(1000),
    title VARCHAR2(300)
);


CREATE TABLE care(
    cno number(4) primary key,
    pno NUMBER(8) CONSTRAINT pno_fk REFERENCES MYPET(pno),
    unickname varchar2(30) not null CONSTRAINT u__nickname_fk REFERENCES MEMBERS(nickname),
    sdate date,
    fdate date
);

create table carehistory(
    hno number(4) primary key,
    unickname varchar2(20) not null CONSTRAINT user_nickname__fk REFERENCES MEMBERS(nickname),
    cdate date,
    snickname varchar2(30) not null CONSTRAINT s__nickname_fk REFERENCES MEMBERS(nickname),
    pno NUMBER(8) CONSTRAINT pno__fk REFERENCES MYPET(pno),
    content varchar2(1000),
    cfile varchar2(1000)
);


CREATE TABLE INTRODUCE (
  nickname VARCHAR2(20) CONSTRAINT nickname_Fk REFERENCES MEMBERS(nickname),
  ino NUMBER PRIMARY KEY,
  title VARCHAR2(30) NOT NULL,
  short_content VARCHAR2(300) NOT NULL,
  addr VARCHAR2(1000),
  category VARCHAR2(20) NOT NULL,
  content VARCHAR2(3000) NOT NULL,
  license VARCHAR2(100),
  ifile VARCHAR2(1000)
);


CREATE TABLE chat (
  cno NUMBER PRIMARY KEY,
  cnt NUMBER,
  unickname VARCHAR2(30),
  cdate DATE NOT NULL
);


CREATE TABLE members (
    mid VARCHAR2(20),
    nickname varchar2(50) PRIMARY KEY,
    pwd varchar2(50) NOT NULL,
    email varchar2(30),
    uname varchar2(10) NOT NULL,
    tel1 VARCHAR2(3) NOT NULL,
    tel2 VARCHAR2(4) NOT NULL,
    tel3 VARCHAR2(4) NOT NULL,
    birthday varchar2(15),
    addr1 varchar2(1000) NOT NULL,
    addr2 varchar2(1000) NOT NULL,
    slicense varchar2(50),
    lfile VARCHAR2(200)
);

CREATE TABLE used (
    usedno NUMBER(8) PRIMARY KEY,
    unickname VARCHAR2(20) CONSTRAINT unickname_fk REFERENCES MEMBERS(nickname),
    snickname varchar2(30) CONSTRAINT snickname_fk REFERENCES MEMBERS(nickname),
    sdate date NOT NULL,
    fdate date NOT NULL
);

COMMIT;

CREATE TABLE reple (
    rno NUMBER(8) PRIMARY KEY,
    ino NUMBER(8) UNIQUE NOT NULL CONSTRAINT ino__fk REFERENCES INTRODUCE(ino),
    nickname VARCHAR2(20) CONSTRAINT user__nickname_fk REFERENCES MEMBERS(nickname),
    wdate DATE NOT NULL,
    title VARCHAR2(30) NOT NULL,
    content VARCHAR2(300) NOT NULL,
    rfile VARCHAR2(1000),
    star VARCHAR2(5) NOT NULL
);

CREATE TABLE re_reple(
    rrno NUMBER(8) PRIMARY KEY,
    rno NUMBER(8) CONSTRAINT rno_fk REFERENCES REPLE(rno),
    nickname VARCHAR2(20) CONSTRAINT user__nickname__fk REFERENCES MEMBERS(nickname),
    content VARCHAR2(300) NOT NULL,
    wdate DATE NOT NULL
);

commit;

ALTER TABLE MEMBERS MODIFY(mid NOT NULL);
-- MEMBERS 테이블 mid 컬럼에 NOT NULL 제약조건 추가

ALTER TABLE INTRODUCE ADD service VARCHAR2(300);
-- 이용 가능 서비스 컬럼 추가

ALTER TABLE WISH ADD wno NUMBER(8) PRIMARY KEY;
-- 찜 목록 넘버 추가
COMMIT;
