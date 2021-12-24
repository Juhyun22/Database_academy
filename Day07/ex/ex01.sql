# 홍당무 마켓
/*
	필요한 필드
    판매자 정보: 닉네임, 이미지 URL(null 허용), 매너온도, (물품 목록) 
	물품: 제목, 물품 설명, 가격, 판매자 pk (판매자 닉네임, 판매자 매너온도)
    물품과 판매자 정보의 연결은 pk값으로 연결한다.
*/

# 판매자 테이블 생성 
create table `seller` (
	`id` int not null auto_increment primary key
    , `nickname` varchar(20) not null
    , `profileImgUrl` varchar(512)
    , `temperature` decimal(3, 1) default 36.5   -- 처음 36.5 ~ 99.0까지 가능 
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

# 물품 테이블
-- 물품: 제목, 물품 설명, 가격, 물품 사진, 판매자 pk (판매자 닉네임, 판매자 매너온도)
create table `used_goods` (
	`id` int not null auto_increment primary key
    , `sellerId` int not null
    , `title` varchar(64) not null
    , `description` text not null
    , `price` int not null
    , `picture` varchar(512)  -- nullable 
    , `createdAt` timestamp default current_timestamp
    , `updatedAt` timestamp default current_timestamp
) engine=InnoDB default charset=utf8mb4;

-- dummy data 추가 
# 판매자 데이터 추가 - 물품 테이블이 판매자의 pk를 참조하므로 먼저 insert 
insert into `seller`
(`nickname`, `profileImgUrl`, `temperature`)

values
('마로비', 'https://cdn.pixabay.com/photo/2021/11/30/17/06/tree-6835828_1280.jpg', 36.5),
('아메리카노', null, 48.2),
('호돌이', 'https://cdn.pixabay.com/photo/2021/11/19/15/21/christmas-6809681_1280.png', 29.0),
('호순이', null, 36.5),
('하구루', 'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg', 36.5);

# 값 잘 들어갔는지 확인
select * from `seller`;

# 물품 데이터 추가 
insert into `used_goods`
(`sellerId`, `title`, `description`, `price`, `picture`)

values
(1, '플스4 팝니다', '쿨거래 하실분들 연락주세요', 100000, 'https://cdn.pixabay.com/photo/2021/09/07/07/11/game-console-6603120_1280.jpg'),
(1, '원피스 팝니다', '살이 빠져서 사이즈가 커져서 못입어요', 20000, 'https://cdn.pixabay.com/photo/2016/11/25/14/48/girls-1858565_1280.jpg'),
(3, '후라다 여성지갑 팝니다', '오늘 선물하려했는데 헤어졌어요', 200000, null),
(2, '바퀴벌레좀 잡아주세요', '제발 잡아주세요. 못들어가고 있어요.', 5000, null);

# 물품 데이터 확인
select * from `used_goods`;

-- '마로비'의 판매 물품 리스트를 가져오기 
select * from `seller` where `nickname` = '마로비'; -- id: 1
select * from `used_goods` where `sellerId` = 1;

-- 바퀴벌레를 잡아달라는 사람의 닉네임과 매너온도 확인하기
select * from `used_goods` where `title` like '바퀴벌레%'; -- id: 2
select * from `seller` where `id` = 2;









