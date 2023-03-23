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



<p><a href="getPostById.do?id=${post.id}">${post.description}</a></p>


	<form action="submitPostUpdate.do" method="POST">
	

	

	</form>









<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>