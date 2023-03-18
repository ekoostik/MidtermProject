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






<c:forEach var="event" items="${event}">
<ul>
<li> <a href="getEventById.do?id=${event.id}"><strong>${event.id}</strong></a></li>
<li> <strong>${event.name}</strong></li>
<li> <strong>${event.description}</strong></li>
</ul>
</c:forEach>


















<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>