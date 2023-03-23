<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Vigilance Home</title>
<link rel="stylesheet" href="../stylesheet.css">
</head>
<jsp:include page="../bootstrap/navbar.jsp" />
<body>
	<!--<div class="bg-image"
		style="background-image: url('https://media.timeout.com/images/105489784/image.jpg'), url('https://wallpapercosmos.com/w/full/c/c/e/1163036-3840x2160-desktop-4k-town-background.jpg');
		background-position: right bottom, left top; 
		background-repeat: no-repeat, repeat; 
		height: 30vh;">
		</div> -->
	<div class="container-fluid">

		<h2 class="homeh2">Welcome ${loggedinuser.firstName}!</h2>

		<div class="row">
			<div class="col" class="aboutText">
				<h1>ABOUT VIGILANCE</h1>
				<p>Vigilance allows for members of their respective
					neighborhoods to stay in the loop of any and all activity around
					them. This allows them to cut out the distractions and irrelevant
					information found on social media and communicate more easily with
					their neighbors</p>
				<p>Such functionality includes:</p>
				<ul>
					<li>Posting need to knows for fellow neighbors</li>
					<li>Collaborating for local projects</li>
					<li>Sending out event notices for parties, yard sales, etc.</li>
					<li>Sending out reports of incidents or suspicious activity</li>
				</ul>
			</div>
			<div class="col" class="create-new-post">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-th"></span> New Post
					</h3>
				</div>
				<div class="panel-body">
					<div class="col">
						<br>
						<c:choose>
							<c:when test="${empty loggedinuser.profilePic}">
								<img class="profile" src="images/defaultPic.png" width="200"
									height="200">
								<br>
							</c:when>
							<c:otherwise>
								<img class="profile" src="${loggedinuser.profilePic}"
									width="200" height="200">
								<br>
							</c:otherwise>
						</c:choose>
						<form action="addPost.do?" method="post">
							<input name="description" class="form-control" type="text"
								placeholder="Description"> <label for="decription"></label>
							<input name="photo" class="form-control" type="text"
								placeholder="Upload a Photo"> <label for="photo"></label>
							<input type="submit" class="btn btn-success" value="Post">
						</form>
						<br>

					</div>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col" class="buttons">
				<a href="viewAllEvents.do" class="btn btn-secondary" " role="button">View
					all Events</a> <br> <br> <a href="viewAllNeighborhoods.do"
					class="btn btn-secondary" role="button">View all Neighborhoods</a>
				<br> <br> <a href="viewAllposts.do"
					class="btn btn-secondary" role="button">View All Posts</a><br>
				<br> <a href="viewAllreports.do" class="btn btn-secondary"
					role="button">View All Reports</a><br> <br>
			</div>
			<div class="col" class="map">
				<p>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d21519602.387135845!2d-97.06068938592863!3d38.10089162992978!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2sus!4v1679453315451!5m2!1sen!2sus"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</p>
			</div>

			<div class="col" class="newestPosts">
				<a href="viewAllEvents.do" class="btn btn-secondary" role="button">View
					all Events</a> <br> <br> <a href="viewAllNeighborhoods.do"></a>
			</div>

		</div>
	</div>

	<br>
	<br>
	<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
</body>
</html>