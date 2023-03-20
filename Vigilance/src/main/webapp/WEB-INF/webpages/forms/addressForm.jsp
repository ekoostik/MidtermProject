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
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
  <h3>Address Information</h3>
 <p>Thanks ${user.firstName}  Please enter your address to locate any existing neighborhoods</p>
<form action="newaddr.do" method="POST">

  <input type="hidden" name="householdId" value="${user.household.id }" /><br>
  Street<input type="text" name="address1" /><br>
  Street(Optional) <input type="text" name="address2" /><br>
  City <input type="text" name="city" /><br>
  State <input type="text" name="state" /><br>
  ZipCode <input type="number" name="zipCode" /><br>
  <!-- Add the rest of address -->
 <button type="submit" class="btn btn-primary">Submit</button>
</form> 


<h2>${existingNeighborhoods}</h2>
<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>