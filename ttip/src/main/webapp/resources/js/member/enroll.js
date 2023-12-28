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

document.addEventListener('DOMContentLoaded', function () {
    var checkboxes = document.getElementsByName("check");
    var selectAllCheckbox = document.getElementById("selectAll");

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('change', function () {
            var allChecked = true;

            for (var j = 0; j < checkboxes.length; j++) {
                if (!checkboxes[j].checked) {
                    allChecked = false;
                    break;
                }
            }

            selectAllCheckbox.checked = allChecked;
        });
    }
});




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


//이용약관
function showDetails_1(type, content) {
  const modalWrap_1 = document.getElementById(`modalWrap_1${type}`);
  modalWrap_1.style.display = 'block';
  const modalBody = modalWrap_1.querySelector('.modalBody');
  modalBody.innerHTML = `<span class="closeBtn" onclick="closeDetails_1('${type}')">&times;</span>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>이용약관</title>
  <style>
      .modalBody {
        overflow-y: auto;
        max-height: 400px; 
      }
    </style>
  <head>
  </head>
  <body>
    <div style="text-align: center;">
  <h4>이용약관</h4><br>
  <p>
  1. 서비스 이용자는 서비스 이용 시 본 약관에 동의하는 것으로 간주됩니다.
  </p>
  <br>
  <p>
  2. 서비스 제공자는 서비스의 원활한 제공을 위해 필요한 경우, 사전 고지 후 서비스를 일시적으로 중단할 수 있습니다.
  </p>
  <br>
  <p>
  3. 서비스 이용자는 서비스를 부정하게 이용하거나 다른 이용자에게 피해를 주어서는 안 됩니다.
  </p>
  <br>
  <p>
  4. 서비스 제공자는 서비스의 품질 향상을 위해 시스템 정기 점검을 실시할 수 있으며, 이 경우에는 사전에 공지합니다.
  </p>
  <br>
  <p>
  5. 본 이용약관의 내용은 변경될 수 있으며, 변경된 내용은 서비스 내 공지사항을 통해 확인할 수 있습니다.
  </p>
  <br>
  <p>
  6. 기타 이용약관에 관한 사항은 관련 법령에 따릅니다.
  </p>
  <br>
  <p>
  이용약관은 20XX년 X월 X일부터 시행됩니다.
  </p>
    </div>
  </body>
  </html>`;
}




//개인정보 수집 및 이용 
function showDetails_2(type, content) {
  const modalWrap_2 = document.getElementById(`modalWrap_2${type}`);
  modalWrap_2.style.display = 'block';
  const modalBody = modalWrap_2.querySelector('.modalBody');
  modalBody.innerHTML = `<span class="closeBtn" onclick="closeDetails_2('${type}')">&times;</span>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>개인정보 수집 및 이용</title>
  <style>
      .modalBody {
        overflow-y: auto;
        max-height: 400px; 
      }
    </style>
  <head>
  </head>
  <body>
    <div style="text-align: center;">
 	<h4>개인정보 수집 및 이용 안내</h4> <br>

    <p>
        1. 수집하는 개인정보 항목
        <br>
        서비스 이용 시 수집되는 개인정보는 다음과 같습니다<br>
        - 성명 <br>
        - 전화번호 <br>
        - 이메일 주소 <br>
    </p>
	<br>
    <p>
        2. 개인정보의 수집 및 이용 목적
        <br>
        수집된 개인정보는 다음과 같은 목적을 위해 활용됩니다<br>
        - 서비스 제공 및 관리 <br>
        - 고객 지원 및 문의 응답 <br>
    </p> 
	<br>
    <p>
        3. 개인정보의 보유 및 이용 기간
        <br>
        서비스를 제공하는 동안에 한하여 개인정보를 보유하며, 서비스 종료 시에는 즉시 파기됩니다.
    </p>
	<br>
    <p>
        4. 개인정보의 파기 절차 및 방법
        <br>
        개인정보의 수집 및 이용 목적이 달성된 후에는 별도의 저장 장치에 따로 저장되지 않고 안전하게 파기됩니다.
    </p>
	<br>
    <p>
        5. 개인정보의 제공
        <br>
        이용자의 동의 없이는 개인정보를 제3자에게 제공하지 않습니다.
    </p>
	<br>
    <p>
        6. 기타 개인정보 관련 권리
        이용자는 언제든지 자신의 개인정보에 대한 접근, 정정, 삭제, 처리 정지 등의 권리를 행사할 수 있습니다.
    </p>
	<br>
    <p>
        이용약관은 20XX년 X월 X일부터 시행됩니다.
    </p>
    </div>
  </html>`;
}

function closeDetails_1(type) {
  const modalWrap_1 = document.getElementById(`modalWrap_1${type}`);
  modalWrap_1.style.display = 'none';
}

function closeDetails_2(type) {
  const modalWrap_2 = document.getElementById(`modalWrap_2${type}`);
  modalWrap_2.style.display = 'none';
}
