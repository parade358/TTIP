<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>
	<script>
		//웹소켓 접속 함수
		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 때문에 전역변수에 담아두고 사용한다)
		
		//연결함수(접속)
		function connect(){
			//접속경로를 담아 socket을 생성한다.
			var url = "ws://localhost:8888/ttip/member"
			socket = new WebSocket(url);
			
			socket.onopen = function(){
				console.log("연결성공");
			}
			
			socket.onclose = function(){
				console.log("연결종료");
			}
			
			socket.onerror = function(e){
				console.log("에러가 발생했습니다.");
				console.log(e);
			}
			socket.onmessage = function(message){
				console.log("메세지가 도착했습니다.");
				console.log(message);
				var div = document.createElement("div");
				div.textContent = message.data;
				document.querySelector("#chatArea").appendChild(div);
			}
		}
		
		//접속종료
		function disconnect(){
			socket.close(); //소켓닫기
		}
		
		//메세지 전송
		function send(){
			var text = document.getElementById("chat").value;
			socket.send(text);
			document.getElementById("chat").value = "";
		}
		
	</script>

	<h1>Member Websocket Server</h1>
	
	<h2>로그인 여부 : true</h2>
	
	<button onclick="connect();">접속</button>
	<button onclick="disconnect();">종료</button>
	
	<input type="text" id="chat">
	<button onclick="send();">전송</button>
	<div id="chatArea"></div>
</body>
</html>