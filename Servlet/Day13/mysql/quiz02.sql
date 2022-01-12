# 1. 테이블 생성 
create table `favorit_url`(
	`id` int not null auto_increment primary key
    , `name` varchar(128) not null
    , `url` text not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 2. 데이터 저장 
insert into `favorit_url`
(`name`, `url`)

values
('마론달', 'http://marondal.com'),
('구글', 'https://google.com'),
('네이버', 'https://naver.com'),
('다음', 'https://daum.com'),
('인스타', 'https://instagram.com');