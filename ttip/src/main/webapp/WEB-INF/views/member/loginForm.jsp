<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/loginForm.css">
    <script src="${pageContext.request.contextPath }/resources/js/member/login.js"></script>
</head>

<body>

<!-- 헤더바 -->
    <%@include file="../common/header.jsp" %>
<div class="root">
    <div class="signin-wrapper form active">
        <div class="form-wrapper">
            <h5>로그인 👍</h5>
            <form onsubmit="return validateForm()" action="loginInsert.me" method="post">
                <div class="login-container">
                    <input type="text" name="email" class="input" placeholder="이메일" required>
                    <input type="password" name="userPassword" class="input" placeholder="비밀번호" required>
                </div>
                <button type="submit" class="button primary">로그인 하기</button>
            </form>
            
            <!-- <p style="cursor: pointer;" onclick="alert('이메일 찾기')"><a href="#emailFindForm">이메일 찾기</a></p> -->
<!--             <p style="cursor: pointer;" onclick="alert('비밀번호 찾기')"> -->
			<p style="cursor: pointer;">
                <a href="pwdFind.me" id="pwdFind">비밀번호 찾기</a>
            </p>
        </div>
    </div>
</div>

    
    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>
