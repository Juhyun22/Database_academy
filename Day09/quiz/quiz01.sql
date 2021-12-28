select * from `company`;

select * from `recruit`;

# 3. 연봉순 정렬 
select A.name, B.position, B.qualification, B.type, B.salary
from `company` as A
join `recruit` as B
on A.id = B.companyId
order by B.salary asc;

# 4. 복합 조건 
select A.name, A.scale, B.position, B.qualification, B.type, B.salary
from `company` as A
join `recruit` as B
on A.id = B.companyId
where A.scale = '대기업' and B.type = '정규직' and B.salary >= 7000
order by B.salary desc
limit 3;

# 5. 기업별 공고 수 
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select A.name, count(*) as count, A.business, A.headcount
from `company` as A
join `recruit` as B
on A.id = B.companyId
where B.deadline < '2026-05-01' and B.type = '정규직'
group by A.id
order by count desc;

# 6. 근무 형태별 평균 연봉 
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select B.type, avg(B.salary) as salary
from `company` as A
join `recruit` As B
on A.id = B.companyId
where A.scale = '중견기업' 
group by B.type;

# 7. 기업별 평균 연봉 
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select A.name, avg(B.salary) as salary, A.scale, A.headcount
from `company` as A
join `recruit` as B
on A.id = B.companyId
where B.region like '성남시 분당구%'
group by A.id
having salary >= 7300
order by A.headcount desc;






