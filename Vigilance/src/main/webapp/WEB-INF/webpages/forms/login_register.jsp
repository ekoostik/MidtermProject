<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Vigilance Login</title>
<link rel="stylesheet" href="../../../css/stylesheet.css">
</head>
<div class="container">
  <div class="row">
    <div class="col-6">
      Place Logo and Welcome statement
    </div>
    <div class="col-6">
      	<form action="userlogin.do" method="POST">
		Username <input type="text" name="username"  />
		Password <input type="password" name="password" />
		<button type="submit" class="btn btn-primary">Login</button>
		</form>
    </div>
  </div>
  <div class="row">
     <div class="col-6">
    </div>
    <div class="col-6">
    No Account? Register Here!
	<form action="registration.do" method="GET">
	<button name="register" type="submit" 
	class="btn btn-success">Register</button> 
	</form> 
    </div>
  </div>
</div>
<body>
	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>