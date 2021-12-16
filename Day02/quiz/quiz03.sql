# 1. 개인 성적 입력
insert into `score` (
	`name`, `year`, `semester`, `term`, `subject`, `score`, `createdAt`, `updatedAt`
)

value (
	'유재석', 2021, 1, '중간고사', '국어', 80, now(), now()
);

insert into `score` (
	`name`, `year`, `semester`, `term`, `subject`, `score`, `createdAt`, `updatedAt`
)

value (
	'유재석', 2021, 1, '중간고사', '영어', 90, now(), now()
);

insert into `score` (
	`name`, `year`, `semester`, `term`, `subject`, `score`, `createdAt`, `updatedAt`
)

value (
	'유재석', 2021, 1, '중간고사', '수학', 95, now(), now()
);

# 2. 성적 다량 입력
insert into `score` (
	`name`, `year`, `semester`, `term`, `subject`, `score`, `createdAt`, `updatedAt`
)

values 
(	'조세호', 2021, 1, '중간고사', '국어', 75, now(), now()	),
(	'조세호', 2021, 1, '중간고사', '영어', 80, now(), now()	),
(	'조세호', 2021, 1, '중간고사', '수학', 95, now(), now()	);

select * from `score`;






