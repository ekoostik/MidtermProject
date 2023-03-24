<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href="./registrationStylesheet.css">
</head>
<body>
<div class="container">
<div class="title">Address Information</div>
	<p>Thanks ${loggedinuser.firstName} Please enter your address to locate any
		existing neighborhoods</p>
<form action="newaddr.do" method="POST">
<div class ="user-details">
<div class ="input-box">
  <span class="details">Street</span>
  <input type="text" name="address1" required/><br>
 </div>
<div class ="input-box">
  <span class="details">Street(Optional)</span>
  <input type="text" name="address2" /><br>
 </div>
<div class ="input-box">
  <span class="details">City</span>
  <input type="text" name="city" required /><br>
 </div>
<div class ="input-box">
  <span class="details">State</span>
  <input type="text" name="state" required/><br>
 </div>
<div class ="input-box">
  <span class="details">ZipCode</span>
  <input type="text" name="zipCode" required/><br>
 </div>
 <div class="button">
 <input type="submit" value="Register">
  </div>
 </div>
</form> 
<div class="cancel">
 <a href="cancelRegistration.do" class="btn btn-danger" role="button">Cancel</a>
  </div>
</div>
	<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>