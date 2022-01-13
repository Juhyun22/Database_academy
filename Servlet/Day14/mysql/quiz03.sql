select * from `seller`;

select * from `used_goods`;

select A.nickname, B.title, B.description, B.price, B.picture
from `seller` as A
join `used_goods` as B
on A.id = B.sellerId
order by B.id desc;

