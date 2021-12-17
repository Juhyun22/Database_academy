# 테이블 전체 조회: 데이터가 많을 때 위험. 
select * from `user`;

select `id`, `name`, `yyyymmdd` from `user`;

-- 테이블 명에 별칭 붙이기: 워크벤치 프로그램에서 보기에는 바뀌는건 없다. 
select * from `user` AS `person`;

-- 컬럼명에 별칭 붙이기: 조회 후에 컬럼명이 변경되어 보임(실제로 테이블 변경은 아님) 
select `id`, `name` AS `이름`, `yyyymmdd` AS `생년월일`, `hobby`, `introduce`
from `user`;

-- 특정 칼럼 중복값 제거 - 예) 동명이인 제거
select distinct `name` from `user`;

-- 데이터의 개수 조회
select count(*) from `user`;
select count(`name`) from `user`;
select count(1) from `user`;

# 조건에 일치하는 데이터 조회 
-- id가 3인 데이터 조회
select * from `user` where `id` = 3;

-- 이름이 '신바다'인 사용자의 생년월일 조회
select `yyyymmdd` from `user` where `name` = '신바다';

-- 이름이 '신바다'가 아닌 사용자의 데이터 조회
select * from `user` where `name` != '신바다';

-- 데이터의 생성일이 특정일 이후인 데이터들 조회
select * from `user` where `createdAt` > '2021-12-15 00:00:00';

-- 자기소개가 없는(null인) 데이터 조회 
select * from `user` where `introduce` is null;

-- 자기소개가 있는(null이 아닌) 데이터 조회 
select * from `user` where `introduce` is not null;


# id가 2, 3, 4인 데이터 조회 
select * from `user` where `id` in(2, 3, 4);

# id가 3번이거나 4번인 데이터 조회 -- 논리 연산자 사용
select * from `user` where `id` = 3 or 4;

# 이름이 '신바다'이면서 취미가 '사냥하기'인 데이터 조회 
select * from `user` where `name` = '신바다' and `hobby` = '사냥하기';








