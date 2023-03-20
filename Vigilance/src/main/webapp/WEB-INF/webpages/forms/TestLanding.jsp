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






<c:forEach var="post" items="${post}">
<ul>
<li> <strong>${post.description}</strong></a></li>



</ul>
</c:forEach>





<c:forEach var="address" items="${address}">
<ul>
<li> <strong>${address.address1}</strong></a></li>



</ul>
</c:forEach>


















<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>