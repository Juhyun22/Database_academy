# limit 
-- 처음부터 50개만 가져오기
select * from `city` limit 50;

-- 처음부터 50개만 가져오기 
select * from `city` limit 0, 50;

-- 101번째부터 50개 가져오기 
select * from `city` limit 100, 50;

# like문 - 대소문자 구별 옵당
-- c로 시작하는 도시명 찾기 
-- 대소문자 구별 안함 
select * from `city` where `city` like 'c%';

-- c로 끝나는 도시면 찾기(권장 안함 - table full scan)
select * from `city` where `city` like '%c';

-- c가 들어가는 도시명 찾기(권장 안함 - table full scan) 
select * from `city` where `city` like '%c%';

# like 대소문자 구별 - binary() 함수 사용 
-- C가 들어가는 도시명 찾기 
select * from `city` where `city` like binary('%C%');

# order by - 정렬! 진짜 많이 사용됨!!!
-- 오름차순 정렬하기 
select * from `city` order by `country_id`;
select * from `city` order by `country_id` ASC;

-- 내림차순 정렬하기 
select * from `city` order by `country_id` DESC;

# city가 c로 시작하는 데이터를 country_id 내림차순으로 정렬하고 10개만 가져온다.
-- 순서가 있음!!!
select * from `city` 
where `city` like 'c%'
order by `country_id` desc limit 10;

# concat 함수 -- String을 이어준다. 
select 'hello';
select concat('hello', ' world!!!!');
select concat('hello', ' world!!!!') AS `str`;

select * from `film`;
-- 제목: OOO, 설명: OOO...
select concat('제목: ', `title`, ', 설명: ', `description`) AS 'result'
from `film`;







