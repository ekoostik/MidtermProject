<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Account</title>
<link rel="stylesheet" href="../stylesheet.css">
</head>
<jsp:include page="../bootstrap/navbar.jsp" />
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
		<h1 class="profileH1">${loggedinuser.firstName}'s Account</h1>
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
		<form action="updateUserInfo.do" method="GET">
			<button name="update" type="submit" class="btn btn-dark">Update
				Information</button>
		</form>
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
					<td>${loggedinuser.household.occupants}<br>
					</td>
					<td>
					<c:choose>
					<c:when test="${empty loggedinuser.household.vehicles}">No Vehicles Listed<br>
					<a href="addPet.do" class="btn btn-secondary" role="button">Add Vehicle</a>
					</c:when>
					<c:otherwise>
					<c:forEach var="v"
							items="${loggedinuser.household.vehicles}">
							<ul style="list-style-type: none;">
								<li>Make: ${v.make}</li>
								<li>Model: ${v.model}</li>
								<li>Color: ${v.color}</li>
								<li>Description: ${v.description}</li>
							</ul>
						</c:forEach>
					</c:otherwise>
					</c:choose>	
					</td>
				<td>
				<c:choose>
					<c:when test="${empty loggedinuser.household.pets}">No Pets Listed
					</c:when>
					<c:otherwise>
					<c:forEach var="p" items="${loggedinuser.household.pets}">
							<ul style="list-style-type: none;">
								<li>Name: ${p.name}</li>
								<li>Species: ${p.species}</li>
								<li>Breed: ${p.breed}</li>
								<li>Color: ${p.color}</li>
								<%-- <li>Tagged: ${p.tagged}</li> --%>
							</ul>
						</c:forEach>
					</c:otherwise>
					</c:choose>	
							
						</td>
				</tr>
				<tr>
				<td></td>	
				<td></td>	
				<td><a href="updateOccupants.do" class="btn btn-secondary" role="button">Update Occupants</a></td>	
				<td>
				<c:choose>
					<c:when test="${empty loggedinuser.household.vehicles}">
					<a href="addVehicle.do" class="btn btn-secondary" role="button">Add Vehicle</a>
					</c:when>
					<c:otherwise>
				<a href="updateVehicle.do" class="btn btn-secondary" role="button">Update Vehicle</a>
				<a href="removeVehicle.do" class="btn btn-secondary" role="button">Remove Vehicle</a>
					</c:otherwise>
					</c:choose>
				</td>	
				<td><c:choose>
					<c:when test="${empty loggedinuser.household.pets}">
					<a href="addPet.do" class="btn btn-secondary" role="button">Add Pet</a>
					</c:when>
					<c:otherwise>
					<a href="updatePet.do" class="btn btn-secondary" role="button">Update Pet</a>
					<a href="add another.do" class="btn btn-secondary" role="button">Add Pet</a>
					</c:otherwise>
					</c:choose>
					</td>	
				</tr>
			</tbody>
		</table>
		<br>
		<form action="updateHousehold.do" method="GET">
			<button name="update" type="submit" class="btn btn-dark">Update
				Household</button>
		</form>

		<p>This page will hold their respective information. Such as
			address/contact information, neighborhood, time online, etc</p>
		<p>As well as the logic to edit their information to be reflected
			in the database</p>
	</div>
	<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
</body>
</html>