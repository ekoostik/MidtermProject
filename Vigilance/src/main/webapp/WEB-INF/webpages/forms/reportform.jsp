<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>View Reports</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>
	
	<table class="table table-striped table-hover">
			<c:forEach var="report" items="${report}">
		<thead>
			<th>${report.description}</th>
			<!-- header -->
			
			<!--header  -->
		</thead>
		<tbody>
				<c:if test="${not empty report.animals}">
				<tr>
					<td>${report.animals.description}</td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>