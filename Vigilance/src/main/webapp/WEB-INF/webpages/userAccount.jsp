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
					<td>${household.id}</td>
					<td>
						<ul style="list-style-type: none;">
							<li>${address.address1}</li>
							<li>${address.address2}</li>
							<li>${address.city}</li>
							<li>${address.state}</li>
							<li>${address.zipCode}</li>
						</ul>
					</td>
					<td>${household.occupants}<br>
					</td>
					<td>
					<c:choose>
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
					</c:choose>	
					</td>
				<td>
				<c:choose>
					<c:when test="${empty pets}">No Pets Listed
					</c:when>
					<c:otherwise>
					<c:forEach var="p" items="${pets}">
							<ul style="list-style-type: none;">
								<li>Name: ${p.name}</li>
								<li>Species: ${p.species}</li>
								<li>Breed: ${p.breed}</li>
								<li>Color: ${p.color}</li>
								<li>Tagged: ${p.tagged}</li>
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
				<td><a href="updateOccupants.do" class="btn btn-warning" role="button">Update Occupants</a></td>	
				<td>
				<c:choose>
					<c:when test="${empty vehicles}">
					<a href="addVehicle.do" class="btn btn-success" role="button">Add Vehicle</a>
					</c:when>
					<c:otherwise>
				<a href="addVehicle.do" class="btn btn-success" role="button">Add Vehicle</a>
				<a href="updateVehicle.do" class="btn btn-warning"  role="button">Update Vehicle</a>
				<a href="removeVehicle.do" class="btn btn-danger"  role="button">Remove Vehicle</a>
					</c:otherwise>
					</c:choose>
				</td>	
				<td><c:choose>
					<c:when test="${empty pets}">
					<a href="addPet.do" class="btn btn-success" role="button">Add Pet</a>
					</c:when>
					<c:otherwise>
					<a href="addPet.do" class="btn btn-success" role="button">Add Pet</a>
					<a href="updatePet.do" class="btn btn-warning" role="button">Update Pet</a>
					<a href="removePet.do" class="btn btn-danger" role="button">Remove Pet</a>
					</c:otherwise>
					</c:choose>
					</td>	
				</tr>
			</tbody>
		</table>
		<br>
	</div>
	<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>