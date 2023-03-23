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
			
			<th>Report</th>
			<th>Date Reported</th>
			<!-- header -->
			<!--header  -->
		</thead>
		<tbody>
			<c:forEach var="report" items="${report}">
				<tr>
					<c:if test="${not empty report.description}">
						
						<td>
						<a href="getReportById.do?id=${report.id}">${report.subject}</a>
						</td>
						<td>${report.reportDate}</td>
						<td></td>
					</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
<button onclick="window.location.href='addReport.do';">Make A Report</button>

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>