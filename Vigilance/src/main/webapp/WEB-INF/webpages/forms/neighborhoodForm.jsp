<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Neighborhood Event</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>






<c:forEach var="hood" items="${hood}">
<ul>

<li> <strong>${hood.id}</strong></li>
<li> <strong>${hood.description}</strong></li>
<li> <strong>${hood.name}</strong></li>
<a href="viewAllAddress.do?id=${hood.id}"> View all address</a>
<a href="viewAllPost.do?id=${hood.id}"> View all post</a>




</ul>
</c:forEach>





















<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>