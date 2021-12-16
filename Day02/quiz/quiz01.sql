# 1. 테이블 생성    
create table `score` (
	`id` int not null auto_increment primary key
    , `name` varchar(8) not null
    , `year` smallint not null
    , `term` char(4) not null
    , `title` varchar(4) not null
    , `score` smallint not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. 칼럼 추가
# 데이터가 있는 상태에서 칼럼을 추가하면 null을 허용해야 한다. 
alter table `score` add column `semester` int not null after `year`;

# 3. 이름 필드 변경
# 1) 이름 필드 수정
-- not null을 누락하면 null 허용으로 바뀌어버리므로 주의!!!
alter table `score` modify column `name` varchar(32) not null;

# 2) 과목 필드 수정
alter table `score` change column `title` `subject` varchar(16) not null;

# year 변수 바꾸기
alter table `score` modify column `year` smallint not null;
# score 변수 바꾸기  
alter table `score` modify column `score` smallint not null;
# semester 변수 바꾸기
alter table `score` modify column `semester` tinyint not null;

desc `score`;







