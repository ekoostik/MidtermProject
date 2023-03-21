<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>update </title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>




	<form action="submitPostUpdate.do" method="POST">
	

	
	<input name="description" type="text" value=""></input>
	<input name="postId" type="hidden" value="${post.id}"></input>
	<input name="userId" type="hidden" value="${post.user.id}"></input>



<input class="btn btn-warning" type="submit" value="Update post">
		
	</form>









<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>