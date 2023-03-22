<!-- AUTHOR ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
			<h2>Looks like there are a few neighborhoods around you. Are you
				a member of any of the following</h2>
			<form action="assignUserToNeighborhood.do" method="POST">
				<select name="neighborhoodId">
					<c:forEach var="n" items="${existingNeighborhoods}">
						<option value="${n.id}">${n.name}</option>
					</c:forEach>
				</select>
				<button name="submit" type="submit" class="btn btn-primary">Select</button>
			</form>
			
			<h2>If not click the following to enter your neighborhood.</h2>
			<a href="newneighborhood.do" class="btn btn-secondary" role="button">New Neighborhood</a>
<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
</body>
</html>