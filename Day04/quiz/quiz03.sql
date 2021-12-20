select * from `score`;

# 1. 개수 제한
select * from `score` limit 0, 10;

# 2. 정렬하기 
select * from `score` order by `score` desc;

# 3. 조건부 정렬  
select * from `score` 
where `year` = 2020 and `semester` = 1 and `term` = '기말고사' and `subject` = '국어'
order by `score` desc;

# 4. 문자열 만들기
select concat(`year`, '년', `semester`, '학기',`term`, ' ',`name`, '-', `subject`, `score`, '점') 
AS `score_info` from `score`;

