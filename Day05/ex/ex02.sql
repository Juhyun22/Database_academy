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
explain select * from `customer` where `store_id` = 2; 







