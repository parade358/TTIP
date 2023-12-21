<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/member/enrollForm.css">
<script
	src="${pageContext.request.contextPath }/resources/js/member/enroll.js"></script>
</head>
<body>

	<!-- 헤더바 -->
	<%@include file="../common/header.jsp"%>

	<div class="root">
		<div class="signin-wrapper form active">
			<div class="form-wrapper">
				<h5>회원가입 👍</h5>
				<form onsubmit="return joinForm()" action="insert.me" method="post">
					<div class="email-container">
						<input type="text" class="input" placeholder="이메일" name="email"
							id="email" style="margin-bottom: 10px;" required> <input type="button" class="input"
							value="전송" id="mailBtn">
					</div>
					<div id="countdown" style="margin-left: 95px;"></div>
					<div class="verification-container">
						<input type="text" class="input" id="checkNum" placeholder="이메일 인증번호" style="margin-top: 10px;" required>
						<div class="button-container">
							<input type="button" id="check" class="input" value="확인" style="margin-top: 10px;">
						</div>
					</div>
					<input type="password" class="input" placeholder="비밀번호" id="pwd"
						name="userPassword" required oninput="checkPwd()"><span
						id="pwMessage" class="message"></span> <input type="password"
						class="input" placeholder="비밀번호 확인" id="confirmPassword" required
						oninput="checkMatch()"><span id="passwordMatchMessage"
						class="message"></span>

					<div class="nickname-container">
						<input type="text" class="input" placeholder="별명"
							name="userNickName" id="userNickName" required> <input
							type="button" class="input" value="중복확인"
							onclick="checkNickname()">
						<div id="nicknameCheckResult" style="display: none;"></div>
					</div>


					<!-- 지역 선택 -->
					<select name="address" required>
						<option selected disabled hidden>지역</option>
						<option>City1</option>
						<option>City2</option>
						<option>City3</option>
						<option>City4</option>
						<option>City5</option>
						<option>City6</option>
						<option>City7</option>
						<option>City8</option>
						<option>City9</option>
						<option>City10</option>
					</select>

					<!-- 					<select type="number" name="categoryNo" required> -->
					<!-- 						<option value="" disabled selected hidden>카테고리 선택</option> -->
					<!-- 						<option value="1">스포츠/건강</option> -->
					<!-- 						<option value="2">댄스</option> -->
					<!-- 						<option value="3">외국어</option> -->
					<!-- 						<option value="4">악기</option> -->
					<!-- 						<option value="5">취미/생활</option> -->
					<!-- 						<option value="6">사진/영상</option> -->
					<!-- 						<option value="7">학업</option> -->
					<!-- 					</select> -->


					<div class="category-container">
						<input type="button" class="input" value="재능" name="categoryNo"
							required>
					</div>

					<input type="checkbox" id="selectAll" onclick="toggleCheckboxes()"
						required> <label for="selectAll">전체동의</label><br> <input
						type="checkbox" name="check" value="Java" id="Java" required>
					<label for="Java">(필수) 이용약관 동의</label> <a href="#"
						class="view-link" onclick="showDetails('이용약관 내용')">보기</a><br>
					<input type="checkbox" name="check" value="DataBase" id="DataBase"
						required> <label for="DataBase">(필수) 개인정보 수집 및 이용
						동의</label> <a href="#" class="view-link"
						onclick="showDetails('개인정보 수집 및 이용 내용')">보기</a><br> <input
						type="checkbox" name="check" value="Web" id="Web" required>
					<label for="Web">(필수) 14세 이상입니다</label>

					<button id="enroll" class="button primary" type="submit">회원가입</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>


