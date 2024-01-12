<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-size: 16px;
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        color: #495057;
    }

    .col-lg-10 {
        padding-top: 30px;
    }

    .section-title {
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #8E8FFA; 
    }

    .bg-white {
        background-color: #BDBEFF; 
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th, td {
        border: 1px solid #A29FFF; 
    }

    th, td {
        padding: 15px;
        text-align: center;
    }

    th {
        background-color: #8E8FFA; 
        color: #ffffff;
    }

    tr.active-row {
        background-color: #BDBEFF; 
    }

    tfoot tr {
        background-color: #8E8FFA; 
        color: #ffffff;
        font-weight: bold;
    }

    .btn-primary, .btn-delete {
        background-color: #8E8FFA; 
        color: #ffffff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
        margin-right: 10px;
    }

    /* 추가된 스타일 */
    .font-increase {
        font-size: 18px; /* 원하는 폰트 크기로 조정 */
    }

    .total-points {
        color: #ffffff; /* 흰색으로 변경 */
        font-weight: bold;
    }

    /* 회원 등급 스타일 */
    .membership-grade {
        color: #8E8FFA; /* 등급 색상 */
        font-size: 30px;
        font-weight: bold;
    }
</style>
</head>
<body>

<div class="col-lg-10">
					<div class="section-title mb-0">
						<h4 class="m-0 text-uppercase font-weight-bold">구매내역</h4>
					</div>
					<!-- <form role="form" method="post" autocomplete="off"> -->
						<div class="bg-white border border-top-0 p-4 mb-3">
							<div class="mb-4">
								<!-- <div class="mb-3">
									<div class="d-flex align-items-center mb-2">
										<i class="fa fa-id-card-alt text-primary mr-2"></i>
										<h6 class="font-weight-bold mb-0">구매날짜조회</h6>
									</div>
								</div>
									<form method="get" autocomplete="off">
										<p>
											구매날짜조회: <input type="date" id="search_start" name="search_start"> ~ <input type="date" id="currentDate" name="currentDate">
											<input type="button" class="div.input-daterange" value="검색" onclick="searchDate()">
										</p>
									</form>	 -->
									<div class="d-flex align-items-center mb-2">
										<i class="fa fa-id-card-alt text-primary mr-2"></i>
										<h3 class="font-weight-bold mb-0">주문목록</h3>
									</div>
									
									<table class="styled-table">
										<thead>
											<tr>
												<th>상품번호</th>
												<th>패키지명</th>
												<th>구매일자</th>
												<th>인원수</th>
												<th>가격</th>
											</tr>
										</thead>
										<tbody>
											<!-- sum 기본값 0으로 생성 -->
											<c:set var="sum" value="0" />
											<c:set var="peopleSum" value="0" />
											<c:forEach items="${list}" var="list">
												<tr class="active-row">
													<td>${list.order_bno}</td>
													<td><a href="/sell_board/sell_view?sell_bno=${list.sell_bno}">${list.order_title}</a></td>
													<td><fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd"/></td>
													<td>${list.order_people} 명</td>
													<td style="color: gray;"><fmt:formatNumber pattern="###,###,###" value="${list.order_price}"/> 원</td>
												</tr>
												
												<!-- sum에 order_price 삽입 -->
												<c:set var="sum" value="${sum + (list.order_price)}" />
												<c:set var="peopleSum" value="${peopleSum + list.order_people}" />
											</c:forEach>
										</tbody>
										<tfoot>
											<tr style="font-weight: bold; color: white;">
												<td colspan="3">총 합계</td>
												<td>${peopleSum} 명</td>
												<td><fmt:formatNumber pattern="###,###,###" value="${sum}" /> 원</td>
											</tr>
										</tfoot>
										
										<!-- 회원 등급 표시 -->
										<div style="color: black;">회원님의 등급은 
										<c:choose>
											<c:when test="${sum < 5000000}">
												<strong style="font-size: 30px;">Family</strong>
											</c:when>
											<c:when test="${5000000 <= sum && sum < 10000000}">
												<strong style="font-size: 30px;">Silver</strong>
											</c:when>
											<c:when test="${10000000 <= sum && sum < 30000000}">
												<strong style="font-size: 30px;">Gold</strong>
											</c:when>
											<c:when test="${30000000 <= sum && sum < 60000000}">
												<strong style="font-size: 30px;">VIP</strong>
											</c:when>
											<c:when test="${60000000 <= sum}">
												<strong style="font-size: 30px;">VVIP</strong>
											</c:when>
										</c:choose>
										입니다</div>
									</table>
								</div>
							</div>
						<!-- </form> -->
					</div>
				</div>
			</div>
		</div>

</body>
</html>