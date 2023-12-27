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
				setTimeout(function() {
					num = "xxxxx";
				}, 60000);
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
        	$("#email, #checkNum").prop('readonly', true);
        	$("#mailBtn, #check").prop('disabled', true);
        	$("#countdown").hide();
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
        
        return true;
    });
});


document.addEventListener('DOMContentLoaded', function() {
    var countdownTime = 60;
    var countdownInterval;

    document.getElementById('mailBtn').addEventListener('click', function() {
        clearInterval(countdownInterval);
        countdownTime = 60;
        updateCountdown();
        countdownInterval = setInterval(updateCountdown, 1000);
    });

    function updateCountdown() {
        var countdownElement = $("#countdown");

        countdownElement.text('인증번호를 시간안에 입력해주세요 : ' + countdownTime + '초');

        if (countdownTime === 0) {
            countdownElement.css('color', 'red');
            countdownElement.text('인증번호를 다시 발급해주세요.');
            clearInterval(countdownInterval);
        } else {
            countdownElement.css('color', 'green');
            countdownTime--;
        }
    }
});



function toggleCheckboxes() {
    var checkboxes = document.getElementsByName("check");
    var selectAllCheckbox = document.getElementById("selectAll");

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = selectAllCheckbox.checked;
    }
}


// 이메일 전송 (중복체크)
function emailSend() {
    var inputEmail = $("#email");

    if (inputEmail.val().trim().length >= 1) {
        $.ajax({
            url: "emailSend.do",
            data: { emailck: inputEmail.val() },
            cache: false,
            success: function (result) {
                if (result === "NNNNN") {
                    // 이미 사용중인 이메일 메시지 표시
                    $("#emailCheck").show();
                    $("#emailCheck").css("color", "red").text("이미 사용중인 이메일 입니다. 다른 이메일을 사용 해 주세요.");
                    
                    // 이미 사용중인 이메일일 경우 인증번호 입력을 비활성화
                    $("#checkNum").prop("disabled", true);
                    
                    // 인증 메시지 및 버튼 숨김
                    $("#countdown").hide();
                    $("#mailBtn, #check").prop('disabled', true);
                } else { // 사용가능
                    // 사용 가능한 이메일 메시지 표시
                    $("#emailCheck").show();
                    $("#emailCheck").css("color", "green").text("사용 가능한 이메일 입니다.");
                    
                    // 사용 가능한 이메일일 경우 인증번호 입력을 활성화
                    $("#checkNum").prop("disabled", false);
                }
            },
            error: function () {
                console.log("통신 오류");
            }
        });
    }
}



//별명 중복체크
function checkNickname() {
    var inputNickName = $("#userNickName");

    if (inputNickName.val().trim().length >= 1) {
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




//이용약관 모달창
const popupBtn = document.getElementById('popupBtn');

    function showDetails(type, content) {
      const modalWrap = document.getElementById(`modalWrap${type}`);
      modalWrap.style.display = 'block';
      const modalBody = modalWrap.querySelector('.modalBody');
      modalBody.innerHTML = `<span class="closeBtn" onclick="closeDetails('${type}')">&times;</span><p>${content}</p>`;
	  	
		    
    }

    function closeDetails(type) {
      const modalWrap = document.getElementById(`modalWrap${type}`);
      modalWrap.style.display = 'none';
    }

    popupBtn.onclick = function () {
      // 전체동의 동작 추가
    };

    window.onclick = function (event) {
      // 모달 외 다른 부분 클릭 시 모달 닫기 동작 추가
    };

