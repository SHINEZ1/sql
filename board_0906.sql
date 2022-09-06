drop table review_board;

create table review_board(
    rnumber       number(8),
    rcategory     varchar2(10),
    rtitle        clob,
    rid           varchar2(30),
    nickname      varchar2(30),
    rcdate        timestamp default systimestamp,
    rudate        timestamp default systimestamp,
    rcontent      clob,
    rhit          number(8),
    rlike         number(5)    
);

  
--기본키
alter table review_board add constraint review_board_rnumber_pk primary key(rnumber);
--unique
alter table review_board add constraint review_board_rid_uk unique (rid);
--not null
alter table review_board modify rcdate constraint review_board_rcdate_nn not null;
alter table review_board modify rudate constraint review_board_rudate_nn not null;


--시퀀스생성
drop sequence review_board_rnumber_seq;
create sequence review_board_rnumber_seq;


--생성
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '공연','가을음악회','유저1','별칭1','재밌어요');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '전시','울산1988','유저2','별칭2','노잼');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '공연','달빛음악회','유저3','별칭3','꼭보세요');


--조회
select rnumber,rcategory,rtitle,nickname,rcdate
from review_board
where rtitle like '%음악%';



--수정
update review_board
  set rcategory = '공연',
      rtitle = '겨울음악회',
      rudate = systimestamp,
      rcontent = '존잼'
where rnumber = '2';


commit;

--삭제
delete from review_board
where rnumber = 2;

----회원번호생성
--select member_member_id_seq.nextval from dual;
--select member_member_id_seq.currval from dual;



rollback;
select *
from review_board;


--조회수
--<update id="updateViewCnt">
--        update board
--        set view_cnt = view_cnt + 1
--        where board_num = #{boardNum};
--</update>
    

drop table review_reply;
create table review_reply(
    r_number     number(8),
    rnumber      varchar2(40),
    rid          varchar2(30),
    nickname     varchar2(30),
    r_content    clob,
    r_cdate      timestamp default systimestamp,
    r_udate      timestamp default systimestamp
);

--primary key
alter table review_reply add constraint review_reply_r_number_pk primary key(r_number);
--unique
alter table review_reply add constraint review_reply_rid_uk unique (rid);
--not null
alter table review_reply modify r_cdate constraint review_reply_r_cdate_nn not null;
alter table review_reply modify r_udate constraint review_reply_r_udate_nn not null;
--fk
--ALTER TABLE review_reply 
--ADD (CONSTRAINT fk_orders1) FOREIGN KEY (customer_sid) REFERENCES customer(sid);


--시퀀스생성
drop sequence review_reply_r_number_seq;
create sequence review_reply_r_number_seq;


--생성
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'test6@test.com','별칭6','재밌어요');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'test7@test.com','별칭7','노잼');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'test8@test.com','별칭8','보지마세요');

--수정
update review_reply
   set r_content = '그저그래요',
       r_udate = systimestamp
 where r_number = '2';

select *
from review_reply;


commit;
 --삭제
delete from review_reply
 where r_number = '2';
