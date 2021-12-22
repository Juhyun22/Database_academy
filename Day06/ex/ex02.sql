select * from `user`;

-- 취미가 '노래'인 사람들 조회 
select * from `user` where `hobby` like '%노래%'; -- 무조건 full scan.. not good 

-- 취미만 따로 저잘할 수 있는 테이블을 만드는게 효율적
-- 누구의 취미인지 알 수 있어야 함 
-- user table은 유일한 사람들의 정보의 모임
-- hobby table은 어떤 사람의 고유번호(key)와 취미 정보를 들고 있어야 함 

# new table!
create table `new_user` (
	`id` int not null auto_increment primary key
    , `name` varchar(10) not null
    , `yyyymmdd` char(8) not null
    , `introduce` text
    , `email` varchar(32)
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
    ) engine=InnoDB default charset=utf8mb4;
    
create table `hobby` (
	`id` int not null auto_increment primary key
    , `userId` int not null -- userId는 new_user table의 id(pk) 값 
    , `hobby` varchar(50) not null 
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 데이터 입력
-- 사람 정보
insert into `new_user` 
(`name`, `yyyymmdd`,  `email`, `introduce`, `createdAt`, `updatedAt`)
values 
('신보람', '19991108', 'sbr@kakao.com', '안녕하세요. 저는 누구일까요?', now(), now()),
('김바다', '20191023', 'marobiana@naver.com', '야옹야옹~~', now(), now());

-- 취미 정보
select * from new_user;

-- dummy data 추가
insert into `hobby` 
(`userId`, `hobby`,  `createdAt`, `updatedAt`)
values
(1, '독서', now(), now()),
(1, '노래', now(), now()),
(1, '영화보기', now(), now()),
(1, '요가', now(), now()),
(2, '사냥하기', now(), now()),
(2, '그루밍', now(), now()),
(2, '스크래치', now(), now()),
(2, '노래', now(), now());

-- 취미 정보 
select * from `hobby` where `userId` = 1;

