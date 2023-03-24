<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="background: #08081b">
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Vigilance Login</title>
<link rel="stylesheet" href="./stylesheet.css">
</head>
<body>
<div class="container1" style= "background: #08081b">

	
	<div class="row">
		<div class="col text-center">
			<img src="images/MTLogoMain.png" width="1000"
				height="500" align="middle">
		</div>
	</div>
	
	<div class="row">
		<div class="col text-center" style="color: white">
		<h3>Login Here!</h3>
			<form action="userlogin.do" method="POST">
				Username <input type="text" name="username" /> Password <input
					type="password" name="password" />
				<button type="submit" class="btn btn-primary">Login</button>
		<h3>Or:</h3>		
			</form>
		</div>
	</div>
	
	
	
	<div class="row">
		<div class="col text-center" style="color: white">
			<h3>No Account? Register Here!</h3>
			<form action="registration.do" method="GET">
				<button name="register" type="submit" class="btn btn-success">Register</button>
			</form>
		</div>
	</div>
	
</div>
</body>
</html>