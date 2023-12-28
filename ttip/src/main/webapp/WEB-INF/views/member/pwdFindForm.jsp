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
                <h5>비밀번호 찾기 👍</h5>
                <h3>가입했던 이메일 주소를 <br>입력해주세요.</h3>
                <input type="text" class="input" placeholder="이메일" id="email" required>
                <button class="button primary" id="findPwd">인증번호 전송</button>
                <input type="text" class="input" placeholder="인증번호" id="code" style="display: none;">
				<button class="button primary" id="codeBtn" style="display: none;">인증하기</button>

                <h4>가입하셨던 이메일 주소를 입력해주시면 <br>
                    인증번호를 메일로 보내드립니다.<br>
                    메일을 확인해 인증번호를 입력하세요.
                </h4>
                
            </div>
        </div>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>