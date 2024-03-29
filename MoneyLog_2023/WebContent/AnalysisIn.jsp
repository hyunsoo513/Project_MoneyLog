<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">

	var year = ${year}
	var month = ${month}

	function moveCalendar()
	{
	  window.location.href = "./calendar.action?year="+year+"&month="+month;
	}
	function moveAnalysis()
	{
	  window.location.href = "./analysis.action?year="+year+"&month="+month;
	}
	function moveAnalysisIn()
	{
	  window.location.href = "./analysisIn.action?year="+year+"&month="+month;
	}
	function moveAnalysisOut()
	{
	  window.location.href = "./analysisOut.action?year="+year+"&month="+month;
	}
	
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMoney.jsp"></jsp:include>
	
	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
	    <div class="row">
		    <div class="col">
			
				<!-- 안내 ===================================================== -->
				<div class="container">
					<div class="row">
			    		<div class="col">
							<ol class="breadcrumb">
								<li class="active"> ${year}년 ${month}월 보고서 </li>
							</ol>
						</div>
					</div>
				</div>
				<!-- 안내 ===================================================== -->
				
				<!-- 헤더 ===================================================== -->
				<header id="header">
					<div class="container p-3 bg-dark text-white">
						<div class="row">
							<div class="col-sm-12">
								<div class="btn-group float-left">
									<button type="button" class="btn btn-dark" onclick="moveAnalysis()"> 전체 </button>
									<button type="button" class="btn btn-success" onclick="moveAnalysisIn()"> 수입 </button>
									<button type="button" class="btn btn-dark" onclick="moveAnalysisOut()"> 지출 </button>
								</div>
								
								<div class="btn-group float-right">
									<button type="button" class="btn btn-dark" onclick="moveCalendar()"> 돌아가기 </button>
								</div>
								
							</div>
						</div>
					</div>
				</header>
				<!-- 헤더 ===================================================== -->
				
						
				<div class="container">
					<div class="row">
					
						<!-- 내 수입 분석 -->
						<div class="col-md-12">
							<div class="list-group">
								<br><br>
								<h4> 수입 <small> ${user_name} 님의 ${month }월 수입 보고서 </small> </h4>
								
								
								<c:forEach var="data" items="${inOutData }">
									<!-- 수입이 0원인지 -->
									<c:if test="${(data.cate_fst_1+data.cate_fst_2+data.cate_fst_3)==0}">
										<div class="col-md-12">
											<div class="list-group">
												<br><br><br><br>
												<h4 style="text-align: center;"><img src="./img/noData.png"><br><small> 수입 내역이 없습니다! </small> </h4>
											</div>
										</div>
										<c:set var="writer_flag" value="true" />
									</c:if>
								</c:forEach>
								
								
								<c:if test="${not writer_flag }">
									<!-- 그래프가 들어가는 곳 -->
									<div class="list-group mt-3">
										<div class="list-group-item" >
											<canvas id="myChart2" style="height: 400px;"></canvas>
										</div>
									</div>
								</c:if>
				
							</div>
						</div>
						
						
						
						<!-- 내 수입 내역들 -->
						<div class="col-md-12">
		
							<div class="list-group">
								<br><br>
								<h4> 수입 <small> ${user_name} 님의 ${month }월 수입 리스트 </small> </h4>
								
								
								<div class="list-group-item">
									<div class="list-group">
										<table class="table" style="max-width: 1080px;">
								            <thead>
								              <tr>
								                <th style="text-align:center;">날짜</th>
								                <th style="text-align:center;">1차 카테고리</th>
								                <th style="text-align:center;">2차 카테고리</th>
								                <th style="text-align:center;">상세내용</th>
								                <th style="text-align:center;">금액</th>
								              </tr>
								            </thead>
								            
								            <tbody>
								              <c:if test="${empty monthInList}">
											  <tr>
											   	<td>수입 내역이 없습니다.</td>
											  </tr>
											  </c:if>
											   
											  <c:if test="${not empty monthInList}">
											  <c:forEach var="monInList" items="${monthInList }">
										 	  <tr>
											   	<td style="text-align: center;">
											   		<fmt:parseDate value="${monInList.acnt_date}" var="acntDate" pattern="yyyy-MM-dd" />
											   		<fmt:formatDate value="${acntDate}" pattern="MM-dd" />
											   	</td>
										   	    <td style="text-align: center;">${monInList.cate_fst_name }</td>
							                    <td style="text-align: center;">${monInList.cate_sec_name }</td>
							                    <td style="text-align: center;">${monInList.acnt_dtl_cont }</td>
							                    <td class="mobile" style="text-align:center;">
					     					         <fmt:formatNumber value="${monInList.amnt }" groupingUsed="true"></fmt:formatNumber>
							                   	</td>
											   </tr>
										 	   </c:forEach>	
										 	   </c:if>
								            </tbody>
								          </table>
									</div>
								</div>
								
								
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		MoneyLog. </footer>

	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.2.1.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- MDB 라이브러리 추가하기 <== chart!!!! **** -->
	<script src="./js/mdb.min.js"></script>
	
	<script>
    
	
	<!-- 모든 카테고리별 총합 데이터 수신 -->
	<c:forEach var="data" items="${inOutData }">
		var idata1 = ${data.cate_fst_1};
		var idata2 =${data.cate_fst_2};
		var idata3 =${data.cate_fst_3};
	</c:forEach>
	
	// 수입합
	var hap2 = idata1+idata2+idata3;
	
	// 수입 그래프
	var ctxP = document.getElementById('myChart2').getContext('2d');
	var myChart2 = new Chart(ctxP, {
		type : 'doughnut',
		data : {
			labels : [ "주수입" + " : "+idata1.toLocaleString('ko-KR')+" [ "+ (idata1/hap2*100).toFixed(1) + " %" +" ]"
				, "부수입" + " : "+idata2.toLocaleString('ko-KR')+" [ "+ (idata2/hap2*100).toFixed(1) + " %" +" ]"
				, "저축" + " : "+idata3.toLocaleString('ko-KR')+" [ "+ (idata3/hap2*100).toFixed(1) + " %" +" ]"
				],
			datasets : [
				{
					data : [ idata1, idata2, idata3],
					backgroundColor : [ "#FFDF00", "#FF88B9", "#00D3C5"],
					hoverBackgroundColor : []
				} 
			]
		},
		options : {
			responsive: true,
			legend : {
				display : true,
				position: "right",
				labels:{
					fontSize: 18,
					boxWidth: 40,
					padding: 30,
					usePointStyle: true,
					PointStyle: "circle"
				}
			}}
	});
	
    </script>

</body>
</html>