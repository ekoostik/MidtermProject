<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Add Pet</title>
<link rel="stylesheet" href="../../../../registrationStylesheet.css">
</head>
<body>
<div class="container">
<div class="title">Add A New Pet</div>
<form action="petAdded.do" method="POST">
<div class ="user-details">
<div class ="input-box">
  <span class="details">Name</span>
  <input type="text" name="name" required/><br>
 </div>
<div class ="input-box">
  <span class="details">Species</span>
  <input type="text" name="species" required/><br>
 </div>
<div class ="input-box">
  <span class="details">Breed</span>
  <input type="text" name="breed" /><br>
 </div>
<div class ="input-box">
  <span class="details">Color</span>
  <input type="text" name="color" /><br>
 </div>
 <div class ="tagged-details">
   <span class="details">Tagged?</span>
<select name="tagged">
	<option value="1">Yes</option>
	<option value="0">No</option>
	<option value="0">Unknown</option>
</select>
</div>
 <div class="button">
 <input type="submit" value="Add Pet">
  </div>
  </div>
</form> 
<div class="cancel">
 <a href="cancelUpdate.do" class="btn btn-danger" role="button">Cancel</a>
  </div>
</div>

  <!-- ADD LOGiC FOR DROP DOWN ONCE ALL FIELDS ARE FILLED TO PRESENT ANOTHER 
  SECTION FOR SELECTING A NEIGHBORHOOD-->
  
  <!--MAYBE ADD LOGIC FOR USER TO COMPARE EXISTING NEIGHBORHOODS (STRETCH)  -->
  
<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>