<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Add Vehicle</title>
<link rel="stylesheet" href="./registrationStylesheet.css">
</head>
<body>
<div class="container">
<div class="title">Add A New Vehicle</div>
<form action="vehicleAdded.do" method="POST">
<div class ="user-details">
<div class ="input-box">
  <span class="details">Make</span>
  <input type="text" name="make" required/>
 </div>
<div class ="input-box">
  <span class="details">Model</span>
  <input type="text" name="model" required/>
 </div>
<div class ="input-box">
  <span class="details">Color</span>
  <input type="text" name="color" required />
 </div>
<div class ="input-box">
  <span class="details">Description</span>
  <input type="text" name="description" />
 </div>
 <div class="button">
 <input type="submit" value="Add Vehicle">
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
  
<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>