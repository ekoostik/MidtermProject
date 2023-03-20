<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Report</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>

<form action="getReportById.do" method="POST">
  Enter an ID<input type="number" name="id" /><br>
  
  
 <button type="submit" class="btn btn-primary">Submit</button>
</form>

<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>