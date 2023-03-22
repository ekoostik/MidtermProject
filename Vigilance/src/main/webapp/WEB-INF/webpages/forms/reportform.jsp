<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>View Reports</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>

	<table class="table table-striped table-hover">
		<thead>
			<th>Description</th>
			<th>Report</th>
			<!-- header -->
			<!--header  -->
		</thead>
		<tbody>
			<c:forEach var="report" items="${report}">
				<tr>
					<td>${report.description}</td>

					<c:if test="${not empty report.animals}">
						<td>${report.animals}</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form action="reportAdded.do" method="POST">
		<fieldset>
			<legend>Enter information to make a report:</legend>
			<input type="hidden" name="householdId" value="${user.household.id}" /><br>
			Description<input type="text" name="address1" /><br> Date of
			Incident:<input type="date" name="address2" /><br>
			<div>
				<label for="contactAuthority">Were the police contacted?</label> <select
					id="contactAuthority" name="contactAuthority" required>
					<option value="Yes">Yes</option>
					<option value="No">No</option>
				</select><br>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</fieldset>
	</form>

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>