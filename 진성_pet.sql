-- introduce2를 하나 만들어 마이페이지(펫시터)에서 내 소개를 등록했을경우 저장되게 만들었습니다
-- 원래의 introduce에도 부족한 항목이 있어서 추가 및 변경했습니다
-- care와 used가 중복되는 부분이 있어 used로 통일했습니다 
   --> 일반회원과 펫시터 마이페이지에 나타나는 부분은 select시 조절하면 될 것 같습니다
   --> 펫 이름이 빠져 있어서 추가하고 펫 번호는 삭제 했습니다

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

-- 1.회원 정보 --
CREATE TABLE members ( 
    mid VARCHAR2(20) NOT NULL UNIQUE, -- 아이디
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

-- 2.전문가 정보 등록 --
CREATE TABLE INTRODUCE2 (
  nickname VARCHAR2(20) CONSTRAINT nickname_Fk REFERENCES MEMBERS(nickname), -- 닉네임
  title VARCHAR2(300) NOT NULL, -- 글 제목
  short_content VARCHAR2(300) NOT NULL, -- 짧은 글 내용
  addr VARCHAR2(1000), -- 주소
  tag VARCHAR2(300), -- 태그
  service VARCHAR2(300) NOT NULL, -- 서비스
  content VARCHAR2(3000) NOT NULL, -- 진짜 글 내용
  ifile VARCHAR2(1000) -- 파일
);

-- 3.전문가 정보 불러와서 소개글 작성 --
CREATE TABLE INTRODUCE (
  nickname VARCHAR2(20) CONSTRAINT nickname2_Fk REFERENCES MEMBERS(nickname), -- 닉네임
  ino NUMBER PRIMARY KEY, -- 글 번호
  title VARCHAR2(30) NOT NULL, -- 글 제목
  short_content VARCHAR2(300) NOT NULL, -- 짧은 글 내용
  addr VARCHAR2(1000), -- 주소
  tag VARCHAR2(300), -- 태그
  service VARCHAR2(300) NOT NULL, -- 서비스
  content VARCHAR2(3000) NOT NULL, -- 진짜 글 내용
  license VARCHAR2(100), -- 전문가
  ifile VARCHAR2(1000) -- 파일
);

-- 4.일반 회원 반려동물 정보 --
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

-- 5.소개글 댓글 --
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

-- 6.댓글의 댓글 --
CREATE TABLE re_reple(
    rrno NUMBER(8) PRIMARY KEY, -- 리뷰의 댓글
    rno NUMBER(8) CONSTRAINT rno_fk REFERENCES REPLE(rno), -- 리뷰 번호
    nickname VARCHAR2(20) CONSTRAINT user__nickname__fk REFERENCES MEMBERS(nickname), -- 리뷰댓글 단사람 닉네임
    content VARCHAR2(300) NOT NULL, -- 리뷰 댓글 내용
    wdate DATE NOT NULL -- 날짜
);

-- 7.돌봄 일정 --
CREATE TABLE used (
    unickname VARCHAR2(20) CONSTRAINT unickname_fk REFERENCES MEMBERS(nickname), -- 사용자 닉네임
    snickname varchar2(30) CONSTRAINT snickname_fk REFERENCES MEMBERS(nickname), -- 펫시터 닉네임
    pname varchar2(30), -- 사용자의 반려동물 이름
    sdate date NOT NULL, -- 시터 이용 시작날짜
    fdate date NOT NULL -- 시터 이용 끝 날짜
);

-- 8. 찜목록 --
CREATE TABLE wish(
    unickname VARCHAR2(20) UNIQUE NOT NULL CONSTRAINT user_nickname_fk REFERENCES MEMBERS(nickname), -- 사용자 닉네임
    ino NUMBER(8) UNIQUE NOT NULL CONSTRAINT ino_fk REFERENCES INTRODUCE(ino), -- 소개글 번호
    snickname VARCHAR2(30) CONSTRAINT s_nickname_fk REFERENCES MEMBERS(nickname), -- 펫시터 닉네임
    saddr VARCHAR2(1000), -- 펫시터 주소
    title VARCHAR2(300) -- 소개글 제목
);

-- 9. 돌봄 기록 내역 --
create table carehistory(
    hno number(4) primary key, -- 돌봄 기록 번호
    unickname varchar2(20) not null CONSTRAINT user_nickname__fk REFERENCES MEMBERS(nickname), -- 사용자 닉네임
    sdate date, -- 시터 이용 시작날짜
    fdate date, -- 시터 이용 끝 날짜
    snickname varchar2(30) not null CONSTRAINT s__nickname_fk REFERENCES MEMBERS(nickname), -- 펫시터 닉네임
    pname varchar2(30), -- 사용자의 반려동물 이름
    content varchar2(1000), -- 돌봄 기록 내역
    cfile varchar2(1000) -- 파일
);

-- 10. 채팅 --
CREATE TABLE chat (
  cno NUMBER PRIMARY KEY, -- 채팅 번호
  cnt NUMBER, -- 채팅 개수
  unickname VARCHAR2(30), -- 사용자 닉네임
  cdate DATE NOT NULL -- 채팅 일자
);
