<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Neighborhood Event</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<style>
</style>
<body>


	<div class="container">
		<c:forEach var="hood" items="${hood}">
			<div class="col-md-12 col-lg-12">

				<div class="row">
					<div class="col-xs col-sm-5 col-md-5 col-lg-2">

						
						
									
									<a href="getHoodById.do?id=${hood.id}"><strong>${hood.name}</strong></a>
									<br>
									${hood.description}
									<br>
									${hood.imageUrl}
								
					

						
					</div>
				</div>




			</div>
		</c:forEach>
	</div>














	<p>Don't See your neighborhood ?</p>
	<p>Please fill out the following fields to continue.</p>
	<form action="newneighborhood.do" method="POST">
		Name<input type="text" name="name" /><br> Image(Optional)<input
			type="text" name="imageUrl" /><br> Description <input
			type="text" name="description" /><br>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>



	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>