## 서울세계불꽃축제 (fire)

Problem
-----
> 축제홍보 사이트

Idea
-----
> 서울여의도에서 진행되는 불꽃축제에 대한 기간, 홍보등 원활히 이루어졌으면 하는 바람에 사이트를 제작 <br> 여의도 일대에서 진행되는 불꽃축제 홍보 웹 사이트를 제작 (벤치 : 구석구석) <br> 홍보사이트 개발의 기본 틀이라고 생각되는 게시판과 디자인을 모두 포함하여 제작할 수 있도록 목표 설정

개발환경
-----
+ 프레임 워크 : Spring 4.0.4 Mybatis
+ 개발 언어 : java 11, javaScript, JSP, CSS
+ DB : Oracle 11g
+ WAS : Tomcat 9.0

Front 
-----
> Javascript, Ajax, Json, CSS, Bootstrap

Back 
-----
> Java - Spring data jdbc- Jquery, MVC,  Oracle  

주요기능과 로직
-----

### 반응형 
+  전체 페이지 부트스트랩을 이용한 반응형 제공

### Json
+ 모든 요청 페이지 Json방식의 데이터 전송방식 사용

### Ajax
+ 페이지 Ajax 사용

### 메인페이지
+ 지도 API활용 

### 페이징 기능
 + 각 페이지 마다 페이징 기능 활용 

### DB
 + Oracle에 새로 생기는 데이터 저장

### 검색 기능
 + 관리자 회원검색과 , 리뷰 게시판 회원검색 기능제공

### 관리자 회원
 + 관리자 회원조회 페이지에서 블라인드, 이벤트, 관리자여부, 회원탈퇴 기능 누를시 동적쿼리를 사용하여 처리할수있는 권한제공

### 로그인, 회원가입
 + 로그인시 JDBC에 저장된 값을확인하여 로그인 여부 판단 및 로그인 기능 , 로그아웃 기능제공  
 + (회원가입)JSON방식을 이용한 DB와 입력된 ID값, PW값 실시간 중복확인
 + 주소 API 기능 제공
 + 탈퇴회원 ID 가입 불가 
 + 아이디 비밀번호 찾기 기능제공

### 소개글, 오시는글
 + 관리자 페이지에서 수정, 작성 기능제공
 
### 공지사항
 + 관리자 여부판단하여 공지사항 작성, 수정, 삭제 기능제공
 + 이미지 파일 업로드 기능제공

### 먹거리, 푸드트럭
 + 판매 게시판 작성, 수정, 삭제 기능제공
 + 이미지 파일 업로드 기능제공
 + 
### 이벤트
 + 이벤트 게시판 작성, 수정, 삭제 기능제공
 + 이미지 파일 업로드 기능제공

### 갤러리
 + 불꽃 축제 기간에고객들이 다녀간 인증샷 갤러리 작성, 수정, 삭제 기능제공
 + 이미지 파일 업로드 기능제공
 + 
### 리뷰
 + 회원가입 완료된 고객에 한하여 리뷰를 작성할수있게  작성, 수정, 삭제, 검색 기능제공
 + 이미지 파일 업로드 기능제공


Erd
-----

기획 & 설계
-----

다이어그램
-----

DB 설계(테이블, 제약조건)
-----

개발자
-----
> 민재영 김형태 정주영 김성법 이 솔 조영준 한창식  

