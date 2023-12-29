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

	<div class="container2 clearfix" style="padding-right: 0px;padding-left: 0px;">
    <div class="people-list" id="people-list">
        <div class="search">
            <button onclick="registration()">Enter the chat</button>
            <button onclick="fetchAll()">Refresh</button>
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
            <textarea id="message-to-send" name="message-to-send" placeholder="Type your message" rows="3"></textarea>

            <button id="sendBtn">Send</button>

        </div> <!-- end chat-message -->

    </div> <!-- end chat -->

</div> <!-- end container -->
    	
    	<script>
    	
	    	const url = 'http://localhost:8888/ttip';
	    	let stompClient;
	    	let selectedUser;
	    	let newMessages = new Map();
	    	let $chatHistory;
	    	let $button;
	    	let $textarea;
	    	let $chatHistoryList;
	    	
	    	/* window.onload = function() {
	    	    // 페이지가 로드될 때 실행되어야 할 코드
	    	    registration();
	    	    fetchAll();
	    	}; */
	    	
	
	    	function connectToChat(userName) {
	    	    console.log("connecting to chat...")
	    	    let socket = new SockJS(url + '/chat');
	    	    stompClient = Stomp.over(socket);
	    	    stompClient.connect({}, function (frame) {
	    	        console.log("connected to: " + frame);
	    	        stompClient.subscribe("/topic/messages/" + userName, function (response) {
	    	            let data = JSON.parse(response.body);
	    	            if (selectedUser === data.fromLogin) {
	    	                render(data.message, data.fromLogin);
	    	            } else {
	    	                newMessages.set(data.fromLogin, data.message);
	    	                $('#userNameAppender_' + data.fromLogin).append('<span id="newMessage_' + data.fromLogin + '" style="color: red">new</span>');
	    	            }
	    	        });
	    	    });
	    	}
	
	    	function sendMsg(from, text) {
	    	    stompClient.send("/app/chat/" + selectedUser, {}, JSON.stringify({
	    	        fromLogin: from,
	    	        message: text
	    	    }));
	    	}
	
	    	function registration() {
	    		
	    	    let userName = '${loginUser.userNickName}';
	
	    	    $.ajax({
	    	        type: "POST",
	    	        url: url + "/registration",
	    	        data: {userName : userName}, // 데이터를 JSON 문자열로 변환
	    	        success: function (response) {
	    	            connectToChat(userName);
	    	        },
	    	        error: function (error) {
	    	            if (error.status === 400) {
	    	                alert("Login is already busy!");
	    	            } else {
	    	                console.error("Registration failed:", error);
	    	            }
	    	        }
	    	    });
	    	}

	    	function selectUser(userName) {
	    	    console.log("selecting users: " + userName);
	    	    let fromId = '${loginUser.userNickName}';
	    	    selectedUser = userName;
	    	    let isNew = document.getElementById("newMessage_" + userName) !== null;
	    	    if (isNew) {
	    	        let element = document.getElementById("newMessage_" + userName);
	    	        element.parentNode.removeChild(element);
	    	    }
	    	    $('#selectedUserId').html('');
	    	    $('#selectedUserId').append('Chat with ' + userName);

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
	    	            console.error("Registration failed:", error);
	    	        }
	    	    });
	    	}
	
	    	function fetchAll() {
	    	    $.post(url + "/fetchAllUsers", function (response) {
	    	    	console.log(response);
	    	        let users = response;
	    	        let usersTemplateHTML = "";
	    	        for (let i = 0; i < users.length; i++) {
	    	            usersTemplateHTML = usersTemplateHTML + '<a href="#" onclick="selectUser(\'' + users[i] + '\')"><li class="clearfix">\n' +
	    	                '                <div class="user-container">\n' +
	    	                '                    <div id="userNameAppender_' + users[i] + '" class="user-name">' + users[i] + '</div>\n' +
	    	                '                    <div class="status">\n' +
	    	                '                        <i class="fa fa-circle offline"></i>\n' +
	    	                '                    </div>\n' +
	    	                '                </div>\n' +
	    	                '            </li></a>';
	    	        }
	    	        $('#usersList').html(usersTemplateHTML);
	    	    });
	    	}
	    	
	    	
	    	
	    	function init() {
	    	    cacheDOM();
	    	    bindEvents();
	    	}
	
	    	function bindEvents() {
	    	    $button.on('click', addMessage.bind(this));
	    	    $textarea.on('keyup', addMessageEnter.bind(this));
	    	}
	
	    	function cacheDOM() {
	    	    $chatHistory = $('.chat-history');
	    	    $button = $('#sendBtn');
	    	    $textarea = $('#message-to-send');
	    	    $chatHistoryList = $chatHistory.find('ul');
	    	}
	
	    	function render(message, userName) {
	    		
	    		
	    	    scrollToBottom();
	    	    var templateResponse = Handlebars.compile($("#message-response-template").html());
	    	    var contextResponse = {
	    	        response: message,
	    	        time: getCurrentTime(),
	    	        userName: userName
	    	    };
	
	    	    setTimeout(function () {
	    	        $chatHistoryList.append(templateResponse(contextResponse));
	    	        scrollToBottom();
	    	    }.bind(this), 1500);
	    	}
	
	    	function sendMessage(message) {
	    	    let username = '${loginUser.userNickName}';
	    	    console.log(username)
	    	    sendMsg(username, message);
	    	    scrollToBottom();
	    	    if (message.trim() !== '') {
	    	        var template = Handlebars.compile($("#message-template").html());
	    	        var context = {
	    	            messageOutput: message,
	    	            time: getCurrentTime(),
	    	            toUserName: selectedUser
	    	        };
	
	    	        $chatHistoryList.append(template(context));
	    	        scrollToBottom();
	    	        $textarea.val('');
	    	    }
	    	}
	
	    	function scrollToBottom() {
	    	    $chatHistory.scrollTop($chatHistory[0].scrollHeight);
	    	}
	
	    	function getCurrentTime() {
	    	    return new Date().toLocaleTimeString().replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
	    	}
	
	    	function addMessage() {
	    	    sendMessage($textarea.val());
	    	}
	
	    	function addMessageEnter(event) {
	    	    if (event.keyCode === 13) {
	    	        addMessage();
	    	    }
	    	}
	    	
	
	    	init();
    	
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
	</body>
</html>