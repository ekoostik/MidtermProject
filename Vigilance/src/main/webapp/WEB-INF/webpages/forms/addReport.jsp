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
 <p> ${user.firstName}, Enter the following information to make your report</p>
<form action="reportAdded.do" method="POST">

  <input type="hidden" name="householdId" value="${user.household.id }" /><br>
  Description<input type="text" name="address1" /><br>
  Date of Incident:<input type="date" name="address2" /><br>
  <div>
	<label for="contactAuthority">Were the police contacted?</label>
	<select id="contactAuthority" name="contactAuthority" required>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
			</select><br>
		</div>
 <button type="submit" class="btn btn-primary">Submit</button>
</form>



<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>