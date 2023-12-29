var num = "";

var check = "n";

$(function(){
			
	var email = $("#email");
	
	var mailBtn = $("#findPwd");
	
	var codeInput = $("#code");
	
	var codeBtn = $("#codeBtn");
	
	mailBtn.click(function(){
	
		$.ajax({
			url : "findPwdCheck.me",
			data : {email : email.val()},
			success : function(result){
				
				if(result>0){
					ckeck = "y";
					codeInput.show();
					codeBtn.show();
					$.ajax({
						url : "findPwd.me",
						data : {email : email.val()},
						success : function(result){
							num = result;
							setTimeout(function() {
								num = "xxxxx";
							}, 60000);
						},error : function(){
							console.log("통신 오류");
						}
					});
				}else{
					alert("입력하신 이메일로 가입된 회원이 없습니다.");
				}
				
			},error : function(){
				console.log("통신 오류");
			}
		});
	
	});
				
});

$(function () {
    var codeBtn = $("#codeBtn");
    codeBtn.click(function () {
        var code = $("#code").val();

        if (num === code) {
        	alert("인증 성공");
        	
        	window.location.href = "newPwd.me";
        	
        } else {
        	alert("인증번호를 확인해주세요.");
        }
    });
});


function checkPwd() {
        var pwInput = document.getElementById("pwd");
        var pwMessage = document.getElementById("pwMessage");

        var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        var isValidPw = pwPattern.test(pwInput.value);

        if (isValidPw) {
            pwMessage.innerHTML = "사용 가능한 비밀번호 입니다.";
            pwMessage.className = "message";
        } else {
            pwMessage.innerHTML = "비밀번호는 최소 8자, 대소문자 및 숫자를 포함해야 합니다.";
            pwMessage.className = "error-message";
        }

        return isValidPw;
    }

    function checkMatch() {
        var passwordInput = document.getElementById("pwd");
        var confirmPasswordInput = document.getElementById("confirmPassword");
        var passwordMatchMessage = document.getElementById("passwordMatchMessage");

        var doPasswordsMatch = passwordInput.value === confirmPasswordInput.value;

        if (doPasswordsMatch) {
            passwordMatchMessage.innerHTML = "비밀번호가 일치합니다.";
            passwordMatchMessage.className = "message";
        } else {
            passwordMatchMessage.innerHTML = "비밀번호가 일치하지 않습니다.";
            passwordMatchMessage.className = "error-message";
        }

        return doPasswordsMatch;
    }