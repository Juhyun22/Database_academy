select * from `realtor`; -- A
select * from `real_estate`; -- B

# 1. 매물 정보 확인 
-- 매매 13억 이하(130,000만원) 매물을 면적 내림차순으로 출력하세요. (real_estate)
-- 출력 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호(realtor), 매물 주소, 면적, 금액(real_estate) 입니다.
select A.office, A.phoneNumber, B.address, B.area, B.price
from `realtor` as A
join `real_estate` as B
on A.id = B.realtorId
where B.type = '매매' and B.price <= 130000
order by B.area desc;

# 2. 안심 중개사 
-- '안심중개사' 등급의 공인중개사가 등록한 월세 매물을 월세 금액 오름차순으로 출력하세요.
-- 출력 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 매물 주소, 보증금액, 월세금액, 면적 입니다.
-- 보증금액 컬럼: price
-- 월세금액 컬럼: rentPrice
select A.office, A.phoneNumber, B.address, B.price, B.rentPrice, B.area 
from `realtor` as A
join `real_estate` as B
on A.id = B.realtorId
where A.grade = '안심중개사' and B.type = '월세'
order by B.rentPrice asc;

# 3. 매물 확인 
-- 서울시 서초구에 있는 공인중개사 사무실 매물 중 전세 7억 이하(70,000만원) 매물을 보증금액 오름차순으로 출력하세요.
-- 출력 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 주소, 보증금액, 면적 입니다.
select A.office, A.phoneNumber, A.address, B.address, B.price, B.area
from `realtor` as A
inner join `real_estate` as B
on A.id = B.realtorId
where A.address like '서울시 서초구%' and B.type = '전세' and B.price <= 70000
order by B.price asc;

# 4. 공인중개사 매물 개수 
-- 공인중개사 별로 매물 개수를 내림차순으로 출력하세요.
-- 출력 컬럼은 공인중개사 사무실명, 매물 개수 입니다.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select A.office, count(*) as count
from `realtor` as A
join `real_estate` as B
on A.id = B.realtorId
group by A.id
order by count desc;

# 5. 매물 확인 
-- '대박공인중개사'A 매물중 매매B, 전세B 중 100평방미터B 이상의 매물을 금액 오름차순B으로 출력하세요.
-- 출력 컬럼은 공인중개사 사무실명A, 공인중개사 사무실 전화번호A, 매물 주소B, 금액B, 면적B 입니다.
select A.office, A.phoneNumber, B.address, B.price, B.area
from `realtor` as A
join `real_estate` as B
on A.id = B.realtorId
where A.office = '대박공인중개사' 
and B.type in ('전세', '매매')
and B.area >= 100;

