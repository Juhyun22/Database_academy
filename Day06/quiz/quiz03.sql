# 1. 리뷰 테이블 나누기 
# 가게 / 메뉴 / 리뷰 이렇게 세 파트로 나눠주는 것이 좋음 
create table `new_store` (
	`id` int not null auto_increment primary key
    , `store` varchar(32) not null
    , `phoneNumber` varchar(16) not null
    , `address` varchar(64) not null
    , `businessNumber` varchar(32) not null
    , `introduce` text
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

create table `new_review` (
	`id` int not null auto_increment primary key
    , `storeId` int not null
    , `menu` varchar(32) not null
    , `userName` varchar(16) not null
    , `point` decimal(2,1) not null
    , `review` text
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 2. Insert
insert into `new_store`
(`store`, `phoneNumber`, `address`, `businessNumber`, `introduce`)

values 
('교촌치킨', '02-000-0000', '서울시 서초구', '111-111-1111', '항상 맛있는 닭을 선사 합니다.'),
('BHC', '02-111-0000', '서울시 서초구', '111-222-1111', '전지현씨 BHC'),
('버거킹', '02-222-1111', '서울시 서초구', '333-222-12222', '맥도날드 가지말고 여기로와요.');

insert into `new_review`
(`storeId`, `menu`, `userName`, `point`, `review`)

values
(1, '오리지날 콤보', '이병헌', 4.5, '콤보는 항상 진리입니다.'),
(2, '핫후라이드', '전지현', 5.0, null),
(2, '뿌링클', '이정재', 3.5, '내가 뿌링끌 상인가?'),
(3, '와퍼세트', '이병헌', 4.0, '패티 너무 좋아요'),
(1, '오리지날 콤보', '맛있으면짖는개', 4.5, '왈왈왈!! 왈왈!'),
(2, '뿌링클', '전지현', 5.0, null);

# 3. 리뷰 출력
select `menu`, `userName`, `point`, `review` from `new_review` 
where `storeId` = 1;





