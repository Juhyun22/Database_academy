# 1. 부동산 매물 테이블 만들기 
-- 공인중개사 사무실(realtor): 사무실 이름, 사무실 연락처, 사무실 주소, 등급, 
-- 매물 정보(real estate): 사무실 id, 매물 주소, 매물 면적, 거래 종류, 거래 가격, 월세

# 공인중개사 사무실 
create table `realtor` (
	`id` int not null auto_increment primary key
    , `office` varchar(32) not null
    , `phoneNumber` varchar(16) not null
    , `address` varchar(64) not null
    , `grade` varchar(8) not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 매물 정보 데이터 
create table `real_estate` (
	`id` int not null auto_increment primary key
    , `realtorId` int not null
    , `address` varchar(64) not null
    , `area` int not null
    , `type` char(2) not null
    , `price` int not null
    , `rentPrice` int null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 2. 정보 입력
# 부동산
insert into `realtor`
(`office`, `phoneNumber`, `address`, `grade`)

values
('황금 부동산', '02-300-2000', '서울시 동작구', '안심중개사'),
('대박 공인중개사', '02-000-7777', '서울시 서초구', '일반중개사');

select * from `realtor`;

# 매물 
insert into `real_estate` 
(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)

values
(1, '레미얀 레이크 아파트 301동 905호', 84, '전세', 40000, null),
(2, '레알편한세상 시티 505동 101호', 110, '매매', 120000, null),
(1, '롱데캐슬 101동 402호', 87, '월세', 20000, 200),
(1, '슼뷰 오피스텔 1210호', 55, '월세', 10000, 100),
(2, '푸르지용 리버 203동 804호', 123, '매매', 170000, null);

select * from `real_estate`;



# 3. 매물 찾기 
-- 수정 
update `realtor` set `office` = '황금 부동산' where `id` = 1;
-- 황금부동산의 월세 매물 
select * from `realtor` where `office` = '황금 부동산'; -- id: 1, 황금 부동산, 02-300-2000
select '황금 부동산', '02-300-2000', `address`, `price`, `rentPrice` 
from `real_estate` where `realtorId` = 1 and `type` = '월세';

# 4. 옵션 리스트 
create table `option`(
	`id` int not null auto_increment primary key
    , `realEstateId` int not null
    , `option` varchar(8)
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

insert into `option`
(`realEstateId`, `option`)

values
(1, '에어컨'),
(2, '세탁기'),
(2, '냉장고'),
(4, '옷장');

select * from `option`;

# batch     1000


select `office`, `phoneNumber`,realtor.address , real_estate.address, `price`, `rentPrice` 
from `realtor`, `real_estate` where `realtorId` = 1 and `type` = '월세';


