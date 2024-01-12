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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/carousel.css">
    
    <style>
    
    .warp {
    	width : 970px;
    	margin-left : auto;
    	margin-right : auto;
    }

	body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
    }

    .container-fluid {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .sidebar {
        background-color: #f4f4f4;
        border-radius: 10px;
        padding: 20px;
    }

    .navbar {
        background-color: #e9ecef;
        border-radius: 5px;
    }

    .dropdown-menu {
        border: none;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .section-title {
        border-bottom: 2px solid #8E8FFA;
        margin-bottom: 20px;
        padding-bottom: 10px;
    }

    .bg-white {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .border-top-0 {
        border-top: none;
    }

    .text-primary {
        color: #8A2BE2;
    }

    .font-weight-bold {
        font-weight: bold;
    }

    .text-uppercase {
        text-transform: uppercase;
    }

    .btn-primary {
        background-color: #8E8FFA;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
    }

    .btn-delete {
        background-color: #8E8FFA;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
    }
    
    .form-control {
    	width : 250px;
    }
    
    .pagination {
    	margin-left : 400px;
    }
    
    
    </style>
    
    
</head>

<body>

	<!-- 헤더바 -->
    <%@include file="../common/header.jsp" %>
    
    <div class="warp">
	    <div>
	        <nav class="navbar navbar-expand-lg navbar-light bg-light">
		        <div class="container-fluid">
			        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			        	<span class="navbar-toggler-icon"></span>
			        </button>
			        <div class="collapse navbar-collapse" id="navbarSupportedContent">
				       	<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					        <li class="nav-item">
					        	<a class="nav-link active" aria-current="page" id="user">나의 정보</a>
					        </li>
					        <li class="nav-item">
					       		<a class="nav-link" id="board">MY 게시글</a>
					        </li>
					        
				        </ul>
			        </div>
		        </div>
	        </nav>
        </div>
        
        <div id="userAdmin" class="management-panel">
	        <div class="col-lg-10" >
		        <form action="update.me" method="post" id="myForm">
						
				<div class="bg-white border border-top-0 p-4 mb-3" style="width : 940px;">
					<div class="container">
						<div class="row">
							<div class="col-lg-3" style="display: inline; margin-bottom: 30px;">
								<i class="fa fa-id-card-alt text-primary mr-2"></i>
								<h5 class="m-0 text-uppercase font-weight-bold" style="display:inline">이메일</h5>
							</div>
							<div class="col-lg-3" style="text-align: left; display: inline; margin-bottom: 30px;">
								<input type="text" class="form-control" id="email" value="${loginUser.email }" name="email" readonly> 
							</div>
							
							<div class="col-lg-3" style="display: inline; margin-bottom: 30px;">
								<i class="fa fa-signature text-primary mr-2"></i>
								<h5 class="m-0 text-uppercase font-weight-bold" style="display: inline;">이름</h5>
							</div>
							<div class="col-lg-3" style="text-align: left; display: inline; margin-bottom: 30px;">
								<input type="text" class="form-control" id="userName" value="${loginUser.userName }" name="userName" readonly> 
							</div>
							
							<div class="col-lg-3" style="display: inline; margin-bottom: 30px;">
								<i class="fa fa-signature text-primary mr-2"></i>
								<h5 class="m-0 text-uppercase font-weight-bold" style="display: inline;">별명</h5>
							</div>
							<div class="col-lg-3" style="text-align: left; display: inline; margin-bottom: 30px;">
								<input type="text" class="form-control" id="userNickName" value="${loginUser.userNickName }" name="userNickName" required> 
							</div>
						
							<div class="col-lg-3" style="display: inline; margin-bottom: 30px;">
								<i class="fa fa-genderless text-primary mr-2"></i>
								<h5 class="m-0 text-uppercase font-weight-bold" style="display:inline">성별</h5>
							</div>
							<div class="col-lg-3" style="text-align: left; display: inline; margin-bottom: 30px;">
								<input type="radio" id="Male" value="M" name="gender">
			                    <label for="Male">남자</label> &nbsp;&nbsp;
			                    <input type="radio" id="Female" value="F" name="gender">
			                    <label for="Female">여자</label> &nbsp;&nbsp;
							</div>
					</div>
					
					<div class="text-center">
						<button type="button" class="btn btn-primary" onclick="infoUpdate();">정보수정</button>
		                 		<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						  회원 탈퇴
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body" style= "text-align: left; margin-left: auto; margin-right: auto;">
						      <div>
							      정말 탈퇴하시겠습니까? <br>탈퇴하시려면 비밀번호를 입력해주세요. 
						      </div>
								<div class="col-lg-3" style="margin-top: 15px;">
									<input placeholder="비밀번호 입력" style="" type="password" class="form-control" id="password" name="password" required> 
								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="button" class="btn btn-primary" onclick="checkPassword();">탈퇴하기</button>
						      </div>
						    </div>
						  </div>
						</div>
		                 		<button type="button" class="btn btn-primary" onclick="changePwd();">비밀번호 수정</button>
					</div>
				</div>
				</div>
		    </form>
		</div>
    </div>
    
    <!-- 내 게시글 -->
    <div id="boardAdmin" style="display: none;" class="management-panel">
        <div class="col-lg-10" >
			<div class="bg-white border border-top-0 p-4 mb-3" style="width : 940px;">
				<div id="board">
					<table id="boardList" class="table table-hover" align="center">
		                <thead>
		                    <tr>
		                        <th>글번호</th>
		                        <th>제목</th>
		                        <th>작성자</th>
		                        <th>조회수</th>
		                        <th>작성일</th>
		                    </tr>
		                </thead>
		                <tbody>
		                
		                </tbody>
	           	 </table>
	           	 
	           	 <br>
	           	 
				<div id="pagingArea" align="center">
<!-- 	                <ul class="pagination"> -->
<%-- 	           			<c:if test="${result.pi.currentPage ne 1 }"> --%>
<%-- 	                    	<li class="page-item"><a class="page-link" href="myList.bo?currentPage=${result.pi.currentPage-1}">Previous</a></li> --%>
<%-- 		 				</c:if> --%>
<%-- 		 				<c:forEach begin="${result.pi.startPage }" end="${result.pi.endPage }" var="p" > --%>
<%-- 		                    <li class="page-item"><a class="page-link" href="myList.bo?currentPage=${p}">${p }</a></li> --%>
<%-- 		 				</c:forEach> --%>
			
<%-- 	                   <c:if test="${result.pi.currentPage ne result.pi.maxPage }"> --%>
<%-- 		                    <li class="page-item"><a class="page-link" href="myList.bo?currentPage=${result.pi.currentPage+1}">Next</a></li> --%>
<%-- 	                   </c:if> --%>
<!-- 	                </ul> -->
				</div>
				</div>
			</div>
		</div>
    </div>
    
    
    
    
    
    
    <!-- 내 매칭 -->
    <div id="replyAdmin" style="display: none;" class="management-panel">
         <div class="col-lg-10" >
			<div class="bg-white border border-top-0 p-4 mb-3" style="width : 940px;">
				
				
				
			</div>
		</div>
    </div>
   
    </div>
    
    <script>
    //내 게시글
    	var list;
			

		$(function() {
			selectList();

			$(document).on("click", "#boardList tbody tr",
					function() {
						var bno = $(this).children().eq(0).text();

						location.href = "detail.bo?bno=" + bno;

					});

		});

		function selectList(currentPage) {
		    var userNo = "${loginUser.userNo}";
		    $.ajax({
		        url: "myList.bo",
		        data: { userNo: userNo, currentPage: currentPage },
		        success: function (result) {
		            var str = "";
		            console.log(result.pi.startPage);
		            for (var i in result.list) {
		                str += "<tr>" +
		                    "<td>" + result.list[i].boardNo + "</td>" +
		                    "<td>" + result.list[i].boardTitle + "</td>" +
		                    "<td>" + result.list[i].boardWriter + "</td>" +
		                    "<td>" + result.list[i].count + "</td>" +
		                    "<td>" + result.list[i].createDate + "</td>" +
		                    "<td></td></tr>";
		            }
		            

		            $("#boardList tbody").html(str);
		            
		            // 페이징 처리
		            var pagination = "<ul class='pagination'>";
		            for (var i = 1; i <= result.pi.maxPage; i++) {
		                pagination += "<li class='page-item " + (i === result.pi.currentPage ? "active" : "") + "'>" +
		                    "<a class='page-link' href='javascript:void(0);' onclick='selectList(" + i + ")'>" + i + "</a>" +
		                    "</li>";
		            }
		            pagination += "</ul>";

		            $("#pagingArea").html(pagination);
		        },
		        error: function () {
		            console.log("통신 오류");
		        }
		    });
		}

		
		
		//비번 탈퇴
		function checkPassword() {
			var userPassword = "${loginUser.userPassword}";
			var inputPassword = $("#password").val();

			$.ajax({
				url : "checkPassword.me",
				data : {
					userPassword : userPassword,
					inputPassword : inputPassword
				},
				success : function(result) {
					if (result === "y") {

						window.location.href = "delete.me";
					} else {
						alert("비밀번호가 일치 하지 않습니다.");
					}
				},
				error : function() {
					console.log("통신 오류");
				}
			});

		}

		$(function() {

			var gender = "${loginUser.gender}"; //로그인유저 정보중 성별정보 (필수입력사항은 아님 값이 없을수 있다.)

			if (gender != "") { //값이 없을땐 ""와같이 빈문자열일테니 해당 조건부여
				//input요소중 value값이 로그인유저의 gender값과 일치하는 요소를 선택 후 checked속성을 true로 변경해주기(체크시켜놓기)
				$("input[value=${loginUser.gender}]").attr(
						"checked", true);
			}

		});

		$(document).ready(
				function() {
					// 초기에는 첫 번째 패널을 보이게 설정
					$(".management-panel:first").show();
					// 네비게이션 바의 링크 클릭 이벤트 처리
					$(".navbar-nav a").click(
							function(e) {
								e.preventDefault();
								$(".navbar-nav a").removeClass(
										"active");
								// 클릭한 a 태그에 'active' 클래스 추가
								$(this).addClass("active");
								// 선택된 링크의 href 값을 가져와 해당하는 패널을 보이게 하고 나머지는 숨김
								var targetPanel = '#'
										+ $(this).attr("id")
										+ 'Admin';
								$(".management-panel").hide();
								$(targetPanel).show();
							});
				});

		function changePwd() {
			var userEmail = "${loginUser.email}"; // JavaScript 변수로 할당
			window.location.href = "newPwd.me?email=" + userEmail;
		}

		function infoUpdate() {
			console.log("여기옴?" + inputNickName);
			console.log("성별" + gender);
			console.log("별명" + userNickName);

			var inputNickName = $("#userNickName").val();
			var gender = $("input[name='gender']:checked").val();
			var userNickName = "${loginUser.userNickName}";

			if (inputNickName.trim().length >= 1) {
				$.ajax({
					url : "checkNickname.do",
					data : {
						nickname : inputNickName
					},
					success : function(result) {
						if (result === "NNNNN"
								&& userNickName !== inputNickName) {
							alert("사용 불가능한 별명입니다. 다시 입력해주세요.");
							return false;
						} else { // 사용가능
							document.getElementById("myForm")
									.submit();
						}
					},
					error : function() {
						console.log("통신 오류");
					}
				});
			}
		}
	</script>
    
    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>
