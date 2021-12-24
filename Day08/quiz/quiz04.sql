# 멜롱 뮤직 차트 
-- music: 노래 제목(title) | 재생시간(playTime) | 작사가(lyricist) | 작곡가(composer)	
-- singer: 가수(name) | 데뷔(debut) | 소속사(agency)	
-- album: 앨범 제목(title) | 앨범 발매일(releaseDate) | 트랙 수(tracks)

-- singer -> album(singer) -> music(album)

# 1. 테이블 생성
-- singer
create table `singer`(
	`id` int not null auto_increment primary key
    , `name` varchar(16) not null
    , `debut` int not null
    , `agency` varchar(16)
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4; 

-- album(singer)
create table `album`(
	`id` int not null auto_increment primary key
    , `singerId` int not null
    , `title` varchar(32) not null
    , `releaseDate` date not null
    , `tracks` tinyint not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4; 

-- music(albumId)
create table `music`(
	`id` int not null auto_increment primary key
    , `albumId` int not null
    , `title` varchar(32) not null
    , `playTime` int not null
    , `lyricist` varchar(16) not null
    , `composer` varchar(16) not null
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;


# 2. 데이터 저장 
-- singer
insert into `singer`
(`name`, `debut`, `agency`)
values
('성시경', 2000, '에스케이재원'),
('AKMU', 2014, 'YG엔터테인먼트'),
('아이유', 2008, '이담엔터테인먼트');

select * from `singer`;

-- album
insert into `album`
(`singerId`, `title`, `releaseDate`, `tracks`)
values
(1, 'The Ballads', '2006-10-10' ,16),
(1, '여기, 내 맘속에...', '2008-06-12',	11),
(2, '항해', '2019-09-25', 10),
(2, 'SUMMER EPISODE', '2017-07-20', 4),
(3, 'Love poem', '2019-11-18', 6),
(3, 'Palette', '2017-04-21', 6);

select * from `album`;

-- music  
insert into `music` 
(`albumId`, `title`, `playTime`, `lyricist`, `composer`)
values
(1, '거리에서', 279, '윤종신', '윤종신'),
(1, '그리운 날엔',	250, '심재희', '김형석'),
(1, '바람, 그대',	250,'이미나', '하림'),
(2, '여기 내 맘속에', 250, '이미나', '유희열'),
(2, '안녕 나의 사랑', 257, '유희열', '성시경'),
(3, '어떻게 이별까지 사랑하겠어, 널 사랑하는 거지', 290, '이찬혁', '이찬혁'),
(4, 'DINOSAUR', 240, '이찬혁', '이찬혁'),
(4, 'MY DARLING', 225, '이찬혁', '이찬혁'),
(5, 'Blueming', 217, '아이유', '이종훈'),
(5, 'Love poem', 258, '아이유', '이종훈'),
(6, '밤편지', 253, '아이유', '김희원'),
(6, '팔레트', 217, '아이유', '아이유');

select * from `music`;

# 3. 발매일 조건
-- music, album 
select B.title, B.composer, B.title
from `album` as A
join `music` as B
on A.id = B.albumId
where A.releaseDate >= '2010-01-01' and A.releaseDate < '2020-01-01';

# 4. 가수별 총 노래 수 
-- 가수별(group by) 노래 개수를 출력하세요. singer music
-- 2005년 이전 데뷔 가수는 제외 하세요. singer
-- 노래 수 내림 차순으로 출력하세요.
select A.name, A.debut, count(*) as count
from `singer` as A
join `album` as B
on A.id = B.singerId
join `music` as C
on B.id = C.albumId
where A.debut >= '2006-01-01'
group by A.id 
order by count desc;

# 5. AKMU 노래 
-- AKMU(A) 노래(C)를 모두 출력하세요.
select A.name, C.title, C.playTime, B.title
from `singer` as A
join `album` as B
on A.id = B.singerId
join `music` as C
on B.id = C.albumId
where A.name = 'AKMU';

# 6. 기간내의 노래 
-- 2008년 부터 10년 동안 발매된 노래를 출력하세요.
-- 단 재생시간이 4분 이상인 노래만 출력하세요.
select C.title, A.name, C.playTime, B.title as `album title`
from `singer` as A
join `album` as B
on A.id = B.singerId
join `music` as C
on B.id = C.albumId
where B.releaseDate >= '2008-01-01' and B.releaseDate < '2018-01-01'
and C.playTime >= 240;

# 7. 앨범별 총 재생 시간 
-- 앨범별(B/ group by) 총 재생시간을 출력하세요.
-- 재생시간이 470초과 인 것만 출력하세요.
-- 재생시간 오름 차순으로 출력하세요.
select A.name, B.title, B.tracks, sum(C.playTime) as playTime
from `singer` as A
join `album` as B
on A.id = B.singerId
join `music` as C
on B.id = C.albumId
group by B.id
having playTime > 470
order by playTime asc;


