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
</style>

</head>
<body>

<div class="col-lg-10">
					<div class="section-title mb-0">
						<h4 class="m-0 text-uppercase font-weight-bold">포인트내역</h4>
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
										<h3 class="font-weight-bold mb-0">포인트 적립 내역</h3>
									</div>
									<table class="styled-table">
										<thead>
											<tr>
												<th style="font-size: 16px;">적립 패키지</th>
												<th style="font-size: 16px;">적립포인트</th>
												<th style="font-size: 16px;">적립일자</th>
												<th style="font-size: 16px;">사용 패키지</th>
												<th style="font-size: 16px;">사용포인트</th>
												<th style="font-size: 16px;">사용일자</th>
											</tr>
										</thead>
										<tbody>
											<!-- sum 기본값 0으로 생성 -->
											<c:set var="sum" value="0" />
											<c:forEach items="${list}" var="list">
												<tr class="active-row">
													<td><a  style="font-size: 14px;" href="/sell_board/sell_view?sell_bno=${list.sell_bno}">${list.order_title}</a></td>
													<td><fmt:formatNumber pattern="###,###,###" value="${list.point}"/></td>
													<td><fmt:formatDate value="${list.point_regDate}" pattern="yyyy-MM-dd"/></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												
												<!-- sum에 order_price 삽입 -->
												<c:set var="sum" value="${sum + (list.point)}" />
											</c:forEach>
										</tbody>
										<tbody>
											<c:forEach items="${useList}" var="useList">
												<tr class="active-row">
												<td></td>
												<td></td>
												<td></td>
												<td><a style="font-size: 14px;" href="/sell_board/sell_view?sell_bno=${useList.sell_bno}">${useList.order_title}</a></td>
												<td><fmt:formatNumber pattern="###,###,###" value="${useList.point}"/></td>
												<td><fmt:formatDate value="${useList.point_regDate}" pattern="yyyy-MM-dd"/></td>
												</tr>
												<c:set var="sum" value="${sum + (useList.point)}" />
											</c:forEach>
										</tbody>
										<tfoot>
											<tr style="font-weight: bold; color: white;">
												<td>총 합계</td>
												<td colspan="5">보유 포인트 : <fmt:formatNumber pattern="###,###,###" value="${sum}" /> 점</td>
											</tr>
										</tfoot>
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