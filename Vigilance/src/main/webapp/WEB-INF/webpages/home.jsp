<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Vigilance Home</title>
<link rel="stylesheet" href="css/stylesheet.css">

</head>
<jsp:include page="../bootstrap/navbar.jsp" />
<body>


<h2> Welcome ${loggedinuser.firstName}!</h2>

<div class="container-fluid">
<div class="row">
  <div class="col-6">
  <br>
  <a href="getPostById.do?id=1" class="btn btn-secondary" role="button">View all Post</a>
  <br>
  <br>
  </div>
  <div class="col-6">
	MAYBE A PICTURE HERE..IDK
	</div>
</div>
<div class="row">
  <div class="col">
  <div class="thumbnails">
  <div class="span4">
    <div class="thumbnail">
      <a href="viewAllEvents.do?id=1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEBzThinEe1VOKm_FxmIdDpkI90YkRxcXakg&usqp=CAU" alt="Neighborhood Event Icons"></a>
      <h3>Neighborhood Events</h3>
      <p>View All.</p>
    </div>
  </div>
</div>
  </div>
  <div class="col">column</div>
  <div class="col">column</div>
</div>
<div class="thumbnails">
  <div class="span4">
    <div class="thumbnail">
      <a href="getPostById.do?id=1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEBzThinEe1VOKm_FxmIdDpkI90YkRxcXakg&usqp=CAU" alt="Neighborhood Event Icons"></a>
      <h3>Neighborhood Events</h3>
      <p>View All.</p>
    </div>
  </div>
</div>
</div>
<a href="viewAllEvents.do" class="btn btn-secondary" role="button">View all Events</a>
<a href="getPostById.do?id=1" class="btn btn-secondary" role="button">View all Post</a>
=======


<a href="viewAllNeighborhoods.do" class="btn btn-secondary" role="button">View all Neighborhoods</a>
<a href="viewAllposts.do" class="btn btn-secondary" role="button">Post</a>



<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
</body>
</html>

