<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../..//stylesheet.css">
</head>
<body>
	<h3>Address Information</h3>
	<p>Thanks ${user.firstName} Please enter your address to locate any
		existing neighborhoods</p>
	<form action="newaddr.do" method="POST">

		<input type="hidden" name="householdId" value="${user.household.id }" /><br>
		Street<input type="text" name="address1" /><br> Street(Optional)
		<input type="text" name="address2" /><br> City <input
			type="text" name="city" /><br> State <input type="text"
			name="state" /><br> ZipCode <input type="number" name="zipCode" /><br>
		<!-- Add the rest of address -->
		<button type="submit" class="btn btn-primary" value="${user}">Submit</button>
	</form>

	<c:choose>
		<c:when test="${ empty existingNeighborhoods}">
			<jsp:include page="neighborhoodForm.jsp" />
		</c:when>
		<c:otherwise>
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
		</c:otherwise>
	</c:choose>
	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>