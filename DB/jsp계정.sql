create table test(
    userid VARCHAR2(30) primary key,
    userpw VARCHAR2(30) not null
);

insert into test values('user01','pass01');
insert into test values('user02','pass02');
insert into test values('user03','pass03');

commit;

create table member(
    ID VARCHAR2(20) PRIMARY KEY,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    GANDER CHAR(1),
    BIRTHDAY CHAR(6),
    EMAIL VARCHAR2(30),
    ZIPCODE CHAR(5),
    ADDRESS VARCHAR2(100),
    DETAILADDRESS VARCHAR2(50),
    HOBBY CHAR(5),
    JOB VARCHAR2(30)
);

COMMENT ON COLUMN MEMBER.ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '이름';
COMMENT ON COLUMN MEMBER.GANDER IS '성별';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '생년월일';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ZIPCODE IS '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.DETAILADDRESS IS '상세주소';
COMMENT ON COLUMN MEMBER.HOBBY IS '취미';
COMMENT ON COLUMN MEMBER.JOB IS '직업';

insert into member values('kim','1234','홍길동','1','980312','kim@naver.com','12345','서울특별시 강남구 한국빌딩','801호','10100','학생');

commit;

create table votelist(
    num number primary key,
    question varchar2(200) not null,
    sdate date,
    edate date,
    wdate date,
    type number default '1' not null,
    active number default '1'
);

create table voteitem (
    listnum number,
    itemnum number,
    item VARCHAR2(50),
    count number DEFAULT '0',
    primary key (listnum, itemnum)
);

create sequence SEQ_VOTE nocache;
commit;


ALTER TABLE member
rename column gander to gender;
commit;

create table reply(
    no number primary key,
    content VARCHAR2(500),
    ref number,
    name VARCHAR2(20),
    rdate date
);

create sequence seq_reply NOCACHE;

insert into reply values(seq_reply.nextval, '첫 댓글이다!!', 1, '김처음', '2025/02/01');
insert into reply values(seq_reply.nextval, '정말 귀엽네요', 1, '기요미', '2025/03/05');
insert into reply values(seq_reply.nextval, '마음에 들어요', 1, '박하트', '2025/03/07');

commit;


