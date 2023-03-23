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

<<%-- c:choose>
		<c:when test="${! empty hood}">
<c:forEach var="post" items="${doo}">
<ul>

<li><p><a href="getPostById.do?id=${post.id}">${post.description}</a></p></li>
</ul>
</c:forEach>
</c:when>
<c:otherwise>
<p>There are no post for this neighborhood</p>
</c:otherwise>
</c:choose>

	<form action="submitPostUpdate.do" method="POST">
	

	

	</form>
 --%>


<strong>${hood.name}</strong>
<br>${hood.description}
<c:forEach var="post" items="${post}">
<p><a href="getPostById.do?id=${post.id}">${post.description}</a></p>


</c:forEach>

<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>