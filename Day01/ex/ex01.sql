# 사람의 정보
-- 주석
/*
여러줄 주석
*/ 
create table `person` (
      `id` int not null auto_increment primary key
    , `name` varchar(10) not null 
    , `birth` smallint not null
    , `hobby` varchar(100) not null
    , `introduce` text -- null을 안붙히면 기본적으로 null 값 허용
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 스키마 정보 보기
desc `person`;

# 테이블 삭제하기
drop table `person`;


