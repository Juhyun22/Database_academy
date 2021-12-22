select * from `score`;

# 1. 성적 테이블 나누기
# 학생 정보
create table `new_student` (
	`id` int not null auto_increment primary key
    , `name` varchar(32) not null
    , `phoneNumber` varchar(16) not null
	, `email` varchar(32) not null
    , `dreamJob` varchar(16) not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 점수 
# studentId(new_student pk)
create table `new_score` (
	`id` int not null auto_increment primary key
    , `studentId` int not null
    , `year` int not null
    , `semester` tinyint not null
    , `term` char(4) not null
    , `subject` varchar(16) not null
    , `score` int not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 2. Insert
insert into `new_student`
(`name`, `phoneNumber`, `email`, `dreamJob`)

values
('유재석', '01000001111', 'mc_u@naver.com', '래퍼'),
('조세호', '01011110000', 'josep@gmail.com', '변호사');

# 점수 
insert into `new_score`
(`studentId`, `year`, `semester` ,`term`, `subject`, `score`)

values
(1, 2020, 1, '중간고사', '국어', 80),
(1, 2020, 1, '중간고사', '영어', 95),
(1, 2020, 1, '중간고사', '수학', 90),
(2, 2020, 1, '중간고사', '국어', 85),
(2, 2020, 1, '중간고사', '영어', 90),
(2, 2020, 1, '중간고사', '수학', 70);

# 3. 성적 출력
select `year`, `semester`, `term`, `subject`, `score` 
from `new_score` where `studentId` = 2;




