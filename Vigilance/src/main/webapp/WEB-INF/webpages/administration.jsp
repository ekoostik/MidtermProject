<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet" href="../stylesheet.css">
</head>
<jsp:include page="../bootstrap/adminNavbar.jsp" />
<body>
<body>
	<div class="container-fluid">
		<c:choose>
			<c:when test="${empty loggedinadmin.profilePic}">
				<img class="profile" src="images/defaultPic.png" width="200"
					height="200">
				<br>
			</c:when>
			<c:otherwise>
				<img class="profile" src="${loggedinadmin.profilePic}" width="200"
					height="200">
				<br>
			</c:otherwise>
		</c:choose>
		<h1 class="profileH1">${loggedinadmin.firstName}'s Administration
			Account</h1>
		<br>
		<h2>Admin Information</h2>
		<ul style="list-style-type: none;">
			<li>First Name: ${loggedinadmin.firstName}</li>
			<li>Last Name: ${loggedinadmin.lastName}</li>
			<li>Username: ${loggedinadmin.username}</li>
			<li>Email: ${loggedinadmin.email}</li>
			<li>Date of Birth: ${loggedinadmin.dateOfBirth}</li>
		</ul>
		<h2>User Information</h2>
		<table>
			<thead>
				<tr>
					<td>User ID</td>
					<td>Name</td>
					<td>Role</td>
					<td>Details</td>
					<td>Date of Birth</td>
					<td>Email</td>
					<td>User Name</td>
					<td>Password</td>
					<td>Account Created</td>
					<td>Active</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty allusers}">No Users Listed</c:when>
					<c:otherwise>
						<c:forEach var="a" items="${allusers}">
							<tr>
								<td>${a.id}</td>
								<td>${a.firstName} ${a.lastName}</td>
								<td>${a.role}</td>
								<td>
									<ul style="list-style-type: none;">
										<li>Neighborhood ID:
											${a.household.address.neighborhood.id}</li>
										<li>Neighborhood Name:
											${a.household.address.neighborhood.name}</li>
										<li>Household Id: ${a.household.id}</li>
										</ul>
								<td>${a.dateOfBirth}</td>
								<td>${a.email}</td>
								<td>${a.username}</td>
								<td>${a.password}</td>
								<td>${a.createDate}</td>
								<td>${a.enabled}</td>
								<td>
													
							<form action="activateUser.do" method="POST">
								<button name="userId" type="submit" value="${a.id}" class="btn btn-success">Activate</button>
							</form>

							<form action="deactivateUser.do" method="POST">
								<button name="userId" type="submit" value="${a.id}" class="btn btn-danger">Deactivate</button>
							</form>
						</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
				</table>
	</div>
	<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
</body>
</html>