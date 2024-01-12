<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <!-- 부트스트랩 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <style>
        .wrap{
            width:970px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>

<%@include file="../common/header.jsp" %>

<!-- 전체 영역 -->
<div class="wrap">
    
    <!-- 네비바 -->
    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand">관리자 페이지</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" id="user">유저 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="board">게시글 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="reply">댓글 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="chat">채팅 관리</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </div>
        
        
        <!-- 유저관리 -->
        <div id="userAdmin" class="management-panel">
        <div  id="user">
            <br>
            <h3>유저관리</h3><br>
        </div>
        <div>
			   <div class="d-flex">
				    <input style="width: 500px;" class="form-control me-2" type="search" name="userKeyword" id="userKeyword" placeholder="유저 아이디(이메일 형식)" aria-label="Search">
				    <button style="width: 75px;" class="btn btn-outline-primary" onclick="searchUser();">검색</button>
               </div>
               <br>
        </div>
        <div>
            <table class="table" id="userList">
                <thead> <!--영역 설정-->
                    <tr><!--한 행의 시작-->
                        <th>유저 아이디</th> <!--굵은 글씨로 제목의 용도로 사용-->
                        <th>상태</th>
                        <th>복구/탈퇴</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 함수를 통해 표 만들 곳 -->
                </tbody>
            </table>
        </div>
    </div>
    
    
    <!-- 게시글 관리 -->
    <div id="boardAdmin" style="display: none;" class="management-panel">
        <div>
            <br>
            <h3>게시글 관리</h3><br>
        </div>
        <div>
               <div class="d-flex">
                   <input style="width: 500px;" class="form-control me-2" type="search" name="boardKeyword" id="boardKeyword" placeholder="유저 아이디(이메일 형식)" aria-label="Search">
                   <button style="width: 75px;" class="btn btn-outline-primary" onclick="searchBoard();">검색</button>
               </div>
               <br>
        </div>
        <div>
            <table class="table" id="boardList">
                <thead> <!--영역 설정-->
                    <tr><!--한 행의 시작-->
                        <th>게시글 번호</th>
                        <th>게시글</th>
                        <th>작성자</th> <!--굵은 글씨로 제목의 용도로 사용-->
                        <th>상태</th>
                        <th>복구/삭제</th>
                    </tr>
                </thead>
                <tbody><!--표 몸통-->
                    
                </tbody>
            </table>
        </div>
    </div>
    
    
    <!-- 댓글 관리 -->
    <div id="replyAdmin" style="display: none;" class="management-panel">
        <div>
            <br>
            <h3>댓글 관리</h3><br>
        </div>
        <div>
<!--                <form class="d-flex" role="search"> -->
<!--                    <input style="width: 500px;" class="form-control me-2" type="search" placeholder="유저 아이디" aria-label="Search"> -->
<!--                    <button style="width: 75px;" class="btn btn-outline-primary" type="submit">검색</button> -->
<!--                </form> -->
               <br>
        </div>
        <div>
            <table class="table">
                <thead> <!--영역 설정-->
                    <tr><!--한 행의 시작-->
                        <th>유저 아이디</th> <!--굵은 글씨로 제목의 용도로 사용-->
                        <th>상태</th>
                        <th>복구/탈퇴</th>
                    </tr>
                </thead>
                <tbody><!--표 몸통-->
                    <tr><!--행추가-->
                        <td>user1</td><!--하나의 열-->
                        <td>Y</td>
                        <td>
                            <button type="button" class="btn btn-success">복구</button>
                            <button type="button" class="btn btn-danger">탈퇴</button>
                        </td>
                    </tr>
                    <tr>
                        <td>user2</td>
                        <td>N</td>
                        <td>
                            <button type="button" class="btn btn-success">복구</button>
                            <button type="button" class="btn btn-danger">탈퇴</button>
                        </td>
                    </tr>
                    <tr>
                        <td>user3</td>
                        <td>Y</td>
                        <td>
                            <button type="button" class="btn btn-success">복구</button>
                            <button type="button" class="btn btn-danger">탈퇴</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- 채팅 관리 -->
    <div id="chatAdmin" style="display: none;" class="management-panel">
        <div>
            <br>
            <h3>채팅 관리</h3><br>
        </div>
        <div>
               <div class="d-flex">
<!--                    <input style="width: 500px;" class="form-control me-2" name="chat" id="chat"> -->
<!--                    <button style="width: 75px;" class="btn btn-outline-primary" type="submit">검색</button> -->
               </div>
               <br>
        </div>
        <div>
            <table class="table" id="chatList">
                <thead> <!--영역 설정-->
                    <tr><!--한 행의 시작-->
                        <th>채팅 번호</th> <!--굵은 글씨로 제목의 용도로 사용-->
                        <th>보내는 유저</th>
                        <th>받는 유저</th>
                        <th>채팅 내용</th>
                    </tr>
                </thead>
                <tbody><!--표 몸통-->
                </tbody>
            </table>
        </div>
    </div>
    </div>


	<!-- script -->
    <script>
    
    	//네비바 관련 함수    	
        $(document).ready(function() {
            // 초기에는 첫 번째 패널을 보이게 설정
            $(".management-panel:first").show();
            // 네비게이션 바의 링크 클릭 이벤트 처리
            $(".navbar-nav a").click(function(e) {
                e.preventDefault();
                $(".navbar-nav a").removeClass("active");
                // 클릭한 a 태그에 'active' 클래스 추가
                $(this).addClass("active");
                // 선택된 링크의 href 값을 가져와 해당하는 패널을 보이게 하고 나머지는 숨김
                var targetPanel = '#' + $(this).attr("id")+'Admin';
                $(".management-panel").hide();
                $(targetPanel).show();
            });
        });
    	
    	
    	//유저 관리 관련 함수
    	$(function() {
			userList();
		});
    	
    	function userList() {
    		$.ajax ({
    			url : "selectUser.ad",
    			success : function(result) {
    				var str = "";
    				for (var i in result) {
    					str += "<tr>" + 
    					  "<td>" + result[i].email + "</td>" +
    					  "<td>" + result[i].status + "</td>" +
    					  "<td> <button type='button' class='btn btn-success' onclick=\"location.href='restore.ad?email=" + result[i].email + "'\">복구</button> <button type='button' class='btn btn-danger' onclick=\"location.href='out.ad?email=" + result[i].email + "'\">탈퇴</button> </td></tr>";
    				}
    				
    				$("#userList tbody").html(str);
    				console.log("3");
    			},
    			error : function() {
    				console.log("통신 오류");
    			}
    		});
    	}
    	
    	//게시글 관리 관련 함수
    	$(function() {
			boardList();
		});
    	
    	function boardList() {
    		$.ajax ({
    			url : "selectBoard.ad",
    			success : function(result) {
    				var str = "";
    				for (var i in result) {
    					str += "<tr>" + 
    					  "<td>" + result[i].boardNo + "</td>" +
    					  "<td>" + result[i].boardTitle + "</td>" +
    					  "<td>" + result[i].boardWriter + "</td>" +
    					  "<td>" + result[i].status + "</td>" +
    					  "<td> <button type='button' class='btn btn-success' onclick=\"location.href='boardRestore.ad?bno=" + result[i].boardNo + "'\">복구</button> <button type='button' class='btn btn-danger' onclick=\"location.href='boardDelete.ad?bno=" + result[i].boardNo + "'\">삭제</button> </td></tr>";
    				}
    				
    				$("#boardList tbody").html(str);
    				console.log("1");
    			},
    			error : function() {
    				console.log("통신 오류");
    			}
    		});
    	}
    	
    	
    	//채팅 관련 함수
    	$(function() {
			chatList();
		});
    	
    	function chatList() {
    	    $.ajax ({
    	        url: "selectChat.ad",
    	        success: function(result) {
    	            var str = "";
    	            for (var i in result) {
    	                str += "<tr>" +
    	                    "<td>" + result[i].chatNo + "</td>" +
    	                    "<td>" + result[i].fromLogin + "</td>" +
    	                    "<td>" + result[i].toLogin + "</td>" +
    	                    "<td>" + result[i].message + "</td>";
    	            }

    	            $("#chatList tbody").html(str);   // table id 값
    	        },
    	        error: function() {
    	            console.log("통신 오류");
    	        }
    	    });
    	}

    	
    	
    	
    	function searchUser() {
    		
    		var userKeyword = $("#userKeyword").val();
    		
    		console.log(userKeyword);
    		
    		$.ajax ({
    			url : "searchUser.ad",
    			data: {userKeyword : userKeyword},
    			success : function(result) {
    				if (result.length > 0) {
	            	    // 검색 결과가 있는 경우
	            	    $("#userList tbody").empty(); // 기존 목록 비우기
	            	    // 검색 결과를 반복하면서 행을 추가
	            	    for (var i = 0; i < result.length; i++) {
	            	        var row = result[i];
	            	        var newRow = "<tr>" +
	            	            "<td>" + row.email + "</td>" +
	            	            "<td>" + row.status + "</td>" +
	            	            "<td> <button type='button' class='btn btn-success' onclick=\"location.href='restore.ad?email=" + result[i].email + "'\">복구</button> <button type='button' class='btn btn-danger' onclick=\"location.href='out.ad?email=" + result[i].email + "'\">탈퇴</button> </td></tr>";
	            	        $("#userList tbody").append(newRow);
	            	        console.log("2");
	            	    }
	            	} else {
	            	    alert("검색된 게시글이 없습니다.");
	            	}
    			},
    			error : function() {
    				console.log("통신 오류");
    			}
    		});
    	}
    	
    	
    	function searchBoard() {
			var boardKeyword = $("#boardKeyword").val();
    		
    		$.ajax ({
    			url : "searchBoard.ad",
    			data: {boardKeyword : boardKeyword},
    			success : function(result) {
    				if (result.length > 0) {
	            	    // 검색 결과가 있는 경우
	            	    $("#boardList tbody").empty(); // 기존 목록 비우기
	            	    // 검색 결과를 반복하면서 행을 추가
	            	    for (var i = 0; i < result.length; i++) {
	            	        var row = result[i];
	            	        var newRow = "<tr>" +
	            	        "<td>" + result[i].boardNo + "</td>" +
	    					  "<td>" + result[i].boardTitle + "</td>" +
	    					  "<td>" + result[i].boardWriter + "</td>" +
	    					  "<td>" + result[i].status + "</td>" +
	    					  "<td> <button type='button' class='btn btn-success' onclick=\"location.href='boardRestore.ad?bno=" + result[i].boardNo + "'\">복구</button> <button type='button' class='btn btn-danger' onclick=\"location.href='boardDelete.ad?bno=" + result[i].boardNo + "'\">삭제</button> </td></tr>";
	            	        $("#boardList tbody").append(newRow);
	            	    }
	            	} else {
	            	    alert("검색된 게시글이 없습니다.");
	            	}
    			},
    			error : function() {
    				console.log("통신 오류");
    			}
    		});
    	}
    	
    	
    	
    </script>
    
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>