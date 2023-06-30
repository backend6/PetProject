-- introduce2�� �ϳ� ����� ����������(�����)���� �� �Ұ��� ���������� ����ǰ� ��������ϴ�
-- ������ introduce���� ������ �׸��� �־ �߰� �� �����߽��ϴ�
-- care�� used�� �ߺ��Ǵ� �κ��� �־� used�� �����߽��ϴ� 
   --> �Ϲ�ȸ���� ����� ������������ ��Ÿ���� �κ��� select�� �����ϸ� �� �� �����ϴ�
   --> �� �̸��� ���� �־ �߰��ϰ� �� ��ȣ�� ���� �߽��ϴ�

drop table chat;
drop table carehistory;
drop table care;
drop table wish;
drop table used;
drop table re_reple;
drop table reple;
drop table mypet;
drop table introduce2;
drop table members;

-- 1.ȸ�� ���� --
CREATE TABLE members ( 
    mid VARCHAR2(20) NOT NULL UNIQUE, -- ���̵�
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

-- 2.������ ���� ��� --
CREATE TABLE INTRODUCE2 (
  nickname VARCHAR2(20) CONSTRAINT nickname_Fk REFERENCES MEMBERS(nickname), -- �г���
  title VARCHAR2(300) NOT NULL, -- �� ����
  short_content VARCHAR2(300) NOT NULL, -- ª�� �� ����
  addr VARCHAR2(1000), -- �ּ�
  tag VARCHAR2(300), -- �±�
  service VARCHAR2(300) NOT NULL, -- ����
  content VARCHAR2(3000) NOT NULL, -- ��¥ �� ����
  ifile VARCHAR2(1000) -- ����
);

-- 3.������ ���� �ҷ��ͼ� �Ұ��� �ۼ� --
CREATE TABLE INTRODUCE (
  nickname VARCHAR2(20) CONSTRAINT nickname2_Fk REFERENCES MEMBERS(nickname), -- �г���
  ino NUMBER PRIMARY KEY, -- �� ��ȣ
  title VARCHAR2(30) NOT NULL, -- �� ����
  short_content VARCHAR2(300) NOT NULL, -- ª�� �� ����
  addr VARCHAR2(1000), -- �ּ�
  tag VARCHAR2(300), -- �±�
  service VARCHAR2(300) NOT NULL, -- ����
  content VARCHAR2(3000) NOT NULL, -- ��¥ �� ����
  license VARCHAR2(100), -- ������
  ifile VARCHAR2(1000) -- ����
);

-- 4.�Ϲ� ȸ�� �ݷ����� ���� --
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

-- 5.�Ұ��� ��� --
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

-- 6.����� ��� --
CREATE TABLE re_reple(
    rrno NUMBER(8) PRIMARY KEY, -- ������ ���
    rno NUMBER(8) CONSTRAINT rno_fk REFERENCES REPLE(rno), -- ���� ��ȣ
    nickname VARCHAR2(20) CONSTRAINT user__nickname__fk REFERENCES MEMBERS(nickname), -- ������ �ܻ�� �г���
    content VARCHAR2(300) NOT NULL, -- ���� ��� ����
    wdate DATE NOT NULL -- ��¥
);

-- 7.���� ���� --
CREATE TABLE used (
    unickname VARCHAR2(20) CONSTRAINT unickname_fk REFERENCES MEMBERS(nickname), -- ����� �г���
    snickname varchar2(30) CONSTRAINT snickname_fk REFERENCES MEMBERS(nickname), -- ����� �г���
    pname varchar2(30), -- ������� �ݷ����� �̸�
    sdate date NOT NULL, -- ���� �̿� ���۳�¥
    fdate date NOT NULL -- ���� �̿� �� ��¥
);

-- 8. ���� --
CREATE TABLE wish(
    unickname VARCHAR2(20) UNIQUE NOT NULL CONSTRAINT user_nickname_fk REFERENCES MEMBERS(nickname), -- ����� �г���
    ino NUMBER(8) UNIQUE NOT NULL CONSTRAINT ino_fk REFERENCES INTRODUCE(ino), -- �Ұ��� ��ȣ
    snickname VARCHAR2(30) CONSTRAINT s_nickname_fk REFERENCES MEMBERS(nickname), -- ����� �г���
    saddr VARCHAR2(1000), -- ����� �ּ�
    title VARCHAR2(300) -- �Ұ��� ����
);

-- 9. ���� ��� ���� --
create table carehistory(
    hno number(4) primary key, -- ���� ��� ��ȣ
    unickname varchar2(20) not null CONSTRAINT user_nickname__fk REFERENCES MEMBERS(nickname), -- ����� �г���
    sdate date, -- ���� �̿� ���۳�¥
    fdate date, -- ���� �̿� �� ��¥
    snickname varchar2(30) not null CONSTRAINT s__nickname_fk REFERENCES MEMBERS(nickname), -- ����� �г���
    pname varchar2(30), -- ������� �ݷ����� �̸�
    content varchar2(1000), -- ���� ��� ����
    cfile varchar2(1000) -- ����
);

-- 10. ä�� --
CREATE TABLE chat (
  cno NUMBER PRIMARY KEY, -- ä�� ��ȣ
  cnt NUMBER, -- ä�� ����
  unickname VARCHAR2(30), -- ����� �г���
  cdate DATE NOT NULL -- ä�� ����
);
