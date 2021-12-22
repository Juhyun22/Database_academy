# select문 -> explain으로 확인 -> 어떤게 쓰이는지 확인 후 index 설정

# 1. 실행 계획 확인 
select * from `review`;
-- 이정재가 작성한 리뷰 리스트
explain select * from `review` where `userName` = '이정재'; -- full scan 

-- 별점이 3.0 이하의 별점 중 이병헌이 작성한 리뷰 리스트 
explain select * from `review` where `point` <= 3.0 and `userName` = '이병헌'; -- full scan

-- 교촌치킨의 4.0 이상의 별점 리뷰 리스트
explain select * from `review` where `storeName` = '교촌치킨' and `point` >= 4.0; -- full scan

-- 가게별 별점 평균
explain select `storeName`, avg(`point`) from `review` group by `storeName`; -- full scan

# userName, point, storeName..?
alter table `review` add index `idx_userName` (`userName`);
alter table `review` add index `idx_storeName` (`storeName`);

-- 이정재가 작성한 리뷰 리스트
explain select * from `review` where `userName` = '이정재'; -- ref  

-- 별점이 3.0 이하의 별점 중 이병헌이 작성한 리뷰 리스트 
explain select * from `review` where `point` <= 3.0 and `userName` = '이병헌'; -- ref

-- 교촌치킨의 4.0 이상의 별점 리뷰 리스트
explain select * from `review` where `storeName` = '교촌치킨' and `point` >= 4.0; -- ref

-- 가게별 별점 평균
explain select `storeName`, avg(`point`) from `review` group by `storeName`; 
-- index의 full scan.. group by라서 어쩔 수 없음


