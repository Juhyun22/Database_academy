# 종합문제 (2)

# 3. 발매일 조건 
select B.title, B.composer, A.title
from `album` as A
join `music` as B
on A.id = B.albumId
where -- A.releaseDate >= '2010-01-01' and A.releaseDate < '2020-01-01'
A.releaseDate between '2010-01=01' and '2020-01-01';






