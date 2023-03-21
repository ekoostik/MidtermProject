<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>User Update</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
<h1> Update User Information</h1>
<form action="updateUserForm.do" method="POST">
  First Name <input type="text" name="firstName" value="${loggedinuser.firstName}" readonly /><br>
  LastName Name <input type="text" name="lastName" value="${loggedinuser.lastName}" readonly/><br>
  Username <input type="text" name="username" value="${loggedinuser.username}"/><br>
  Profile Picture<input type="text" name="profilePic" value="${loggedinuser.profilePic}"/><br>
  Email <input type="text" name="email" value="${loggedinuser.email}"/><br>
  Date of birth <input type="date" name="dob" value="${loggedinuser.dateOfBirth}"/><br>

	<label for="aboutMe">About Me</label><br>
	<textarea id="aboutMe" name="aboutme" rows="4" cols="50">${loggedinuser.aboutme} </textarea>
  <br>
 <button type="submit" class="btn btn-primary">Update</button>
</form> 

<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>