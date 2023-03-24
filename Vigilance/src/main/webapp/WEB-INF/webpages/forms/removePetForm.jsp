<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Account</title>

<link rel="stylesheet" href="./stylesheet.css">
</head>
<jsp:include page="/WEB-INF/bootstrap/navbar.jsp" />
<body>
	<div class="container-fluid">
		<c:choose>
			<c:when test="${empty loggedinuser.profilePic}">
				<img class="profile" src="images/defaultPic.png" width="200"
					height="200">
				<br>
			</c:when>
			<c:otherwise>
				<img class="profile" src="${loggedinuser.profilePic}" width="200"
					height="200">
				<br>
			</c:otherwise>
		</c:choose>
		<h1 class="profileH1">${loggedinuser.firstName}'sAccount</h1>
		<br>
		<h2>User Information</h2>
		<ul style="list-style-type: none;">
			<li>First Name: ${loggedinuser.firstName}</li>
			<li>Last Name: ${loggedinuser.lastName}</li>
			<li>Username: ${loggedinuser.username}</li>
			<li>Email: ${loggedinuser.email}</li>
			<li>Date of Birth: ${loggedinuser.dateOfBirth}</li>
		</ul>
		<h3 class="profileH3">About Me</h3>
		${loggedinuser.aboutme}
		<br>
		<h2>Household Information</h2>
		<table>
			<thead>
				<tr>
					<td>Household ID</td>
					<td>Household Address</td>
					<td>Occupants</td>
					<td>Vehicles</td>
					<td>Pets</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${loggedinuser.household.id}</td>
					<td>
						<ul style="list-style-type: none;">
							<li>${loggedinuser.household.address.address1}</li>
							<li>${loggedinuser.household.address.address2}</li>
							<li>${loggedinuser.household.address.city}</li>
							<li>${loggedinuser.household.address.state}</li>
							<li>${loggedinuser.household.address.zipCode}</li>
						</ul>
					</td>
					<td>${loggedinuser.household.occupants}"</td>
						<td><c:choose>
					<c:when test="${empty vehicles}">No Vehicles Listed
					</c:when>
					<c:otherwise>
					<c:forEach var="v"
							items="${vehicles}">
							<ul style="list-style-type: none;">
								<li>Make: ${v.make}</li>
								<li>Model: ${v.model}</li>
								<li>Color: ${v.color}</li>
								<li>Description: ${v.description}</li>
							</ul>
						</c:forEach>
					</c:otherwise>
					</c:choose>	</td>
						<td><c:choose>
								<c:when test="${ !empty pets}">
										<form action="petRemoved.do" method="POST">									
											<select name="id">
											<c:forEach var="p" items="${pets}">
												<option value="${p.id}">
												${p.species}: ${p.name} 
												</option>
											</c:forEach>
											</select>
										 <button type="submit" class="btn btn-primary"value="${p.id}">Submit</button>
										 <a href="cancelUpdate.do" class="btn btn-danger" role="button">Cancel</a>
										</form> 
									</c:when>
							</c:choose></td>
				</tr>
			</tbody>
		</table>
		<br>

		<p>This page will hold their respective information. Such as
			address/contact information, neighborhood, time online, etc</p>
		<p>As well as the logic to edit their information to be reflected
			in the database</p>
	</div>
	<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>