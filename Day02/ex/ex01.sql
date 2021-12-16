desc `person`;

select * from `person`;

-- 테이블 수정하기    
# 1) 테이블 이름 변경
alter table `person` rename `user`;

# 2) email 컬럼 추가 (데이터가 있는 상태에서 컬럼을 추가하면 null 허용을 해야한다.)
alter table `user` add column `email` varchar(16) null after `introduce`;

# too long... db error     db의 사이즈가 작구나!의 에러!
# 3) email 컬럼 수정 : 16 -> 32
alter table `user` modify column `email` varchar(32) null;

# 4) 컬럼 이름/자료형 수정: birth smallint -> yyyymmdd varchar
alter table `user` change column `birth` `yyyymmdd` varchar(16);

alter table `user` modify column `yyyymmdd` char(8);





