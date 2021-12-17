# id가 1인 데이터 삭제하기 
-- 위험하기 때문에 select문 먼저 꼭 실행하기 
select * from `user` where `id` = 1;
delete from `user` where `id` = 1;

# 테이블 내용 전체 삭제: 최근에 들어가 id부터 다시 시작한다. 
delete from `user`;

# 테이블 내용 전체 삭제: id 초기화
-- 테이블을 삭제했다가 다시 생성한다. 

truncate table `user`; 




INSERT INTO `user`
(
    /*`id`,   auto increment이므로 추가하지 않는다.*/
    `name`,
    `yyyymmdd`,
    `hobby`,
    `introduce`, /* null 허용 컬럼은 꼭 넣지 않아도 된다. */
    `createdAt`, /* 기본값이 current timestamp이면 넣지 않아도 현재시간이 들어감 */
    `updatedAt`,
    `email`
)
VALUE
(
    '신보람',
    '19991108',
    '독서,노래,영화',
    '안녕하세요.\n저는 누구일까요?',
    now(),
    now(),
    'sbr@kakao.com'
);

-- 한번에 여러행 추가
INSERT INTO `user`
(
    /*`id`,   auto increment이므로 추가하지 않는다.*/
    `name`,
    `yyyymmdd`,
    `hobby`,
    `introduce`,
    `createdAt`, /* 기본값이 current timestamp이면 넣지 않아도 현재시간이 들어감 */
    `updatedAt`,
    `email`
)
VALUES
(
    '김꾸꾸',
    '20000105',
    '멍때리기, 바다한테 장난치기',
    '멍~~~',
    now(),
    now(),
    'kkk@gmail.com'
),
(
    '신바다',
    '20191115',
    '사냥하기',
    '나랑 놀아줄 집사를 모집합니다',
    now(),
    now(),
    'gleams@kakao.com'
),
(
    '신바다',
    '20190708',
    '컴퓨터',
    '할말이 없구먼',
    now(),
    now(),
    'marobiana@naver.com'
);


