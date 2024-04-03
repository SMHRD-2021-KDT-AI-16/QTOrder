# :pushpin: QTOrder
> 간편 QR 오더 시스템
>> QR코드를 활용하여 지역행사 등 푸드트럭에서 간편 주문 결제 시스템


</br>

## 1. 제작 기간 & 참여 인원
- 2024년 02월 23일 ~ 2024년 3월 31일
- 팀 프로젝트(역할)
  - 구임규 : PM, 외부API활용, 장바구니관련 페이지 및 기능, 축제등록 페이지 및 기능
  - 최고봉 : DB설계, 사업자페이지, 3D효과 구현, 주문현황 및 관리, 메뉴 관리 및 카테고리화 구현
  - 최현민 : 참여업체 등록, 푸드트럭 메뉴, 사업자 공지사항, 매출확인 등 페이지 및 기능 구현, 자료조사
  - 주은혜 : 개인공부

</br>

## 2. 사용 기술
#### `Back-end`
  - Java
  - JSP
  - Python
  - MySQL database
  - Apache Tomcat9.0
    
#### `Front-end`
  - JavaScript
  - css
  - html
  - JSP
  - bootstrap

#### `IDE`
  - Eclipse
  - Visual Studio Code
  - Jupyter NoteBook


</br>

## 3. ERD 설계
![image](https://github.com/SMHRD-2021-KDT-AI-16/QTOrderRepo/assets/152265634/da5bc008-8de0-46d2-a037-547bcdcba37a)



## 4. 핵심 기능



<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름

![image](https://github.com/SMHRD-2021-KDT-AI-16/QTOrderRepo/assets/152265634/a0c00aa9-8b9b-403b-8afd-9960ade7631d)



### 4.2. 사업자 기능

- **푸드트럭 메뉴 등록**
  - 사업자가 언제든 본인의 매장 메뉴를 수정 가능
 
<img src="https://github.com/SMHRD-2021-KDT-AI-16/QTOrderRepo/assets/152265634/dfa13d59-a91b-4285-9e38-63d1a0289d7e" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>

- **푸드트럭 주문 현황**
  - 내장형 web API를 사용하여 음성으로 주문현황의 동작들을 처리할 수 있음.
<img src="https://github.com/SMHRD-2021-KDT-AI-16/QTOrderRepo/assets/152265634/e72a220e-e4fd-4152-b76c-617a97bb4c87" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>


### 4.3. 소비자 기능
- **간편 오더 시스템**
  - 축제 및 행사장에 있는 전체 푸드트럭의 현황을 볼수 있고, 해당 푸드트럭의 메뉴를 원거리에서 주문가능
<img src="https://github.com/SMHRD-2021-KDT-AI-16/QTOrderRepo/assets/152265634/f5d9e208-f45f-443f-9aa7-3aeb1acd5e12" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>
    

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 동적 html요소 이벤트 할당
- 동적으로 생성된 HTML요소에 대해 자바 스크립트의 이벤트가 할당되지 않아 원하는 동작이 이루어지지 않는 현상

- 해당 현상의 원인은 이벤트리스너는 페이지가 로드된 그 상황에서 존재하는 요소들에게만 할당되기 때문

- 해결방안은 상위 요소에 이벤트를 위임하고 JQuery의 on()메소드를 활용하여 해결


</br>

## 6. 그 외 트러블 슈팅
<details>
<summary>네이버 소셜로그인 API 관련</summary>
<div markdown="1">

- 다른 환경에서도 소셜로그인이 진행될 수 있도록 URL을 변경 후 ajax나 session에 데이터를 저장하는 행위 자체가 이루어지지 않는 현상
- CORS 정책 위반으로 발생한 현상으로 Filter에서 헤더에 허용한다는 내용을 포함해서 전송해야 해결 가능
- ex) httpResponse.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:8081"); 

</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요
   
</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요

</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요
- 내용입력하세요
 
</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요
 
</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요
- 내용입력하세요
 
</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요
- 내용입력하세요
 
</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요
 
</div>
</details>

<details>
<summary>내용입력하세요</summary>
<div markdown="1">

- 내용입력하세요
 
</div>
</details>
    
</br>

## 7. 회고 / 느낀점
- 구임규 : 
- 최고봉 : 
- 최현민 : 
- 주은혜 : 

