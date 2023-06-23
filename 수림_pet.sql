-- ó���� ���� ���̺��̶� ���� ����ż� ������� drop�ϰ� ������� create �߽��ϴ�
-- �̴�� �� �����Ű�� ������� ����ſ� ! (reple ���̺� ���� ����ƾ�� + sequence ��������ϴ�)
-- ���� ���� �����ʹ� members & INTRODUCE & reple & re_reple �Դϴ�

-- �Ϲ�ȸ�� �������������� "���� ����" ������ ���� ���� ������ ������, 
-- (�ٵ� ���������� �� �������� �ƴ϶� ���� ���߾��) 
-- http://localhost:9090/app/reviewBoardWrite ��η� �ϸ� ���ɴϴ�

-- �ű⼭ ������ ������ ���� reple�� ���� ! (�̸� ���� � �־������ �������������� ��ϴ�)
-- �׸��� ���������������� reple���� ������ ����ͼ� �ֱ� �ı� 4���� ���ʴ�� ���ο� ��ϴ� !

drop table chat;
drop table carehistory;
drop table care;
drop table wish;
drop table used;
drop table re_reple;
drop table reple;
drop table mypet;
drop table introduce;
drop table members;

-- 1 --
CREATE TABLE members ( 
    mid VARCHAR2(20), -- ���̵�
    nickname varchar2(50) PRIMARY KEY, -- �г���
    pwd varchar2(50) NOT NULL, -- ��й�ȣ
    email varchar2(30), -- �̸���
    uname varchar2(10) NOT NULL, -- �̸�
    tel1 VARCHAR2(3) NOT NULL, -- ��ȣ1
    tel2 VARCHAR2(4) NOT NULL, -- ��ȣ2
    tel3 VARCHAR2(4) NOT NULL, -- ��ȣ3
    birthday varchar2(15), -- ����
    addr1 varchar2(1000) NOT NULL, -- �ּ�1
    addr2 varchar2(1000) NOT NULL, -- �ּ�2
    slicense varchar2(50), -- ������
    lfile VARCHAR2(200) -- ����
);

-- 2 --
CREATE TABLE INTRODUCE (
  nickname VARCHAR2(20) CONSTRAINT nickname_Fk REFERENCES MEMBERS(nickname), -- �г���
  ino NUMBER PRIMARY KEY, -- �� ��ȣ
  title VARCHAR2(30) NOT NULL, -- �� ����
  short_content VARCHAR2(300) NOT NULL, -- ª�� �� ����
  addr VARCHAR2(1000), -- �ּ�
  category VARCHAR2(20) NOT NULL, -- ī�װ�
  content VARCHAR2(3000) NOT NULL, -- ��¥ �� ����
  license VARCHAR2(100), -- ������
  ifile VARCHAR2(1000) -- ����
);

-- 3 --
CREATE TABLE mypet(
    nickname VARCHAR2(20) UNIQUE NOT NULL CONSTRAINT u_nickname_fk REFERENCES MEMBERS(nickname), --�г��� 
    pname VARCHAR2(20), -- �� �̸�
    species1 VARCHAR2(30), -- ��1
    species2 VARCHAR2(30), -- ��2
    gender VARCHAR2(10), -- ����
    bday VARCHAR2(10), -- �� ����
    weight VARCHAR2(10), -- �� ������
    particulars VARCHAR2(300), -- Ư�̻���
    image VARCHAR2(500), -- �� ����
    pno NUMBER(8) PRIMARY KEY -- �� ���� ��ȣ
);

-- 4 --
CREATE TABLE reple (
    rno NUMBER(8) PRIMARY KEY, -- �ı� ��ȣ
    ino NUMBER(8) NOT NULL CONSTRAINT ino__fk REFERENCES INTRODUCE(ino), -- �Ұ� ��ȣ
    nickname VARCHAR2(20) CONSTRAINT user__nickname_fk REFERENCES MEMBERS(nickname), -- �ı� �ܻ�� �г���
    wdate DATE NOT NULL, -- ��¥
    title VARCHAR2(300) NOT NULL, -- ���� (����)
    content VARCHAR2(3000) NOT NULL, -- ���� (����)
    rfile VARCHAR2(1000), -- �ı� ����
    star VARCHAR2(5) NOT NULL -- ����
);

-- 5 --
CREATE TABLE re_reple(
    rrno NUMBER(8) PRIMARY KEY, -- ������ ���
    rno NUMBER(8) CONSTRAINT rno_fk REFERENCES REPLE(rno), -- ���� ��ȣ
    nickname VARCHAR2(20) CONSTRAINT user__nickname__fk REFERENCES MEMBERS(nickname), -- ������ �ܻ�� �г���
    content VARCHAR2(300) NOT NULL, -- ���� ��� ����
    wdate DATE NOT NULL -- ��¥
);

-- 6 --
CREATE TABLE used (
    usedno NUMBER(8) PRIMARY KEY, -- ���� �̿� ��ȣ
    unickname VARCHAR2(20) CONSTRAINT unickname_fk REFERENCES MEMBERS(nickname), -- ����� �г���
    snickname varchar2(30) CONSTRAINT snickname_fk REFERENCES MEMBERS(nickname), -- ����� �г���
    sdate date NOT NULL, -- ���� �̿� ���۳�¥
    fdate date NOT NULL -- ���� �̿� �� ��¥
);

-- 7 --
CREATE TABLE wish(
    unickname VARCHAR2(20) UNIQUE NOT NULL CONSTRAINT user_nickname_fk REFERENCES MEMBERS(nickname),
    ino NUMBER(8) UNIQUE NOT NULL CONSTRAINT ino_fk REFERENCES INTRODUCE(ino),
    snickname VARCHAR2(30) CONSTRAINT s_nickname_fk REFERENCES MEMBERS(nickname),
    saddr VARCHAR2(1000),
    title VARCHAR2(300)
);

-- 8 --
CREATE TABLE care(
    cno number(4) primary key,
    pno NUMBER(8) CONSTRAINT pno_fk REFERENCES MYPET(pno),
    unickname varchar2(30) not null CONSTRAINT u__nickname_fk REFERENCES MEMBERS(nickname),
    sdate date,
    fdate date
);

-- 9 --
create table carehistory(
    hno number(4) primary key,
    unickname varchar2(20) not null CONSTRAINT user_nickname__fk REFERENCES MEMBERS(nickname),
    cdate date,
    snickname varchar2(30) not null CONSTRAINT s__nickname_fk REFERENCES MEMBERS(nickname),
    pno NUMBER(8) CONSTRAINT pno__fk REFERENCES MYPET(pno),
    content varchar2(1000),
    cfile varchar2(1000)
);

-- 10 --
CREATE TABLE chat (
  cno NUMBER PRIMARY KEY,
  cnt NUMBER,
  unickname VARCHAR2(30),
  cdate DATE NOT NULL
);

ALTER TABLE MEMBERS MODIFY(mid NOT NULL);
-- MEMBERS ���̺� mid �÷��� NOT NULL �������� �߰�

ALTER TABLE INTRODUCE ADD service VARCHAR2(300);
-- �̿� ���� ���� �÷� �߰�

ALTER TABLE WISH ADD wno NUMBER(8) PRIMARY KEY;
-- �� ��� �ѹ� �߰�

COMMIT;

-----------------------------sequence-------------------------------
drop sequence reple_seq;
create sequence reple_seq nocache;

drop sequence re_reple_seq;
create sequence re_reple_seq nocache;
----------------------------members ������ �ֱ�-----------------------
INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2)
VALUES('����;��̵�','����ʹг���','��й�ȣ','�̸���@naver.com','�̸�','010','1111','1111','�ּ�1','�ּ�2');

INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2)
VALUES('���ξ��̵�','���δг���','��й�ȣ','�����̸���@naver.com','�̸�','010','2222','2222','�ּ�1','�ּ�2');

SELECT * FROM MEMBERS;

---------------------------INTRODUCE ������ �ֱ�-----------------------

INSERT INTO INTRODUCE (nickname, ino, title, short_content, category, content)
VALUES('����ʹг���',10,'�Ұ�����','ª������','ī�װ�','��¥����');

SELECT * FROM INTRODUCE;

--------------------------reple ������ �ֱ�--------------------------

insert into reple(rno, ino, nickname, wdate, title, content, rfile, star)
values (reple_seq.NEXTVAL, 10, '���δг���', '2023-06-21', '��������', '���볻��', '����', '��');
insert into reple(rno, ino, nickname, wdate, title, content, rfile, star)
values (reple_seq.NEXTVAL, 10, '���δг���', '2023-06-21', '��������', '���볻��', '����', '��');

SELECT * FROM REPLE;

----------------------------re_reple ������ �ֱ�----------------------------

insert into re_reple(rrno, rno, nickname, content, wdate)
values (re_reple_seq.NEXTVAL, 1, '����ʹг���','�ð��ּż� �����մϴ�~', '2023-06-21');
insert into re_reple(rrno, rno, nickname, content, wdate)
values (re_reple_seq.NEXTVAL, 1, '����ʹг���','�ð��ּż� �����մϴ�~', '2023-06-21');

select * from re_reple;

----------------------------------------------------------------------

commit;

