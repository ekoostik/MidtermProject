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


<a href="viewAllNeighborhoods.do" class="btn btn-secondary" role="button">View all Neighborhoods</a>
<a href="viewAllposts.do" class="btn btn-secondary" role="button">Post</a>


<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
</body>
</html>