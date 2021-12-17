# DELETE - 리뷰 삭제 
select * from `review`;

# 1. 데이터 삭제  
select * from `review` where `id` = 22;
delete from `review` where `id` = 22;

# 2. 조건 삭제 
select * from `review` where `userName` = '이정재' and `point` < 2.0;
delete from `review` where `userName` = '이정재' and `point` < 2.0;