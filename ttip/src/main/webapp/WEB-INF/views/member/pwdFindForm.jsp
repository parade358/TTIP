<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                <form onsubmit="return pwFindForm()">
                <h3>가입했던 이메일 주소를 <br>입력해주세요.</h3>
                <input type="text" class="input" placeholder="이메일" required>

                <h4>가입하셨던 이메일 주소를 입력해주시면 <br>
                    새로운 비밀번호를 임의로 보내드립니다.<br>
                    이메일을 확인해주세요.
                </h4>
                <br>
                <button class="button primary">비밀번호 전송하기</button>
                </form>
            </div>
        </div>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>