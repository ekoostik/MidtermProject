<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Account Registration</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
<h1> Register A New Account</h1>
<form action="register.do" method="POST">
  First Name <input type="text" name="firstName" /><br>
  LastName Name <input type="text" name="lastName" /><br>
  Email <input type="text" name="email" /><br>
  Date of birth <input type="date" name="dob" /><br>
  Username <input type="text" name="username" /><br>
  Password <input type="password" name="password"/><br>
 <button type="submit" class="btn btn-primary">Submit</button>
</form> 

  <!-- ADD LOGiC FOR DROP DOWN ONCE ALL FIELDS ARE FILLED TO PRESENT ANOTHER 
  SECTION FOR SELECTING A NEIGHBORHOOD-->
  
  <!--MAYBE ADD LOGIC FOR USER TO COMPARE EXISTING NEIGHBORHOODS (STRETCH)  -->
  
<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>