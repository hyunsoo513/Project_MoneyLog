<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavCs.jsp"></jsp:include>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
		<div class="row d-flex d-md-block flex-nowrap wrapper">
           
            <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
            	<!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./UserMenuCs.jsp"></jsp:include>
            </nav>            
        </div>
    
		<div class="container">
			<div class="row">
				<div class="col-12" style="margin-top: 30px;" >
					<div style="font-size: 20px; font-weight: bold; margin-left: 20px;">공지사항</div>
				</div>
			</div>
		<hr/>
		</div>
		
		<div class="container">
				<div class="row">
				
						<table id="cont" class="table4 col-12" style ="margin-left: 25px; border-collapse: separate; border-spacing: 0 8px;">
						     <tr>
						         <th style="font-weight: bold; width: 120px;">작성일</th>
						      	 <td style="text-align:left;">
									<fmt:parseDate value="${userNotiSelect.noti_date }" var="noti_date" pattern="yyyy-mm-dd" />
									<fmt:formatDate value="${noti_date}" pattern="yyyy-mm-dd" />
								 </td>
						     </tr>
						     <tr>    
						         <th style="font-weight: bold; width: 120px;">조회수</th>
						         <td style="text-align:left;">
							         ${userNotiSelect.noti_view }
						         	<!-- 
						         	<input type="text" id="noti_view" name="noti_view" value="${userNotiSelect.noti_view }">
						         	 -->
						         </td>
						     </tr>  
						     <tr>    
						         <th style="font-weight: bold; width: 120px;">제목</th>
						         <td style="text-align:left;">
							         ${userNotiSelect.noti_title }
						         	<!-- 
						         	<input type="text" id="noti_title" name="noti_title" value="${userNotiSelect.noti_title }">
						         	 -->
						         </td>
						     </tr>  
						     <tr>    
						         <th style="font-weight: bold; width: 120px;">내용</th>
						         <td style="text-align:left;">
							         ${userNotiSelect.noti_cont }
						         	<!-- 
						         	<textarea name="content" rows="10" cols="60" readonly="readonly">${userNotiSelect.noti_cont }</textarea>
						         	 -->
						     	 </td>    
						     </tr>
						</table>
				</div>			
				<hr/>
				<br>
				<br>
				<br>
				<br>
				<br>
		</div>
		<div>
			<div class="row">
				<div class="col-12" style="margin-top: 10px; padding-left: 30px;">				
					<table class="table4">
						<tr>
							<td>이전글 : (${userNotiSelect.noti_cd}) ${userNotiSelect.noti_title }</td>
						</tr>
						<tr>
							<td>다음글 : (${userNotiSelect.noti_cd}) ${userNotiSelect.noti_title }</td>
						</tr>
					</table>
					<!-- 
					<a>이전글 : (${userNotiSelect.noti_cd}) ${userNotiSelect.noti_title }</a>
					<a>다음글 : (${userNotiSelect.noti_cd}) ${userNotiSelect.noti_title }</a>
					 -->
				</div>
			</div>	
				
			<div class="row">
					<div class="col-12" style="margin-top: 20px;">
							<button type="submit" class="btn btn-primary" style="background-color: #1fa766; float: right;"
							onclick="javascript:location.href='<%=cp%>/usernotilist.action'">목록</button>
					</div>
			</div>
		</div>
	</div>				

	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.2.1.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- MDB 라이브러리 추가하기 <== chart!!!! **** -->
	<script src="./js/mdb.min.js"></script>





</body>
</html>