<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Object fstCate = request.getAttribute("fstCateList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부 당일 내역</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#next-btn").click(function()
		{
			if ($("#inout_cd").val()=="")
			{
				$("#inout_cd").focus();
				return;
			}
			if ($("#cate_fst_cd").val()=="")
			{
				$("#cate_fst_cd").focus();
				return;
			}
			if ($("#cate_sec_cd").val()=="")
			{
				$("#cate_sec_cd").focus();
				return;
			}
			if ($("#acnt_dtl_cont").val()=="")
			{
				// $("#acnt_dtl_cont").val("상세내역을 입력하세요~!!!");
				$("#acnt_dtl_cont").focus();
				return;
			}
			if ($("#amnt").val()=="")
			{
				// $("#amnt").val("상세내역을 입력하세요~!!!");
				$("#amnt").focus();
				return;
			}
			$("#enterAcnt").submit();
			
		});
	});
	
	
	/* 
	function changeCate()
	{
		// 테스트
		alert("확인");
		var select = $("#inout_cd").val();
		alert(select);

		$("#1").css("visibility","hidden");
	}
		
		if (select == 1)
		{
			$("#2").css("visibility","hidden");
		}
		
		else if (select == 2)
		{
			$("#1").hide();
		}
		else
		{
			$("option[#1]").hide();
			$("option[#2]").hide();
		}
		*/

/* 
	$(document).ready(function()
	{
		// 테스트
		alert("확인");

		$("#inout_cd").change(function()
		{
			// 테스트
			alert("변경~!!!");
			
			// Ajax 요청 및 응답 처리
			ajaxRequest();
		});
		ajaxRequest();
	});
	
	
	function ajaxRequest()
	{
		var param = "inout_cd=" + $("#inout_cd").val();
		
		alert(param);
		
		$.ajax(
		{
			type:"GET"
			, url:"ajax.action"
			, data:param
			, dataType:"Json"
			, success:function(jsonObj)
			{
				var result = "";
				
				for (var idx=0; idx<jsonObj.length; idx++)
				{
					var cate_fst_cd = jsonObj[idx].fst_cd;
					var cate_fst_name = jsonObj[idx].fst_name;
					
					result += "<option value='" + cate_fst_cd + "'>" + cate_fst_name + "</option>";
				}
				
				$("#fstCate").append(result);

			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
	}
*/
</script>
</head>
<body>
	<!-- 상단 네비게이션바 -->
	<jsp:include page="./UserNav.jsp"></jsp:include>
	    

     <div class="container mt-3">
      	<div class="row">
      		<div class="col-12" style="text-align: center;">
    			<h2>${sessionScope.month}월 ${sessionScope.day}일 가계부</h2>
    		</div>
	    </div>
		<form class="row mt-3" action="acntreg.action" method="post" id="enterAcnt">
				<table class="col-12">
					<tbody>
						<tr>
							<td>
								<select name="inout_cd" id ="inout_cd" style="width: 100%;">
									<option value="" selected>구분</option>
									<c:if test="${not empty inoutCateList}">
									<c:forEach var="inoutCate" items="${inoutCateList }" varStatus="status">
									<option value="${inoutCate.inout_cd }">${inoutCate.inout_cont }</option>
									</c:forEach>
									</c:if>
								</select>
							</td>
							<td>
								<select name="cate_fst_cd" id="cate_fst_cd" style="width: 100%;">
									<option value="" selected>1차카테고리</option>
									<c:if test="${not empty fstCateList}">
									<c:forEach var="fstCate" items="${fstCateList }" varStatus="status">
										<option value="${fstCate.cate_fst_cd}" id="${fstCate.inout_cd}" >${fstCate.cate_fst_name }</option>
									</c:forEach>
									</c:if>
								</select>
								<%-- 
								<select name="fstCate" id="fstCate" style="width: 100%;">
									<option value="" selected>1차카테고리</option>
								</select>
								<select name="fstCate_1" id="fstCate_1" style="width: 100%; display: none">
									<option value="" selected>1차카테고리</option>
									<c:if test="${not empty fstCateList}">
									<c:forEach var="fstCate" items="${fstCateListOne }" varStatus="status">
										<option value="${fstCate.cate_fst_cd }">${fstCate.cate_fst_name }</option>
									</c:forEach>
									</c:if>
								</select>
								<select name="fstCate_2" id="fstCate_2" style="width: 100%; display: none">
									<option value="" selected>1차카테고리</option>
									<c:if test="${not empty fstCateList}">
									<c:forEach var="fstCate" items="${fstCateListTwo }" varStatus="status">
										<option value="${fstCate.cate_fst_cd }">${fstCate.cate_fst_name }</option>
									</c:forEach>
									</c:if>
								</select> 
								--%>
							</td>
							<td>
								<select name="cate_sec_cd" id="cate_sec_cd" style="width: 100%;">
									<option value="" selected>2차카테고리</option>
									<c:if test="${not empty secCateList}">
									<c:forEach var="secCate" items="${secCateList }" varStatus="status">
										<option value="${secCate.cate_sec_cd}" id="${secCate.cate_fst_cd}" >${secCate.cate_sec_name }</option>
									</c:forEach>
									</c:if>
								</select>
							</td>
							<td>
								<input type="text" style="width: 100%;" id="acnt_dtl_cont" name="acnt_dtl_cont" placeholder="상세내역 입력">
							</td>
							<td>
								<input type="text"style="width: 100%;" id="amnt" name="amnt" placeholder="금액 입력">
							</td>
							<td>
								<button id="next-btn" type="button" class="btn btn-primary" style="background-color: #1fa766; width: 100%;">등록</button>
							</td>
							<td>
								<img src="img2/icon.png" alt="아이콘" style="width: 35px;">
							</td>
						</tr>
					</tbody>
				</table>
		</form>
	    <div class="row mt-3">
	    	<div class="col-12">
	    		<table class="table table-striped" >
			        <thead>
			            <tr>
			                <th class="mobile" style="width: 120px; text-align: center;">분류</th>
			                <th class="mobile" style="width: 120px; text-align: center;">1차 분류</th>
			                <th style="width: 120px; text-align: center;">2차 분류</th>
			                <th class="mobile" style="text-align: center;">상세내역</th>
			                <th style="width: 200px; text-align: center;">금액</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:if test="${empty dayInoutList}">
						<tr>
							<td colspan="5" style="text-align: center;">등록 내역이 없습니다.</td>
						</tr>
						</c:if>
						
						<c:if test="${not empty dayInoutList}">
						<c:forEach var="dayList" items="${dayInoutList }">
					 	<tr>
							<td class="mobile" style="text-align: center;">${dayList.inout_cont}</td>
							<td class="mobile" style="text-align: center;">${dayList.cate_fst_name}</td>
			                <td style="text-align: center;">${dayList.cate_sec_name}</td>
			                <td style="text-align: center;">${dayList.acnt_dtl_cont}</td>
			                <td class="mobile" style="text-align: center;">
				                <fmt:formatNumber value="${dayList.amnt}" groupingUsed="true"></fmt:formatNumber>
		                	</td>
						</tr>
					 	</c:forEach>	
					 	</c:if>
			        </tbody>
			    </table>	
	    	</div>
	    </div>
		<div class="row">
			<div class="col-12">
				<div class="text-center" style="margin-right: auto; margin-left: auto;">
					<a href="calendar.action" class="btn btn-primary"
	         		style="background-color: #1fa766;">내 가계부로 돌아가기</a>
				</div>
			</div>
		</div>
    </div>	

	    
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>