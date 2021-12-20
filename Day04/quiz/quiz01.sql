# id가 22인 리뷰행을 삭제하기
select * from `review` where `id` = 22;
delete from `review` where `id` = 22;

# 이정대 리뷰중 2점 미만의 리뷰 삭제
select * from `review`
where `userName` = '이정재' and `point` < 2.0;

delete from `review`
where `userName` = '이정재' and `point` < 2.0;