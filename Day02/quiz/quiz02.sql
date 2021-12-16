# 1. 테이블 생성
create table `review` (
	`id` int not null auto_increment primary key
    , `store` varchar(8) not null
    , `menu` varchar(8) null
    , `point` decimal(2, 1) default 3.5      -- 예) 4.5 총 두자리, 소수점 자릿수  
    , `review` varchar(256) null    -- null을 생략해도 null 허용 
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) ENGINE=InnoDB default CHARSET=utf8mb4;

# 2. 컬럼 변경
alter table `review` add column `userName` varchar(32) not null after `menu`;

# 3. 칼럼 타입 수정
alter table `review` change column `store` `storeName` varchar(32) not null;
alter table `review` modify column `menu` varchar(32) not null;

# point 변수 변경
alter table `review` modify column `point` decimal(2, 1) default 3.5 null;

desc `review`;

