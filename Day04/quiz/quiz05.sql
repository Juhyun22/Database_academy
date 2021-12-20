select * from `review`;

# update
update `review` set `userName` = '맛있으면짖는개' where `id` = 3;

# 1. 그룹별 개수 세기 
select `userName`, count(*) as `count` from `review`
group by `userName`;

# 2. 그룹별 평균 구하기
select `storeName`, avg(`point`) as `average` from `review`
group by `storeName`;

# 3. 그룹 조건 - null인 리뷰에 대해서 인식 안함
select `userName`, count(`review`) as `count` from `review`
where `review` is not null
group by `userName` 
having `count` >= 4;

# 4. 학생별 평균
select * from `score`;
select `name`, avg(`score`) as `average` from `score`
where `year` = 2020 and `semester` = 1 and `term` = '기말고사'
group by `name`;

# 5. 성적별 평균 
-- 2020년 과목별 평균 출력
select `subject`, avg(`score`) as `average` from `score`
where `year` = 2020
group by `subject`;

# 6. 석차 구하기 
-- 2020년 모든 시험의 학생별 평균을 구하고 석차 순서로 출력하세요.
select `name`, avg(`score`) as `average` from `score`
where `year` = 2020 
group by `name` order by `average` desc;

