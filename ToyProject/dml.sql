
-- ToyProject > dml.sql

-- ??
insert into tblUser (id, pw, name, email, lv, pic, intro, ing)
    values ('hong', '1111', '?κΈΈλ', 'hong@gmail.com'
        , '1', default,  '?λ°λ?? κ³΅λ??? ?????€.', default);
        
select * from tblUser;

update tblUser set ing = 'y';

commit;



insert into tblBoard (seq, subject, content, regdate, readcount, id)
    values (seqBoard.nextVal, 'κ²μ????€.', '?΄?©???€.', default, default, 'hong');

select * from tblBoard;

delete from tblBoard where seq in (2, 3);

commit;


select * from vwBoard;

update tblBoard set regdate = regdate - 1 where seq <= 6;

commit;


select * from tblUser;

select * from tblMarker;

select * from tblPlace;