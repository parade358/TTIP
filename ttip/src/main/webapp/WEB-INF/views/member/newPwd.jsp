<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/pwdFind.css">
    <script src="${pageContext.request.contextPath }/resources/js/member/pwdFind.js"></script>
    <style>

    </style>
</head>

<body>

<!-- 헤더바 -->
    <%@include file="../common/header.jsp" %>
    
    <div class="root">
        <div class="signin-wrapper form active">
            <div class="form-wrapper">
                <h5>비밀번호 재설정 👍</h5>
                <h3>새로운 비밀번호를 <br>입력해주세요.</h3>
                
                <input type="password" class="input" placeholder="비밀번호" id="pwd"
						name="userPassword" required oninput="checkPwd()" style="margin-bottom: 10px;"><span
						id="pwMessage" class="message"></span> <input type="password"
						class="input" placeholder="비밀번호 확인" id="confirmPassword" required
						oninput="checkMatch()" style="margin-top: 10px; margin-bottom: 10px;"><span id="passwordMatchMessage"
						class="message"></span>
				<button class="button primary" id="chagePwd" style="margin-top: 10px;">비밀번호 변경</button>
                
            </div>
        </div>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>