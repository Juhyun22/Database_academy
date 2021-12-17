select * from `score`;

# 1. 전체 성적 출력
select count(*) from `score`;

# 2. 컬럼명 별명 붙이기 
select `name` AS `이름`, `subject` AS `과목`, `score` AS `성적` from `score`; 

# 3. 특정 학생 성적
select `year`, `semester`, `term`, `subject`, `score` 
from `score` where `name` = '유재석';

# 4. 연도 조건
select `year` from `score` where `year` >= 2020;

# 5. 복합 조건
select * from `score` where `year` = 2020 and `semester` = 1 and `term` = '중간고사';

# 6. 개수 세기. 유재석 90이상의 개수
select count(*) from `score` where `name` = '유재석' and `score` >= 90;