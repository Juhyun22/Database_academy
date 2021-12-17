select * from `score`;

# 1. 점수 업데이트 
update `score` set `score` = 100, `updatedAt` = now() where `id` = 5;

# 2. 점수 업데이트 
# edit > Preferences > SQL Editor 맨 아래 Safe Updates 해제 후 프로그램 다시 켜기 
set sql_safe_updates = 0;
select * from `score` where `name` = '이광수' and `year` = 2019 and `semester` = 2;
update `score` set `score` = 85, `updatedAt` = now()
where `name` = '이광수' and `year` = 2019 and `semester` = 2 and `subject` = '수학';

select * from `review`;

# 3. 리뷰 내용 추가
update `review` set `review` = '역시 치킨은 BBQ 인정!', `updatedAt` = now()
where `id` = 10;

# 4. 일괄 변경
update `review` set `point` = 4.8, `review` = '식어도 맛있어요!!', `updatedAt` = now()
where `id` = 8;
