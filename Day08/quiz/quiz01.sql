# 1. Inner join 
select * from `store`;
select * from `new_review`;

select A.*, B.* 
from `store` as A
join `new_review` as B
on A.id = B.storeId;

# 2. Left join
select A.*, B.*
from `store` As A
left join `new_review` As B
on A.id = B.storeId;

# 3. 낮은 리뷰 추출 
-- 배달삼겹가게(store) 리뷰(new_review) 
-- 출력 칼럼은 all new_review 
select B.menu, B.userName, B.point, B.review
from `store` as A
join `new_review` as B 
on A.id = B.storeId
where A.name = '배달삼겹' and B.point < 3.0
order by B.point asc;

# 4. 리뷰 내용 있는 리스트 
-- 이병헌 리뷰(new_review) 
-- 출력은 (store, new_review)
select A.name, B.menu, B.point, B.review
from `store` as A
join `new_review` as B
on A.id = B.storeId
where B.userName = '이병헌' and B.point >= 4.5 and B.review is not null;

# 5. 맛집 랭킹 
-- 별점 평균(new_review)이 높은 순서대로 5개만 출력하세요.
-- 출력 가게이름, 전화번호(store), 평균별점(new_review).. group 
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select A.*, B.*, avg(B.point) as average
from `store` as A
join `new_review` as B
on A.id = B.storeId
group by A.id
order by average desc
limit 5;

