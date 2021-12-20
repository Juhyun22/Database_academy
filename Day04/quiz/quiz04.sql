select * from `review`;

# 1. 문자열 찾기 
select * from `review`
where (`userName` = '맛있으면짖는 개' or `userName` = '맛있으면짖는개') 
and (`review` like '왈왈%');

# 2. 정렬하기 
select * from `review` order by `createdAt` desc limit 0, 10;

# 3. 별점 높은 순 
select * from `review` where `storeName` = '교촌치킨' order by `point` desc;

# 4. 가장 낮은 별점
select `userName`, `storeName` from `review` 
order by `point` asc limit 0, 1;

