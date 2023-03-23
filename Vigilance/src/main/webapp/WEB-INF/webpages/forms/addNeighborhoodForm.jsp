 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Neighborhood Event</title>
<link rel="stylesheet" href="../../../../registrationStylesheet.css">
</head>
<style>
</style>
<body>
<div class="container">
<div class="title">Enter New Neighborhood</div>
<form action="addHood.do" method="POST">
<div class ="user-details">
<div class ="input-box">
  <span class="details">Neighborhood Name</span>
  <input type="text" name="name" required/><br>
 </div>
<div class ="input-box">
  <span class="details">Image(Optional)</span>
  <input type="text" name="imageUrl" /><br>
 </div>
<div class ="input-box">
  <span class="details">Description (Optional)</span>
  <input type="text" name="description" /><br>
 </div>
 <div class="button">
 <input type="submit" value="Submit">
  </div>
 </div>
</form> 
<div class="cancel">
 <a href="cancelRegistration.do" class="btn btn-danger" role="button">Cancel</a>
  </div>
</div>

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>