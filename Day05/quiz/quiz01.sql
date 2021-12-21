select * from `review`;

# 1. 리뷰 작성자별로 몇개의 리뷰를 작성했는지 출력 
select `userName`, count(1)
from `review` group by `userName`;

# 2. 가게 별 별점의 평균점수
select `storeName`, avg(`point`) as `average` from `review`
group by `storeName`;

# 3. 리뷰 작성 건수가 4건 이상인 작성자를 출력
select `userName` from `review`
group by `userName` having count(*) >= 4;

select * from `score`;
# 4. 2020년 1학기 기말고사 학생별 평균을 출력
select `name`, avg(`score`) as `average` from `score`
where `year` = 2020 and `semester` = 1 and `term` = '기말고사'
group by `name`;

# 5. 2020년 과목별 평균을 출력 
select `subject`, avg(`score`) from `score`
where `year` = 2020
group by `subject`;

# 6. 2020년 모든 시험의 학생별 평균을 구하고 석차로 나타내시오.
select `name`, avg(`score`) from `score`
where `year` = 2020 
group by `name` order by avg(`score`) desc;

