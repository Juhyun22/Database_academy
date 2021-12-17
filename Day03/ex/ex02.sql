select * from `user`; 

# id가 4인 데이터의 email 주소 변경 'test@test.com'
update `user` set `email` = 'test@test.com' 
where `id` = 4;

# id가 2인 데이터의 취미를 '맛집탐방' 자기소개를 '강남 맛집 전문가'라고 변경
update `user` set `hobby` = '맛집탐방', `introduce` = '강남 맛집 전문가', `updatedAt` = now()
where `id` = 2;