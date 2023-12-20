   function joinForm() {
        var isValid = true;
        isValid = checkPwd() && isValid;
        isValid = checkMatch() && isValid;

        // 필수 입력 필드 확인
        var requiredFields = document.querySelectorAll('input[required], select[required]');
        for (var i = 0; i < requiredFields.length; i++) {
            if (!requiredFields[i].value) {
                alert("모든 필수 입력 항목을 채워주세요.");
                return false; // 폼 전송을 중지합니다.
            }
        }

        // 셀렉트박스 선택 여부 확인
        var selectBoxes = document.querySelectorAll('select[required]');
        for (var i = 0; i < selectBoxes.length; i++) {
            if (selectBoxes[i].selectedIndex === 0) {
                alert("셀렉트박스를 선택하세요.");
                return false; // 폼 전송을 중지합니다.
            }
        }

        return isValid;
    }

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
    


function checkNickname() {
    var inputNickName = $("#userNickName");

    if (inputNickName.val().trim().length >= 5) {
        $.ajax({
            url: "checkNickname.do",
            data: { nickname: inputNickName.val() },
            success: function (result) {
                if (result === "NNNNN") {
                    $("#nicknameCheckResult").show();
                    $("#nicknameCheckResult").css("color", "red").text("사용 불가능한 별명입니다.");
                    $("button[type=submit]").attr("disabled", true);
                } else { // 사용가능
                    $("#nicknameCheckResult").show();
                    $("#nicknameCheckResult").css("color", "green").text("사용 가능한 별명입니다.");
                    $("button[type=submit]").attr("disabled", false);
                }
            },
            error: function () {
                console.log("통신 오류");
            }
        });
    }
}

var num = "";

$(function(){
			
	var email = $("#email");
	
	var mailBtn = $("#mailBtn");
	
	mailBtn.click(function(){
		
		$.ajax({
			url : "sendMail.me",
			data : {email : email.val()},
			success : function(result){
				num = result;
			},error : function(){
				console.log("통신 오류");
			}
		});
	});
				
});

let check1 = "n";


$(function () {
    var check = $("#check");
    check.click(function () {
        var inputNum = $("#checkNum").val();

        if (num === inputNum) {
        	alert("이메일 인증성공!");
            check1 = "y";
        } else {
        	alert("인증번호를 확인해주세요.");
        }
    });
});


$(function () {
    var enroll = $("#enroll");

    enroll.click(function () {
        if (check1 !== "y") {
            alert("이메일 인증을 해주세요.");
            return false;
        }
        
        console.log("회원가입 성공");
        
        return true;
    });
});
