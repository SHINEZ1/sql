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

  
--�⺻Ű
alter table review_board add constraint review_board_rnumber_pk primary key(rnumber);
--unique
alter table review_board add constraint review_board_rid_uk unique (rid);
--not null
alter table review_board modify rcdate constraint review_board_rcdate_nn not null;
alter table review_board modify rudate constraint review_board_rudate_nn not null;


--����������
drop sequence review_board_rnumber_seq;
create sequence review_board_rnumber_seq;


--����
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '����','��������ȸ','����1','��Ī1','��վ��');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '����','���1988','����2','��Ī2','����');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '����','�޺�����ȸ','����3','��Ī3','��������');


--��ȸ
select rnumber,rcategory,rtitle,nickname,rcdate
from review_board
where rtitle like '%����%';



--����
update review_board
  set rcategory = '����',
      rtitle = '�ܿ�����ȸ',
      rudate = systimestamp,
      rcontent = '����'
where rnumber = '2';


commit;

--����
delete from review_board
where rnumber = 2;

----ȸ����ȣ����
--select member_member_id_seq.nextval from dual;
--select member_member_id_seq.currval from dual;



rollback;
select *
from review_board;


--��ȸ��
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


--����������
drop sequence review_reply_r_number_seq;
create sequence review_reply_r_number_seq;


--����
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'test6@test.com','��Ī6','��վ��');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'test7@test.com','��Ī7','����');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'test8@test.com','��Ī8','����������');

--����
update review_reply
   set r_content = '�����׷���',
       r_udate = systimestamp
 where r_number = '2';

select *
from review_reply;


commit;
 --����
delete from review_reply
 where r_number = '2';
