
-- system
create user toy identified by java1234;
grant connect, resource, dba to toy;


-- ToyProject > ddl.sql

-- ?��?��
create table tblUser (
    id varchar2(50) not null,
    pw varchar2(50) not null,
    name varchar2(50) not null,
    email varchar2(100) not null,
    lv char(1) not null,
    pic varchar2(100) default 'pic.png' not null,
    intro varchar2(500) not null,
    ing char(1) default 'y' not null,
    constraint tbluser_pk primary key(id)
);


-- 게시?��
create table tblBoard (
    seq number not null,
    subject varchar2(300) not null,
    content varchar2(4000) not null,
    regdate date default sysdate not null,
    readcount number default 0 not null,
    id varchar2(50) not null,
    constraint tblboard_pk primary key(seq),
    constraint tblboard_fk foreign key(id) references tblUser(id)
);

create sequence seqBoard;


create or replace view vwBoard
as
select 
    seq, subject, id, readcount, content,
    case
        when to_char(sysdate, 'yyyy-mm-dd') = to_char(regdate, 'yyyy-mm-dd') 
            then to_char(regdate, 'hh24:mi:ss')
        else
            to_char(regdate, 'yyyy-mm-dd')
    end as regdate,
    (select name from tblUser where id = tblBoard.id) as name,
    case
        when (sysdate - regdate) < 1 then 1
        else 0
    end as isnew,
    (select count(*) from tblComment where bseq = tblBoard.seq) as ccnt
from tblBoard order by seq desc;


-- ����¡ > rownum Ȱ��
select * from (select a.*, rownum as rnum from vwBoard a) where rnum between 1 and 10;
select * from (select a.*, rownum as rnum from vwBoard a) where rnum between 11 and 20;
select * from (select a.*, rownum as rnum from vwBoard a) where rnum between 21 and 30;



--���
create table tblComment(
    seq number not null,
    content varchar2(1000) not null,
    regdate date default sysdate not null,
    id varchar2(50) not null,       --ȸ��
    bseq number not null,           --�θ�۹�ȣ
    constraint tblcomment_pk primary key(seq),
     constraint tblcomment_fk_id foreign key(id) references tblUser(id),
      constraint tblcomment_fk_bseq foreign key(bseq) references tblBoard(seq)
);

create sequence seqComment;







-- ��Ŀ ���� ���̺�
create table tblMarker(
    seq number primary key, --PK
    lat number not null,    --����(latitude)
    lng number not null     --�浵(longitude)

);

create sequence seqMarker;



-- ��� ���̺�
create table tblPlace(
    seq number primary key,                             --PK
    lat number not null,                                --����(latitude)
    lng number not null,                                --�浵(longitude)
    name varchar2(100) not null,                        --��Ҹ�
    category varchar2(100) default 'default' not null   --��Һз�
);

create sequence seqPlace;