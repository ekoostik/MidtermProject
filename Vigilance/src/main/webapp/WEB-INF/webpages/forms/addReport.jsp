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

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>

<h3>Report Information</h3>
 <p>Thanks ${user.firstName}, Enter the following information to make your report</p>
<form action="newaddr.do" method="POST">

  <input type="hidden" name="householdId" value="${user.household.id }" /><br>
  Description<input type="text" name="address1" /><br>
  Date of Incident:<input type="date" name="address2" /><br>
  Were the police contacted?<input type="text" name="city" /><br>
  <!-- Add the rest of address -->
 <button type="submit" class="btn btn-primary">Submit</button>
</form>



<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>