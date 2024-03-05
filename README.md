# :pushpin: QTOrder
> 간편 QR 오더 시스템
>> QR코드를 활용하여 지역행사 등 푸드트럭에서 간편 주문 결제 시스템


</br>

## 1. 제작 기간 & 참여 인원
- 2024년 02월 23일 ~ 2024년 3월 31일
- 팀 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java
  - Python
  - oracle database
  - Apache Tomcat9.0
    
#### `Front-end`
  - JavaScript
  - css

#### `IDE`
  - Eclipse
  - Visual Studio Code
  - Jupyter NoteBook


</br>

## 3. ERD 설계
![ERD2](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152379979/e8b3d332-67c3-44b9-b3b4-1b408d41bc71)



## 4. 핵심 기능



<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름

![](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152265634/47587d45-ae45-4e34-9874-b52474d02193)



### 4.2. 내용입력하세요

- **내용입력하세요**
  - 내용입력하세요  
<img src="https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152265634/e7371fd4-87b5-4d85-9517-cb07cc870176" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>
- **내용입력하세요**
  - 내용입력하세요
  - 내용입력하세요
  - 내용입력하세요  
<img src="https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152379979/475b7f1f-440e-42f0-9b2b-5dd77d2718b2" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>


### 4.3. FrontController

- **내용입력하세요**
  - 내용입력하세요

- **내용입력하세요**
  - 내용입력하세요


### 4.4. Service

- **내용입력하세요** 
  - 내용입력하세요

### 4.5. DB
- **내용입력하세요**
  - 내용입력하세요 :📌:[코드 확인](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/blob/ca21383ecc3d21a0e8497b68094cb30ecd287e8b/GitTest1/src/main/webapp/html/Profile.jsp#L240)
 
- **내용입력하세요**
  - 내용입력하세요
    

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 내용입력하세요
- 내용입력하세요

- 내용입력하세요

-내용입력하세요

<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">

~~~java

/**
 * 대출 추천
 * @tb_loan 대출 정보
 * @tb_loan_criteria 비교할 대출 정보
 * @loan_name 대출 명
 * @loan_limit 대출 한도
 * @loan_seq 대출 코드
 * #{FIRST_HOUSE_YN} 최초 주택 구입 여부
 * #{DUPLICATE_YN} 중복 대출 여부
 * #{MARRIAGE_YEARS} 결혼 기간
 * #{INCOME} 연소득
 */

	<select id="SelectLoans" parameterType="com.early.model.LoanVO"
		resultType="com.early.model.LoanNameVO">
		SELECT a.loan_name, a.loan_limit
		FROM tb_loan a
		JOIN
		tb_loan_criteria b ON a.loan_seq = b.loan_seq
		WHERE FIRST_HOUSE_YN =
		#{FIRST_HOUSE_YN}
		AND DUPLICATE_YN = #{DUPLICATE_YN}
		AND
		MARRIAGE_YEARS >= #{MARRIAGE_YEARS}
		AND INCOME <= #{INCOME}
	</select>

/**
 * 부동산 추천
 * @tb_apartment 아파트
 * @tb_apartment_info 아파트 상세정보
 * @apt_name 아파트 명
 * @apt_realprice 실거래가
 * @apt_loc 아파트 주소
 * @apt_code 아파트 코드
 * #{total} 사용자 자산정보
 */

	<select id="getCompare" parameterType="String" resultType="com.early.model.CompareVO">
		SELECT a.apt_name, b.apt_realprice, a.apt_loc
		FROM tb_apartment a,
		tb_apartment_info b
		WHERE a.apt_code = b.apt_code
		AND b.apt_realprice <#{total}
	</select>

/**
 * 부동산 추천2
 * #{total_money} 사용자 자산정보
 */
	<select id="getCompare2" parameterType="int" resultType="com.early.model.CompareVO">
        SELECT a.apt_name, a.apt_loc, b.apt_realprice
        FROM tb_apartment a
        JOIN tb_apartment_info b ON a.apt_code = b.apt_code
        WHERE b.apt_realprice < #{total_money}
~~~

</div>
</details>

- 내용입력하세요
- 내용입력하세요

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 대출 추천
 */
	<select id="SelectLoans" parameterType="com.early.model.LoanVO"
		resultType="com.early.model.LoanNameVO">
		<![CDATA[
		SELECT a.loan_name, a.loan_limit
		FROM tb_loan a
		JOIN
		tb_loan_criteria b ON a.loan_seq = b.loan_seq
		WHERE FIRST_HOUSE_YN =
		#{FIRST_HOUSE_YN}
		AND DUPLICATE_YN = #{DUPLICATE_YN}
		AND
		MARRIAGE_YEARS >= #{MARRIAGE_YEARS}
		AND INCOME <= #{INCOME}
		]]>
	</select>

/**
 * 부동산 추천
 */
	<select id="getCompare" parameterType="String" resultType="com.early.model.CompareVO">
		SELECT a.apt_name, b.apt_realprice, a.apt_loc
		FROM tb_apartment a,
		tb_apartment_info b
		WHERE a.apt_code = b.apt_code
		AND b.apt_realprice <![CDATA[<]]>
		#{total}
	</select>

/**
 * 부동산 추천2
 */
	<select id="getCompare2" parameterType="int" resultType="com.early.model.CompareVO">
	<![CDATA[
        SELECT a.apt_name, a.apt_loc, b.apt_realprice
        FROM tb_apartment a
        JOIN tb_apartment_info b ON a.apt_code = b.apt_code
        WHERE b.apt_realprice < #{total_money}
    ]]>
	</select>
}
~~~

</div>
</details>

</br>

## 6. 내용입력하세요
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

## 6. 회고 / 느낀점

