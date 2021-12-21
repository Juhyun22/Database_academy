-- 테이블을 생성하면서 인덱스 등록하기 
create table `student`(
	`id` int not null auto_increment,
    `name` char(4) not null,
    `address` varchar(50) not null,
    `department` enum('국문과', '영문과', '컴퓨터공학과', '전자공학과', '물리학과') not null,
    `introduction` text not null,
    `studentId` char(255) not null,
    primary key (`id`),
    unique key `idx_studentId` (`studentId`) using btree,
    key `idx_department` (`department`),
    key `idx_department_address` (`department`, `address`)
) engine=InnoDB default charset=utf8mb4;

drop table `student`;

-- 테이블 생성과 키 생성
create table `student`(
	`id` int not null auto_increment primary key,
    `name` char(4) not null,
    `address` varchar(50) not null,
    `department` enum('국문과', '영문과', '컴퓨터공학과', '전자공학과', '물리학과') not null,
    `introduction` text not null,
    `studentId` char(255) not null
) engine=InnoDB default charset=utf8mb4;

-- unique key: 'studentId' 칼럼에는 중복된 값이 들어갈 수 없다.
alter table `student` add unique index `idx_studentId` (`studentId`) using btree;

-- 일반 인덱스 추가 
alter table `student` add index `idx_department` (`department`);

-- 일반 복합인덱스 추가 
alter table `student` add index `idx_department_address` (`department`, `address`);







