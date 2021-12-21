# 1. 테이블 생성
create table `weatherHistory` (
	`id` int not null auto_increment primary key,
    `date` date not null,
    `weather` varchar(4) not null,
    `temperatures` decimal(3, 1) not null,     -- (전체 길이, 소수점 아래 자리수)
    `precipitation` decimal(4, 1) not null ,   -- 백의 단위로 갈 수도 이뜸
    `microDust` varchar(3) not null,
    `windSpeed` decimal(3, 1) not null,
    `createdAt` timestamp default current_timestamp,
    `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 2. 데이터 저장
insert into `weatherHistory`
(`date`, `weather`, `temperatures`, `precipitation`, `microDust`, `windSpeed`)

values 
('2015-07-01', '비', 21.9, 83.5, '보통', 2.9),
('2015-07-02', '비', 22.6, 59.5, '보통', 2.5),
('2015-07-03', '흐림', 24.7, 0.0, '좋음', 2.9),
('2015-07-04', '맑음', 27.3, 0.0, '좋음', 6.1),
('2015-07-05', '구름조금', 25.3, 0.0, '나쁨', 4.3),
('2015-07-06', '맑음', 23.9, 0.0, '나쁨', 6.5),
('2015-07-07', '맑음', 23.7, 0.0, '좋음', 5.8),
('2015-07-08', '흐림', 23.3, 0.0, '좋음', 5.4),
('2015-07-09', '비', 20.8, 14.0, '보통', 4.0),
('2015-07-10', '비', 23.7, 16.5, '보통', 2.5),
('2015-07-11', '비', 26.8, 3.0, '좋음', 4.7),
('2015-07-12', '비', 26.6, 1.0, '나쁨', 5.4),
('2015-07-13', '구름조금', 27.3, 0.0, '최악', 6.5),
('2015-07-14', '맑음', 27.9, 0.0, '보통', 6.8);

select * from `weatherHistory`;

# 3. 가장 높은 기온
select `date`, `weather`, `temperatures` from `weatherHistory`
order by `temperatures` desc limit 1;

# 4. 날짜 카운트
select `weather`, count(*) as `count` from `weatherHistory`
group by `weather` order by `count` desc;

# 5. 미세먼지와 강수량
select `microDust`, avg(`precipitation`) as `precipitation` from `weatherHistory`
group by `microDust` having `precipitation` > 0;

# 6. 미세먼지와 풍속
select `microDust`, avg(`windSpeed`) as `windSpeed` from `weatherHistory`
group by `microDust`
having `windSpeed` >= 4.0 order by `windSpeed` desc;

