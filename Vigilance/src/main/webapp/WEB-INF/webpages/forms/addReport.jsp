<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>

<h3>Report Information</h3>

 <form action="reportAdded.do" method="POST">
		<fieldset>
			<legend>Enter information to make a report:</legend>
				
				<label for="contactAuthority">Were the police contacted?</label> <select
					id="contactAuthority" name="contactAuthority" required>
					<option value="True">Yes</option>
					<option value="False">No</option>
				</select><br>
			<button type="submit" class="btn btn-primary">Submit</button>
		</fieldset>
	</form>

	

<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
