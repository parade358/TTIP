<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Custom messanger</title>
	
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
   
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
	
	<%-- <script src="${contextPath }/resources/js/sockjs.min.js"></script> --%>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script> -->
	<%-- <script src="${contextPath }/resources/js/chat.js"></script> --%>
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	
    <link rel="stylesheet" href="${contextPath }/resources/css/chat.css">
    
</head>
<body>
	
	<%@ include file="../common/header.jsp" %>

	<div class="container clearfix" style="padding-right: 0px;padding-left: 0px;">
    <div class="people-list" id="people-list">
        <div class="search" style="color: white; font-size: 20px; font-weight: bold;">
            유저 리스트
        </div>
        <ul class="list" id="usersList">
        
        </ul>
    </div>

    <div class="chat">
        <div class="chat-header clearfix">
            
            <div class="chat-about">
                <div class="chat-with" id="selectedUserId"></div>
                <div class="chat-num-messages"></div>
            </div>
            
        </div> <!-- end chat-header -->

        <div class="chat-history">
            <ul id="chat-content">

            </ul>

        </div> <!-- end chat-history -->

        <div class="chat-message clearfix">
            <textarea id="message-to-send" name="message-to-send" placeholder="채팅을 입력해주세요." rows="3"></textarea>

            <button id="sendBtn" onclick="send();">Send</button>

        </div> <!-- end chat-message -->

    </div> <!-- end chat -->

</div> <!-- end container -->
    	
    	<script>
    	
    		let fromId = '${loginUser.userNickName}';
    		
    		let $chatHistory;

	    	function selectUser(userName) {
	    	    console.log("selecting users: " + userName);
	    	    selectedUser = userName;
	    	    let isNew = document.getElementById("newMessage_" + userName) !== null;
	    	    if (isNew) {
	    	        let element = document.getElementById("newMessage_" + userName);
	    	        element.parentNode.removeChild(element);
	    	    }
	    	    $('#selectedUserId').html('');
	    	    $('#selectedUserId').append(userName+'님과의 채팅방');

	    	    $.ajax({
	    	        type: "POST",
	    	        url: "selectChat",
	    	        data: {
	    	            userName: userName,
	    	            fromId: fromId
	    	        },
	    	        success: function (response) {
	    	            scrollToBottom();
	    	            let chatContent = "";

	    	            for (let i = 0; i < response.length; i++) {
	    	                if (response[i].fromLogin == fromId) {
	    	                    chatContent += '<li class="clearfix">\n' +
	    	                        '    <div class="message-data align-right">\n' +
	    	                        '        <span class="message-data-time">'+ response[i].createDate + '</span> &nbsp; &nbsp;\n' +
	    	                        '        <span class="message-data-name">You</span> <i class="fa fa-circle me"></i>\n' +
	    	                        '    </div>\n' +
	    	                        '    <div class="message other-message float-right">\n' +
	    	                        '        ' + response[i].message +
	    	                        '    </div>\n' +
	    	                        '</li>';
	    	                } else {
	    	                    chatContent += '<li class="clearfix">\n' +
	    	                        '    <div class="message-data">\n' +
	    	                        '        <span class="message-data-name"><i class="fa fa-circle online"></i>' + response[i].fromLogin + '</span>\n' +
	    	                        '        <span class="message-data-time">'+ response[i].createDate + '</span>\n' +
	    	                        '    </div>\n' +
	    	                        '    <div class="message my-message">\n' +
	    	                        '        ' + response[i].message +
	    	                        '    </div>\n' +
	    	                        '</li>';
	    	                        
	    	                }
	    	            }
	    	            $('#chat-content').html(chatContent);
	    	            scrollToBottom();
	    	        },
	    	        error: function (error) {
	    	        }
	    	    });
	    	}
	    	
	    	function fetchAll() {
	    	    $.ajax({
	    	        type: "POST",
	    	        url: "selectChatUserList",
	    	        data: {
	    	            fromId: fromId
	    	        },
	    	        success: function (response) {
	    	            let users = response;
	    	            let usersTemplateHTML = "";
	    	            let addedToLogins = []; // 중복 체크를 위한 배열
						console.log("??");
	    	            for (let i = 0; i < users.length; i++) {
	    	                let toLogin = users[i].toLogin;

	    	                // 중복된 toLogin이 이미 추가되었는지 확인
	    	                if (addedToLogins.indexOf(toLogin) === -1) {
	    	                    usersTemplateHTML += '<a href="#" onclick="selectUser(\'' + toLogin + '\')" style="text-decoration: none;color: white;"><li class="clearfix">\n' +
	    	                        '    <div class="user-container">\n' +
	    	                        '        <div id="userNameAppender_' + toLogin + '" class="user-name">' + toLogin + '</div>\n' +
	    	                        '        <div class="status">\n' +
	    	                        '            <i class="fa fa-circle offline"></i>\n' +
	    	                        '        </div>\n' +
	    	                        '    </div>\n' +
	    	                        '</li></a>';

	    	                    // 중복 체크를 위해 추가된 toLogin을 배열에 추가
	    	                    addedToLogins.push(toLogin);
	    	                }
	    	            }

	    	            
	    	            if("${nullUser}" !== ""){
	    	            	
	    	            	usersTemplateHTML += '<a href="#" onclick="selectUser(\'' + "${nullUser}" + '\')" style="text-decoration: none;color: white;"><li class="clearfix">\n' +
	                        '    <div class="user-container">\n' +
	                        '        <div id="userNameAppender_' + "${nullUser}" + '" class="user-name">' + "${nullUser}" + '</div>\n' +
	                        '        <div class="status">\n' +
	                        '            <i class="fa fa-circle offline"></i>\n' +
	                        '        </div>\n' +
	                        '    </div>\n' +
	                        '</li></a>';
	    	            	
	    	            }
	    	            
	    	            $('#usersList').html(usersTemplateHTML);
	    	        },
	    	        error: function (error) {
	    	            // 에러 처리
	    	        }
	    	    });
	    	}
	    	
	    	function cacheDOM() {
	    	    $chatHistory = $('.chat-history');
	    	    $button = $('#sendBtn');
	    	    $textarea = $('#message-to-send');
	    	    $chatHistoryList = $chatHistory.find('ul');
	    	}
	    	
	    	function scrollToBottom() {
	    	    $chatHistory.scrollTop($chatHistory[0].scrollHeight);
	    	}
	    	
	    	

	    	
    	
    	</script>
    	
		<script id="message-template" type="text/x-handlebars-template">
    		<li class="clearfix">
       			<div class="message-data align-right">
            		<span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp;
            		<span class="message-data-name">You</span> <i class="fa fa-circle me"></i>
        		</div>
        		<div class="message other-message float-right">
            		{{messageOutput}}
        		</div>
    		</li>
		</script>

		<script id="message-response-template" type="text/x-handlebars-template">
    		<li>
        		<div class="message-data">
           			<span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span>
          			<span class="message-data-time">{{time}}, Today</span>
        		</div>
        		<div class="message my-message">
            	{{response}}
        		</div>
    		</li>
		</script>
	
		<jsp:include page="../common/footer.jsp" />
	
	<script>

		//웹소켓 접속 함수 
		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 때문에 전역변수에 담아두고 사용한다)
		
		$(function() {
			
			connect();
			
			console.log("${selectUser}");
			console.log("${nullUser}");
			
			if("${selectUser}" !== "") {
				
				fetchAll();
				
				cacheDOM();
				
				selectUser("${selectUser}");
				
		    }else if("${nullUser}" !== ""){
		    	
		    	fetchAll();
		    	
		    	cacheDOM();
		    	
		    	selectUser("${nullUser}");
		    	

		    }else {
		        fetchAll();
		        cacheDOM();
		    }
			
			
		});
		
		//연결함수(접속)
		function connect(){
			//접속경로를 담아 socket을 생성한다.
			var url = "ws://localhost:8888/ttip/member";
			socket = new WebSocket(url);
			
			//연결이 되었을때
			socket.onopen = function(){
				console.log("연결 성공");	
			};
			//연결이 종료됐을때
			socket.onclose = function(){
				console.log("연결 종료");
			};
			//에러가 발생했을때
			socket.onerror = function(e){
				console.log("에러가 발생했습니다.");
				console.log(e);
			}
			//메세지가 왔을때 
			socket.onmessage = function(message){
				
				
				console.log("메세지가 도착했습니다.");
				console.log(message); 
				
				// JSON 형식으로 전달된 메시지 파싱
			    var parsedMessage = JSON.parse(message.data);

			    // senderId와 receiverId 값 얻기
			    var senderId = parsedMessage.fromLogin;
			    var receiverId = parsedMessage.toLogin;
			    var msg = parsedMessage.message;
			    
			    console.log(senderId);
			    console.log("${loginUser.userNickName}");
				
			    if(senderId !== "${loginUser.userNickName}"){
			    	
				 scrollToBottom();
		    	    var templateResponse = Handlebars.compile($("#message-response-template").html());
		    	    var contextResponse = {
		    	        response: msg,
		    	        time: getCurrentTime(),
		    	        userName: senderId
		    	    };
		
		    	    setTimeout(function () {
		    	        $chatHistoryList.append(templateResponse(contextResponse));
		    	        scrollToBottom();
		    	    }.bind(this), 1500);
				
			    }
			    
			}
		}
		
		//접속종료 
		function disconnect(){
			socket.close();//소켓 닫기 
		}
		
		
		function send() {
			var text = document.getElementById("message-to-send");
			if (text.value.trim().length == 0) {
				alert("채팅을 입력해주세요.");
				text.value = "";

			} else {
				//전송된 시간으로 업데이트(전송 시간으로 업데이트를 해야 상대가 읽고 있지 않을때 빨간원에 숫자로 표시할 수 있음. DB에서 메세지를 보낸 시간이랑 채팅방에 접속한 시간을 비교해서 빨간원에 표시하기 때문)
// 				updateConnectTime($("#currentChatRoomNo").val());
				//메세지를 JSON 형식으로 키와 값을 부여해서 전송
				const chatMessage = {
					"fromLogin" : "${loginUser.userNickName}",
					"toLogin" : selectedUser,
					"message" : text.value
				};
				//메세지 전송
				socket.send(JSON.stringify(chatMessage));
				//채팅 입력창 초기화				
				
				var template = Handlebars.compile($("#message-template").html());
	    	        var context = {
	    	            messageOutput: text.value,
	    	            time: getCurrentTime(),
	    	            toUserName: selectedUser
	    	        };
	
	    	        $chatHistoryList.append(template(context));
	    	        scrollToBottom();
				
				text.value = "";
			}			
		}
		
		function getCurrentTime() {
    	    return new Date().toLocaleTimeString().replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
    	}
	
	</script>

	
</body>
</html>