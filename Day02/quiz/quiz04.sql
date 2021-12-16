# 1. 리뷰 등록
insert into `review`
(`storeName`, `menu`, `userName`, `point`, `review`, `createdAt`, `updatedAt`)

values
('버거킹', '와퍼세트', '이정재', 4.0, '배달이 빨랐어요. 역시 와퍼 맛있네요.', now(), now()),
('교촌 치킨', '오리지날 콤보', '이병헌', 4.5, '콤보는 항상 진리입니다.', now(), now()),
('원조 곱창볶음', '야채곱창볶음', '맛있으면짖는 개', 4.0, '와로알왈와로아뢍할와로알왕ㄹㄹ!!!', now(), now());

select * from `review`;

# 2. 별점 등록
insert into `review`
(`storeName`, `menu`, `userName`, `point`, `review`, `createdAt`, `updatedAt`)

value
('안동찜닭', '찜닭(중)', '강동원', 5.0, null, now(), now()),
('교촌치킨', '핫 콤보', '이정재', 4.5, null, now(), now()),
('BHC', '뿌링클', '전지현', 5.0, null, now(), now());