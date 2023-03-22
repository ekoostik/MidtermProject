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
			<!-- input for date -->
			<label for="name">Name:</label> <br> <input id="name"
				name="name" type="text" required> <br>
			      <input type="text" id="description" name="description" />
			
				<!-- input for description -->
				<!-- input for authority contacted -->
				<!-- ==START OF ANIMAL REPORT== -->
				<!-- input for species involved -->
				<!-- input for spottting date -->
				<!-- input for description -->
				
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