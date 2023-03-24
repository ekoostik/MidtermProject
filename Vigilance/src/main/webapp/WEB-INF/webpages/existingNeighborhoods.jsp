<!-- AUTHOR ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./registrationStylesheet.css">
</head>
<body>
<div class="container">
<div class="title">Existing Neighborhoods</div>
<h3>Looks like there are a few neighborhoods around you. Are you
a member of any of the following</h3>
<form action="assignUserToNeighborhood.do" method="POST">
<div class ="user-details">
<div class ="input-box">
	<select name="neighborhoodId">
		<c:forEach var="n" items="${existingNeighborhoods}">
			<option value="${n.id}">${n.name}</option>
		</c:forEach>
	</select>
</div>
 <div class="button">
 <input type="submit" value="Submit">
  </div>
 </div>
</form> 
			<h3>If not click the following to enter your neighborhood.</h3>
			<a href="enterNewNeighborhood.do" class="btn btn-secondary" role="button">New Neighborhood</a> <div class="cancel">

<div class="cancel">
 <a href="cancelRegistration.do" class="btn btn-danger" role="button">Cancel</a>
  </div>
</div>
</div>

<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>