select * from `customer`;

-- mysql 옵티마이저 

-- index가 없는 컬럼 like -- 인덱스 없으므로 full scan
explain select * from `customer`
where `first_name` like 'a%';

explain select * from `customer` 
where `first_name` like '%a';

explain select * from `customer` 
where `first_name` like '%a%';

-- index 있는 컬럼 like
explain select * from `customer`
where `last_name` like 'a%';     -- range scan

explain select * from `customer`
where `last_name` like '%a';     -- full scan

explain select * from `customer`
where `last_name` like '%a%';    -- full scan

-- pk 값 조회 
explain select * from `customer` where `customer_id` = 3; -- const

-- index가 없는 컬럼 값 조회 
explain select * from `film` where `length` = 100; -- full scan

-- index로 값 조회 
explain select * from `customer` where `store_id` = 2; -- ref 

# 복습 끄읏! 

-- pk로 범위 조회 
explain select * from `film` where `film_id` < 10; -- range 
explain select * from `film` where `film_id` < 1000; -- range 

-- index가 없는 컬럼의 범위 조회 
explain select * from `film` where `length` < 50; -- full scan 

-- length 컬럼 index 추가하기 
alter table `film` add index `idx_length` (`length`);

-- index로 범위 조회 
explain select * from `film` where `length` < 50; -- range
explain select * from `film` where `length` < 100; -- full scan
-- -> 데이터의 수가 적기 때문에 옵티마이저가 풀스캔이 낫다고 판단 
-- hint 

-- index 삭제하기 
alter table `film` drop index `idx_length`;






