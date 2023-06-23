insert into members
values('yjh1004', '천사', 'yjh1004', 'yjh1004@naver.com', '윤정한', '010', '1234', '1234',
'1995-10-04', '서울시 강남구 논현동', '10-4번지', '훈련사', null);

insert into introduce 
values ('천사', 1, '따뜻한 펫시터', '아늑하고, 편안한, 내 집 같은 펫시터 하우스에 초대합니다!',
'서울시 강남구 논현동', '#3인가구', 
'펫시터를 소개합니다아 저는 귀여운 한 명의 아들을 두고 있는 펫시터입니다. 어쩌구 저쩌구~~~~~~~',
'훈련사', null, 'walk');


insert into members
values('iamim', '아이엠', 'iamim', 'iamim@naver.com', '임창균', '010', '5678', '5678',
'1995-05-02', '논현동', '9번지', '훈련사', null);

insert into introduce 
values ('아이엠', 2, '따뜻한 펫시터', '아늑하고 편안한 펫시터 하우스에 초대합니다!',
'논현동', '#아파트', 
'펫시터를 소개합니다아 저는 귀여운 두 명의 딸을 두고 있는 펫시터입니다. 어쩌구 저쩌구~~~~~~~',
'훈련사', null, 'walk');


insert into members
values('cs1234', '김철수', 'cs1234', 'cs1234@naver.com', '임창균', '010', '1234', '5678',
'1995-05-02', '반포동', '5번지', '훈련사', null);

insert into introduce 
values ('김철수', 3, '따뜻한 펫시터', '아늑하고 편안한 펫시터 하우스에 초대합니다!',
'반포동', '#아파트', 
'펫시터를 소개합니다아 저는 귀여운 두 명의 딸을 두고 있는 펫시터입니다. 어쩌구 저쩌구~~~~~~~',
'훈련사', null, 'walk');

commit;

select * from members;
select * from introduce;
