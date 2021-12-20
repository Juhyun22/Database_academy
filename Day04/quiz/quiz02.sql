-- datetime <- 시간까지 저장 
-- date     <- 년월일만 저장
-- timestamp <- 타임존 정보까지 저장  

create table `booking` (
	`id` int not null auto_increment primary key,
    `name` varchar(10) not null,
    `headcount` smallint not null,
    `day` smallint not null,
    `date` date not null,
    `phoneNumber` varchar(15) not null,
    `state` varchar(4) not null,
    `createdAt` timestamp default current_timestamp,
    `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 2. 데이터 저장 
insert into `booking`
(`name`, `headcount`, `day`, `date`, `phoneNumber`, `state`)

values
('강하늘', 2, 1, '2025-07-21', '010-1234-1111', '대기중'),
('김종국', 4, 1, '2025-08-04', '010-1212-2121', '확정'),
('박명수', 2, 4, '2025-06-12', '010-0000-0000', '취소'),
('마동석', 2, 1, '2025-10-30', '010-1010-0101', '대기중'),
('박나래', 10, 3, '2025-06-23', '010-1111-2222', '확정'),
('혜리', 2, 2, '2025-04-12', '010-9999-9999', '확정'),
('황찬성', 25, 1, '2025-09-11', '010-0000-2222', '확정'),
('탁재훈', 4, 3, '2025-07-12', '010-1111-0000', '대기중'),
('장나라', 2, 1, '2025-09-12', '010-2222-0000', '확정');

select * from `booking`;

# 3. 예약내역 출력 
select `name`, `date`, `state` from `booking` where `date` >= '2025-08-01';

# 4. 확정 중 조건
select `name`, `headcount`, `day`, `state` from `booking`
where `state` = '확정' and (`headcount` >= 4 or `day` >= 2);

# 5. 카운트  
select count(*) AS `count` from `booking`
where `day` = 1 and `state` = '대기중';

# 6. 마동석과 탁재훈의 예약상태를 취소 변경!
select * from `booking` where `name` = '마동석' or `name` = '탁재훈';
select * from `booking` where `name` in('마동석', '탁재훈');

update `booking` set `state` = '취소', `updatedAt` = now() where `name` in('마동석', '탁재훈');

# 7. 예약 상태가 취소
select * from `booking` where `state` = '취소';
delete from `booking` where `state` = '취소';




