desc `review`;
select * from `review`;

# 1. 별점 조건
select count(*) from `review` where `point` <= 3.0;

# 2. 복합 조건
# 왜 안되는 것인가... null이 아니면 is not null!!!!
select `menu`, `review`, `point` from `review` 
where `storeName` = '교촌치킨' and `review` is not null or `storeName` = '교촌 치킨';

# 3. 개수 세기
select count(*) from `review` where `userName` = '전지현' and `storeName` = 'BHC';

# 4. 날짜 조건
-- >= '2025-03-11 00:00:00'으로 해도 됨!
select count(*) from `review` 
where `userName` = '강동원' and `createdAt` > '2025-03-10 23:59:59';

# 5. 복합 조건
select count(*) from `review` 
where `userName` = '이정재' and (`review` is not null or `point` >= 4.5);