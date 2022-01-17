> ### 1. 요청/응답 Life Cycle 

+ Request -> Controller -> Response(String, JSON,...)
+ @RestController = @Controller + @Responsebody
+ Spring Bean 
+ HTTPSTATUS : 수행은 됐는데 error는 아니지만 뭐가 잘못된거같아 수정했으면 좋겠다. or 정의 
<br>

> ### 1-2. httpMessageConverter와 어노테이션 (2) 

+ Map 재활용헤서 사용 가능 -> new로 선언하면, 새로운 공간 확보됨.
+ type을 활용한 이름을 쓰자! ex) DataList(List..)
+ ResponseEntity<값> 
<br>

> ### use github by using SourceTree

+ s.t에서 git 업로드 -> bin, src, graddle 있는 곳의 폴더 선택 -> 모두 스테이지 올리기 -> 커밋 설명 작성 -> 커밋 
+ git에서 got repository 만들기 -> SSH주소 복사 
+ s.t에서 원격 -> 이름(orign) / URL(SSH주소) -> 확인x2 -> push(master check) -> push.. (key인증이 잘 되어 있으면 잘 올라감!)
+ s.t에서 branch 나누기 : branch -> develop branch -> push -> develop check -> push
+ 모든 코드 완성되었을 떄, master -> 병합 -> 원하는 위치의 코드 병합 -> 확인 -> push
+ develop 말고 test용은 feature branch
+ master <-> develop <-> feature 
<br>

> ### else...

+ request -> Controller -> response(String? Map?) 
+ 404 error -> graddle refresh 안된거얌 
+ view is always String : String is path 
+ @ResponseBody가 코드상에 X : 무조건 경로(view)
+ @ResponseBody가 코드상에 O : 그 자체가 data
+ Controller String, Map. JSON/view & DB 연동 되는지부터 확인... -> 코드 작성의 뼈대부터⭐️



