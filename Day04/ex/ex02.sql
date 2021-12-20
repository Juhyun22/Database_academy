-- 테이블 생성
create table `entrant` (
	`id` int not null auto_increment primary key,
    `name` varchar(10) not null,
    `license` varchar(10) not null,
    `score` int not null
) ENGINE= InnoDB default charset=utf8mb4;

insert into `entrant` 
(`name`, `license`, `score`)

values
('신보람', '정보처리기사', 87),
('김바다', '컴퓨터활용능력', 95),
('김태형', '정보처리기사', 99),
('박지민', '컴퓨터활용능력', 68),
('신보람', '컴퓨터활용능력', 78),
('김남준', '정보처리산업기사', 40),
('정호석', '컴퓨터활용능력', 99),
('민윤기', '컴퓨터활용능력', 100),
('김바다', '정보처리산업기사', 78),
('김바다', '정보처리기사', 82);

-- distinct - 중복제거 (진짜 중복 제거)
select distinct `name` from `entrant`;

-- group by - 그룹화 ()
select `name` from `entrant`
group by `name`;

# 자격증의 종류 
select `license` from `entrant`
group by `license`;

-- 사람 별 응시 시험 개수 구하기 
select `name`, count(*) from `entrant` 
group by `name`;

-- 자격증 종류별 점수 합계 구하기 
-- 자격증 종류별 점수 합계
select `license`, sum(`score`) AS `sum_score` from `entrant`
group by `license`;

-- 자격증 종류별 점수 평균 
select `license`, avg(`score`) AS `sum_score` from `entrant`
group by `license`;

# having -- group by 된 결과에 조건 붙이기 
-- 자격증 시험을 2개 이상 응시한 사람의 이름 출력하기 
select `name`, count(*) as cnt from `entrant`
group by `name`
having count(*) >= 2;

-- 자격증 종류별 평균 점수가 80점이 넘는 자격증 출력하기 
select `license`, avg(`score`) as `average` from `entrant`
group by `license`
having `average` >= 80;

