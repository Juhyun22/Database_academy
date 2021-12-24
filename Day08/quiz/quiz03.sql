# 개발자 채용 공고 
-- 회사(name) | 업종(business) | 기업규모(scale) | 사원수(headcount)	
-- 모집 부분(position) | 담당 업무(responsibilities)	| 자격 요건(qualification)	
-- 근무형태(type) | 근무지역(region) | 급여(salary) | 모집 마감(deadline)

-- 회사, 업종, 기업규모, 사원수 
-- 모집 부분, 담당업무, 자격요건, 근무 형태, 근무지역, 급여, 모집 마감 

# 1. 테이블 생성 
-- 회사, 업종, 기업규모, 사원수 (company)
create table `company`(
	`id` int not null auto_increment primary key
	, `name` varchar(16) not null
    , `business` varchar(16) not null
    , `scale` varchar(8) not null
    , `headcount` int not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

-- 회사 id, 모집 부분, 담당업무, 자격요건, 근무 형태, 근무지역, 급여, 모집 마감 (recruit)
create table `recruit` (
	`id` int not null auto_increment primary key
    , `companyId` int not null
    , `position` varchar(32) not null
    , `responsibilities` varchar(64) not null
    , `qualification` varchar(64) not null
    , `type` char(3) not null
    , `region` varchar(64) not null
    , `salary` int not null
    , `deadline` date 
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 2. 데이터 저장 
-- company
insert into `company`
(`name`, `business`, `scale`, `headcount`)

values
('Cacao', '인터넷 포털', '대기업', 2848),
('Rine', '모바일 무선', '대기업', 1138),
('NG소프트', '컨텐츠 게임', '중견기업', 4430),
('쿠퐁', '쇼핑몰', '중견기업', 5350),
('Naber', '인터넷 포털', '대기업', 4048),
('우와한형제들', '소프트웨어 솔루션', '중견기업', 926);

select * from `company`;

-- recruit
insert into `recruit`
(`companyId`, `position`, `responsibilities`, `qualification`, 
`type`, `region`, `salary`, `deadline`)

values
(1, '안드로이드 개발자', '메신저 앱 개발', 'kotlin 경력 3년 이상', '정규직', '성남시 분당구', 7300, '2026-03-13'),
(1, '안드로이드 개발자', '쇼핑 서비스 개발', 'kotlin 경력 3년 이상', '정규직', '성남시 분당구', 6300, '2026-04-04'),
(1, '웹 back-end 개발자', '이모티콘 샵 API 서버 개발', 'spring 경력 3년 이상', '정규직', '성남시 분당구', 7000, '2026-03-28'),
(2, '아이폰 앱 개발자', '메신져 앱 개발', 'RxSwift 개발 경력 3년 이상', '정규직', '성남시 분당구', 7600, '2026-04-01'),
(2, '웹 back-end 개발자', 'Rine 포스팅 기능 API 개발', 'spring 개발경력 3년 이상', '정규직', '성남시 분당구', 6600, '2026-03-29'),
(3, '게임 개발자', '게임 개발', 'Unreal Engine 개발 5년 이상', '정규직', '성남시 분당구', 8400, '2026-04-20'),
(3, '모바일 게임 개발자', '리뉘쥐 모바일 게임 개발', 'Unreal Engine 개발 가능자', '계약직', '성남시 분당구', 8500, '2026-04-05'),
(4, '웹 back-end 개발자', '오픈마켓 웹 개발', 'spring 개발 가능자', '정규직', '서울시 송파구', 8100, '2026-05-02'),
(4, '웹 front-end 개발자', '오픈마켓 웹 개발', 'react 개발 가능자', '계약직', '서울시 송파구', 9000, '2026-04-10'),
(5, '웹 back-end 개발자', 'Naber 메일 기능 개발', 'spring 개발 경력 5년 이상', '계약직', '성남시 분당구', 9800, '2026-04-20'),
(5, '동영상 플레이어 개발자', '네이버TV 플레이어 개발', '동영상 코덱 기술 개발가능자', '정규직', '성남시 분당구', 7800, '2026-05-01'),
(5, '웹 front-end 개발자', 'Now 웹 개발', 'Vue.js 개발 가능자', '정규직', '성남시 분당구', 7000, '2026-04-15'),
(6, '웹 back-end 개발자', '사내 인트라넷 개발', 'spring 개발경력 3년이상', '계약직', '서울시 송파구', 8800, '2026-04-15'),
(6, '웹 back-end 개발자', '쇼핑 라이브 API 개발', 'spring 개발경력 3년이상', '정규직', '서울시 송파구', 8200, '2026-05-12');

select * from `recruit`;

# 3. 연봉순 정렬 
select A.name, B.position, B.qualification, B.type, B.salary
from `company` as A
join `recruit` as B	
on A.id = B.companyId
order by B.salary desc;

# 4. 복합 조건 
-- 대기업 정규직 연봉 7000만원 이상의 공고를 연봉이 높은 순으로 3개만 출력하세요.
select A.name, A.scale, B.position, B.qualification, B.type, B.salary
from `company` as A
join `recruit` as B
on A.id = B.companyId
where A.scale = '대기업' and B.type = '정규직' and B.salary >= 7000
order by B.salary desc
limit 3;

# 5. 기업별 공고 수 
-- 마감일이 2026년 5월 이전B인, 기업별A 정규직 공고 수B를 출력하세요.
-- 공고수 내림 차순으로 출력하세요.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select A.name, count(*) as count, A.business, A.headcount
from `company` as A
join `recruit` as B
on A.id = B.companyId
where B.deadline < '2026-05-01' and B.type = '정규직'
group by A.id
order by count desc;

# 6. 근무 형태 별 평균 연봉 
-- 중견기업A의 근무 형태B별 평균연봉B을 구하여 출력하세요.
select B.type, avg(B.salary) as salery
from `company` as A
join `recruit` as B
on A.id = B.companyId
where A.scale = '중견기업' 
group by B.type;

# 7. 기업별 평균 연봉
-- 기업별A 평균 연봉B을 구하세요.
-- 단, 근무 지역이 성남시 분당구 이고 평균 연봉이 7300 이상만 출력하세요.
-- 사원수를 기준으로 내림차순으로 출력하세요. 
select A.name, avg(B.salary) as average, A.scale, A.headcount
from `company` as A
join `recruit` as B
on A.id = B.companyId
where B.region = '성남시 분당구' 
group by A.id
having average >= 7300
order by A.headcount desc;












