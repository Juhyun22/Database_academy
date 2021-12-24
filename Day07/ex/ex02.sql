# join 하지 않는 경우
-- 마로비의 판매 물품 리스트를 가져오기 
select * from `seller` where `nickname` = '마로비';
select * from `used_goods` where `sellerId` = 1;

# join 
# 그냥 join은 inner joun이다.
select seller.*, used_goods.* 
from `seller`
join `used_goods`
on seller.id = used_goods.sellerId
where seller.nickname = '마로비';

-- 테이블 별명 붙이기 
select A.*, B.*
from `seller` AS A
join `used_goods` AS B
on A.id = B.sellerId
where A.nickname = '마로비';

-- 하구루의 판매 물품 리스트 가져오기 : 결과가 0행 (없으니까)
select A.*, B.*
from `seller` As A
join `used_goods` As B
on A.id = B.sellerId
where A.nickname = '하구루';

# Inner join: 테이블들의 교집합
-- 마로비의 판매 물품 리스트 가져오기 
select A.*, B.* 
from `seller` as A
inner join `used_goods` as B
on A.id = B.sellerId
where A.nickname = '마로비';

-- 하구루의 판매 물품 리스트 가져오기 : 결과 0행 -> seller에는 있으나 useg_goods에는 없어서 0행
select A.*, B.* 
from `seller` as A
inner join `used_goods` as B
on A.id = B.sellerId
where A.nickname = '하구루';

# Left Join (left outer join): 좌측 테이블은 전체 - 우측 테이블은 null 허용
-- 마로비의 판매 물품 리스트 가져오기 
select A.*, B.*
from `seller` As A
left join `used_goods` as B
on A.id = B.sellerId
where A.nickname = '마로비';

-- 하구루의 판매 물품 -> seller는 있으나 used_goods는 없어서 우측 테이블이 null값. 
select A.*, B.*
from `seller` As A
left join `used_goods` As B
on A.id = B.sellerId
where A.nickname = '하구루'; 

# right join (right outer join): 좌측 테이블 null 허용 - 우측은 전체 
-- 하구루의 판매 물품 
select A.*, B.*
from `used_goods` As A
right join `seller` As B
on A.sellerId = B.id
where B.nickname = '하구루';

-- 제목이 바퀴벌레로 시작하는 글을 쓴 사람의 매너온도 확인하기 
select A.nickname, A.temperature
from `seller` As A
left join `used_goods` As B  -- inner join과 left join과 차이가 없는 결과이다. (둘 다 있기 때문) 
on A.id = B.sellerId
where B.title like '바퀴벌레%';





