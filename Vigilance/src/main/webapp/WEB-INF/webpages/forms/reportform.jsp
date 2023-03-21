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
		<thead>
			<th>Description</th>
			<th>Report</th>
			<!-- header -->
			<!--header  -->
		</thead>
		<tbody>
			<c:forEach var="report" items="${report}">
				<tr>
					<td>${report.description}</td>

					<c:if test="${not empty report.animals}">
						<td>${report.animals}</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>