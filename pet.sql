-- 처음에 만든 테이블이랑 조금 변경돼서 순서대로 drop하고 순서대로 create 했습니당
-- 이대로 쭉 실행시키면 변경사항 적용돼요 ! (reple 테이블 조금 변경됐어요 + sequence 만들었습니다)
-- 제가 넣은 데이터는 members & INTRODUCE & reple & re_reple 입니당

-- 일반회원 마이페이지에서 "리뷰 쓰기" 누르면 리뷰 쓰는 페이지 나오고, 
-- (근데 마이페이지 제 페이지가 아니라 수정 안했어요) 
-- http://localhost:9090/app/reviewBoardWrite 경로로 하면 나옵니당

-- 거기서 데이터 넣으면 여기 reple로 들어가요 ! (미리 사진 몇개 넣어놓으면 메인페이지에서 뜹니당)
-- 그리고 메인페이지에서는 reple에서 데이터 갖고와서 최근 후기 4개가 차례대로 메인에 뜹니다 !

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
    mid VARCHAR2(20), -- 아이디
    nickname varchar2(50) PRIMARY KEY, -- 닉네임
    pwd varchar2(50) NOT NULL, -- 비밀번호
    email varchar2(30), -- 이메일
    uname varchar2(10) NOT NULL, -- 이름
    tel1 VARCHAR2(3) NOT NULL, -- 번호1
    tel2 VARCHAR2(4) NOT NULL, -- 번호2
    tel3 VARCHAR2(4) NOT NULL, -- 번호3
    birthday varchar2(15), -- 생일
    addr1 varchar2(1000) NOT NULL, -- 주소1
    addr2 varchar2(1000) NOT NULL, -- 주소2
    slicense varchar2(50), -- 전문가
    lfile VARCHAR2(200) -- 파일
);

-- 2 --
CREATE TABLE INTRODUCE (
  nickname VARCHAR2(20) CONSTRAINT nickname_Fk REFERENCES MEMBERS(nickname), -- 닉네임
  ino NUMBER PRIMARY KEY, -- 글 번호
  title VARCHAR2(30) NOT NULL, -- 글 제목
  short_content VARCHAR2(300) NOT NULL, -- 짧은 글 내용
  addr VARCHAR2(1000), -- 주소
  category VARCHAR2(20) NOT NULL, -- 카테고리
  content VARCHAR2(3000) NOT NULL, -- 진짜 글 내용
  license VARCHAR2(100), -- 전문가
  ifile VARCHAR2(1000) -- 파일
);

-- 3 --
CREATE TABLE mypet(
    nickname VARCHAR2(20) UNIQUE NOT NULL CONSTRAINT u_nickname_fk REFERENCES MEMBERS(nickname), --닉네임 
    pname VARCHAR2(20), -- 펫 이름
    species1 VARCHAR2(30), -- 종1
    species2 VARCHAR2(30), -- 종2
    gender VARCHAR2(10), -- 성별
    bday VARCHAR2(10), -- 펫 생일
    weight VARCHAR2(10), -- 펫 몸무게
    particulars VARCHAR2(300), -- 특이사항
    image VARCHAR2(500), -- 펫 사진
    pno NUMBER(8) PRIMARY KEY -- 펫 고유 번호
);

-- 4 --
CREATE TABLE reple (
    rno NUMBER(8) PRIMARY KEY, -- 후기 번호
    ino NUMBER(8) NOT NULL CONSTRAINT ino__fk REFERENCES INTRODUCE(ino), -- 소개 번호
    nickname VARCHAR2(20) CONSTRAINT user__nickname_fk REFERENCES MEMBERS(nickname), -- 후기 단사람 닉네임
    wdate DATE NOT NULL, -- 날짜
    title VARCHAR2(300) NOT NULL, -- 제목 (수정)
    content VARCHAR2(3000) NOT NULL, -- 내용 (수정)
    rfile VARCHAR2(1000), -- 후기 파일
    star VARCHAR2(5) NOT NULL -- 별점
);

-- 5 --
CREATE TABLE re_reple(
    rrno NUMBER(8) PRIMARY KEY, -- 리뷰의 댓글
    rno NUMBER(8) CONSTRAINT rno_fk REFERENCES REPLE(rno), -- 리뷰 번호
    nickname VARCHAR2(20) CONSTRAINT user__nickname__fk REFERENCES MEMBERS(nickname), -- 리뷰댓글 단사람 닉네임
    content VARCHAR2(300) NOT NULL, -- 리뷰 댓글 내용
    wdate DATE NOT NULL -- 날짜
);

-- 6 --
CREATE TABLE used (
    usedno NUMBER(8) PRIMARY KEY, -- 시터 이용 번호
    unickname VARCHAR2(20) CONSTRAINT unickname_fk REFERENCES MEMBERS(nickname), -- 사용자 닉네임
    snickname varchar2(30) CONSTRAINT snickname_fk REFERENCES MEMBERS(nickname), -- 펫시터 닉네임
    sdate date NOT NULL, -- 시터 이용 시작날짜
    fdate date NOT NULL -- 시터 이용 끝 날짜
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
-- MEMBERS 테이블 mid 컬럼에 NOT NULL 제약조건 추가

ALTER TABLE INTRODUCE ADD service VARCHAR2(300);
-- 이용 가능 서비스 컬럼 추가

ALTER TABLE WISH ADD wno NUMBER(8) PRIMARY KEY;
-- 찜 목록 넘버 추가

COMMIT;

-----------------------------sequence-------------------------------
drop sequence reple_seq;
create sequence reple_seq nocache;

drop sequence re_reple_seq;
create sequence re_reple_seq nocache;
----------------------------members 데이터 넣기-----------------------
INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2)
VALUES('펫시터아이디','펫시터닉네임','비밀번호','이메일@naver.com','이름','010','1111','1111','주소1','주소2');

INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2)
VALUES('주인아이디','주인닉네임','비밀번호','주인이메일@naver.com','이름','010','2222','2222','주소1','주소2');

SELECT * FROM MEMBERS;

---------------------------INTRODUCE 데이터 넣기-----------------------

INSERT INTO INTRODUCE (nickname, ino, title, short_content, category, content)
VALUES('펫시터닉네임',10,'소개제목','짧은내용','카테고리','진짜내용');

SELECT * FROM INTRODUCE;

--------------------------reple 데이터 넣기--------------------------

insert into reple(rno, ino, nickname, wdate, title, content, rfile, star)
values (reple_seq.NEXTVAL, 10, '주인닉네임', '2023-06-21', '제목제목', '내용내용', '파일', '별');
insert into reple(rno, ino, nickname, wdate, title, content, rfile, star)
values (reple_seq.NEXTVAL, 10, '주인닉네임', '2023-06-21', '제목제목', '내용내용', '파일', '별');

SELECT * FROM REPLE;

----------------------------re_reple 데이터 넣기----------------------------

insert into re_reple(rrno, rno, nickname, content, wdate)
values (re_reple_seq.NEXTVAL, 1, '펫시터닉네임','맡겨주셔서 감사합니다~', '2023-06-21');
insert into re_reple(rrno, rno, nickname, content, wdate)
values (re_reple_seq.NEXTVAL, 1, '펫시터닉네임','맡겨주셔서 감사합니다~', '2023-06-21');

select * from re_reple;

----------------------------------------------------------------------


------------------- 예림 추가사항 ----------------------------------

-- wish 테이블 wno 시퀀스 추가
CREATE SEQUENCE wno_seq nocache;

-- members 테이블에 idx 컬럼, 시퀀스 추가
-- 아이디 중복체크 하려면 인덱스가 하나 필요해서 넣었습니다.
ALTER TABLE MEMBERS ADD idx NUMBER(8);

create sequence idx_seq nocache;

update members set idx=idx_seq.nextval;

-- members 테이블에 우편번호 post 컬럼 추가 
-- (우편번호 검색 서비스로 주소 입력하려면 필요해서 넣었습니다.)
ALTER TABLE members ADD post VARCHAR2(10);

commit;

------------------------------------------------------------------