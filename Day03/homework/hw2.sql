# 종합 문제 

# 1. 테이블 생성 
create table `booking` (
	`id` int not null auto_increment primary key,
    `name` varchar(10) not null,
    `headcount` tinyint not null,
    `day` tinyint not null,
    `date` char(10) not null,
    `phoneNumber` varchar(16) not null,
    `state` varchar(5) not null,
    `createdAt` timestamp default current_timestamp,
    `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;


# 2. 데이터 저장 
insert into `booking`
(`name`, `headcount`, `day`, `date`, `phoneNumber`, `state`)

values
('강하늘', '2', '1', '2025-07-21', '010-1234-1111', '대기중'),
('김종국', '4', '1', '2025-08-04', '010-1212-2121', '확정'),
('박명수', '2', '4', '2025-06-12', '010-0000-0000', '취소'),
('마동석', '2', '1', '2025-10-30', '010-1010-0101', '대기중'),
('박나래', '10', '3', '2025-06-23', '010-1111-2222', '확정'),
('혜리', '2', '2', '2025-04-12', '010-9999-9999', '확정'),
('황찬성', '25', '1', '2025-09-11', '010-0000-2222', '확정'),
('탁재훈', '4', '3', '2025-07-12', '010-1111-0000', '대기중'),
('장나라', '2', '1', '2025-09-12', '010-2222-0000', '확정');

select * from `booking`;

# 3. 날짜 조건 
select * from `booking` where `date` > '2025-08-01 00:00:00';
select `name`, `date`, `state` from `booking` 
where `date` > '2025-08-01 00:00:00';

# 4. 복합 조건
select `name`, `headcount`, `day`, `state` from `booking` 
where `state` = '확정' and (`headcount` >= 4 or `day` >= 2);

# 5. 카운트 
select count(*) from `booking` where `day` = 1 and `state` = '대기중';

# 6. 예약 상태 변경 
select * from `booking` where `name` = '마동석' or `name` = '탁재훈';
update `booking` set `state` = '취소', `updatedAt` = now()
where `name` = '마동석' or `name` = '탁재훈';

# 7. 취소 삭제
select * from `booking` where `state` = '취소';
delete from `booking` where `state` = '취소'; 

select * from `booking`;






