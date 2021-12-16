-- 한 행 추가
insert into `user` (
	-- `id`   auto increment 이므로 추가하지 않는다.
    `name`
    , `yyyymmdd`
    , `hobby`
    , `introduce`
    , `email`
    , `createdAt`
    , `updatedAt`
)

value (
	'이보라'
    , '19991108'
    , '독서, 노래, 영화'
    , '안녕하세요\n저는 누구일까요?'
    , 'sihyun25@naver.com'
    , now() -- 기본값이 current_timestamp이기 때문에 안넣어도 값이 들어간다.  
    , now()
);

select * from `user`;

-- 한번에 여러행 추가
insert into `user` 
(`name`, `yyyymmdd`, `hobby`, `introduce`, `email`, `createdAt`, `updatedAt`)

values
('김꾸꾸', '20000105', '멍때리기', '바다한테 장난치멍~~', 'kkk@gmail.com', now(), now()),
('신바다', '20191105', '사냥하기', '사냥할거다아ㅏ', 'bada@kakao.com', now(), now()),
('신바다', '20180708', '컴퓨터', '컴퓨터해야지이', 'badaa@naver.com', now(), now());






