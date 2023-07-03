-- 리뷰 쓰기 페이지는 http://localhost:9090/app/reviewBoardWrite 경로로 하면 나옵니다

drop table price;
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

-- 6.돌봄 일정 --
CREATE TABLE used (
    uno NUMBER(8) NOT NULL, -- 돌봄 일정 번호
    unickname VARCHAR2(20) CONSTRAINT unickname_fk REFERENCES MEMBERS(nickname), -- 사용자 닉네임
    snickname varchar2(30) CONSTRAINT snickname_fk REFERENCES MEMBERS(nickname), -- 펫시터 닉네임
    pname varchar2(30), -- 사용자의 반려동물 이름
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

-- 8 used랑 겹쳐서 삭제 --
--CREATE TABLE care(
--    cno number(4) primary key,
--    pno NUMBER(8) CONSTRAINT pno_fk REFERENCES MYPET(pno),
--    unickname varchar2(30) not null CONSTRAINT u__nickname_fk REFERENCES MEMBERS(nickname),
--    sdate date,
--    fdate date
--);

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

-- 11 새로 추가 --
create table price(
    ino NUMBER(8) NOT NULL CONSTRAINT ino__fk REFERENCES INTRODUCE(ino), -- 소개글 번호
    nickname varchar2(20) not null constraint p_nickname_fk references members(nickname),
    sPetDay number(5),
    sPetAll number(5),
    mPetDay number(5),
    mPetAll number(5),
    lPetDay number(5),
    lPetAll number(5)
);

-------------------------------------------------------수정

ALTER TABLE MEMBERS MODIFY(mid NOT NULL);
-- MEMBERS 테이블 mid 컬럼에 NOT NULL 제약조건 추가

ALTER TABLE INTRODUCE ADD service VARCHAR2(300);
-- INTRODUCE 테이블 이용 가능 서비스 컬럼 추가

ALTER TABLE WISH ADD wno NUMBER(8) PRIMARY KEY;
-- WISH 테이블 찜 목록 넘버 추가

ALTER TABLE reple MODIFY title VARCHAR2(300);
-- reple 테이블에서 제목 길이 늘리기 

ALTER TABLE reple MODIFY content VARCHAR2(3000);
-- reple 테이블에서 내용 길이 늘리기 

ALTER TABLE members ADD idx NUMBER(8);
-- members 테이블에 idx 컬럼 추가 

ALTER TABLE members ADD post VARCHAR2(10);
-- members 테이블에 post 컬럼 추가 

ALTER TABLE mypet DROP CONSTRAINT SYS_C007737;
-- mypet 테이블 nickname 컬럼에 unique 제약조건 때문에, 한 유저가 여러 펫 정보 등록이 안돼서 unique 제약조건 지웠습니다

ALTER TABLE members ADD ucheck VARCHAR2(4);
-- 펫시터인지 일반회원인지 구분하는 컬럼 추가

ALTER TABLE used ADD uno NUMBER(8) PRIMARY KEY;
-- WISH 테이블 찜 목록 넘버 추가

COMMIT;
-----------------------------sequence-------------------------------
-- 1. members
drop sequence idx_seq;
create sequence idx_seq nocache;
update members set idx = idx_seq.nextval;

-- 2. introduce
drop sequence introduce_seq;
CREATE SEQUENCE introduce_seq nocache;
update introduce set ino = introduce_seq.nextval;

-- 3. mypet
drop sequence mypet_seq;
CREATE SEQUENCE mypet_seq nocache;
update mypet set pno = mypet_seq.nextval;

-- 4. reple
drop sequence reple_seq;
create sequence reple_seq nocache;
update reple set rno = reple_seq.nextval;

-- 5. re_reple
drop sequence re_reple_seq;
create sequence re_reple_seq nocache;
update re_reple set rrno = re_reple_seq.nextval;

-- 6. used
drop sequence uno_seq;
create sequence uno_seq nocache; -- 돌봄 일정 번호 시퀀스
update uno_seq set uno = uno_seq.nextval;

-- 7. wish
-- 일단 없음

-- 8. care 사라짐
-- 9. carehistory
drop sequence carehistory_seq;
create sequence carehistory_seq nocache;
update carehistory_seq set hno = carehistory_seq.nextval;

-- 10. chat

-- 11. price

---------------------변경사항 다 적용 시, 실행될 데이터 삽입---------------------------------------
-- 수림 데이터
INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2, idx)
VALUES('펫시터아이디','펫시터닉네임','비밀번호','이메일@naver.com','이름','010','1111','1111','주소1','주소2',idx_seq.nextval);

INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2, idx)
VALUES('펫시터아이디2','펫시터닉네임2','비밀번호','이메일@naver.com','이름','010','1111','1111','주소1','주소2',idx_seq.nextval);

INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2, idx)
VALUES('주인아이디','주인닉네임','비밀번호','주인이메일@naver.com','이름','010','2222','2222','주소1','주소2',idx_seq.nextval);

INSERT INTO members (mid, nickname, pwd, email, uname, tel1, tel2, tel3, addr1, addr2, idx)
VALUES('주인아이디2','주인닉네임2','비밀번호','주인이메일@naver.com','이름','010','2222','2222','주소1','주소2',idx_seq.nextval);

SELECT * FROM MEMBERS;

INSERT INTO INTRODUCE (nickname, ino, title, short_content, category, content)
VALUES('펫시터닉네임',introduce_seq.nextval,'소개제목','짧은내용','카테고리','진짜내용');

INSERT INTO INTRODUCE (nickname, ino, title, short_content, category, content)
VALUES('펫시터닉네임2',introduce_seq.nextval,'소개제목','짧은내용','카테고리','진짜내용');

SELECT * FROM INTRODUCE;

----------------------------------------------------------------------
-- 규빈님 데이터 insert (진성님도 nickname '김펫' 추가 필수)
INSERT INTO members 
VALUES('asdff','김펫',1234,'asd@naver.com','김냥이','010','1234','4567','2023-01-01','서울특별시','강남구',null,null, idx_seq.nextval, 12345, 'S');

INSERT INTO introduce 
VALUES('김펫',introduce_seq.NEXTVAL,'따뜻한 펫시터','강아지 돌봐드립니다','서울특별시 강남구 논현동','강아지','강아지를 잘 돌보고 좋아합니다', null, null, null);

COMMIT;

select * from members;
select * from introduce;
