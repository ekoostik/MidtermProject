<!-- AUTHOR: ROB TISDALE -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>User Update</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
<h1> Update HouseHold</h1>
<form action="updateUserForm.do" method="POST">
<h2> Occupants & Address</h2>
<br>
Occupants: <input type="number" name="occupants" value="${loggedinuser.household.occupants}"/>

<input type="hidden" name="householdId" value="${loggedinuser.household.id }" />
Street: <input type="text" name="address1" value="${loggedinuser.household.address.address1}"/> 
Street(Optional): <input type="text" name="address2" value="${loggedinuser.household.address2}"/>
City: <input type="text" name="city" value="${loggedinuser.household.address.city}"/>
State: <input type="text" name="state" value="${loggedinuser.household.address.state}"/> 
ZipCode: <input type="number" name="zipCode" value="${loggedinuser.household.address.zipCode}"/>

<h2>Vehicles</h2>

<input type="hidden" name="id" value="${loggedinuser.household.vehiclesid }" />

							items="${loggedinuser.household.vehicles}">
							<ul style="list-style-type: none;">
								<li>Make: ${v.make}</li>
								<li>Model: ${v.model}</li>
								<li>Color: ${v.color}</li>
								<li>Description: ${v.description}</li>
							</ul>
					<%-- 	</c:forEach></td> --%>
<h2>Pets</h2>


 <button type="submit" class="btn btn-primary">Update</button>
</form> 

<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>