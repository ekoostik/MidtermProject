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
<jsp:include page="../bootstrap/adminNavbar.jsp" />
<body>
<div class="bg-image" 
     style="background-image: url('https://media.timeout.com/images/105489784/image.jpg'), url('https://wallpapercosmos.com/w/full/c/c/e/1163036-3840x2160-desktop-4k-town-background.jpg'); background-position: right bottom, left top; background-repeat: no-repeat, repeat;
            height: 70vh;">
<div class="container-fluid">
<h2 class="homeh2"> Welcome ${loggedinuser.firstName}!</h2>
<a href="viewAllEvents.do" class="btn btn-secondary" role="button">View all Events</a>
<a href="getPostById.do?id=1" class="btn btn-secondary" role="button">View all Post</a>
<a href="viewAllNeighborhoods.do" class="btn btn-secondary" role="button">View all Neighborhoods</a>
<a href="viewAllposts.do" class="btn btn-secondary" role="button">Post</a>
<a href="viewAllreports.do" class="btn btn-secondary" role="button">View Reports</a>
<div class="row">
<div class="col-6">
<h2 class="homeh2">Birds Eye View</h2>
<p><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d21519602.387135845!2d-97.06068938592863!3d38.10089162992978!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2sus!4v1679453315451!5m2!1sen!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
</div>
<div class="col-6 " style="align-center" >
<div class="aboutText">
<h1> ABOUT VIGILANCE</h1>
<p>Vigilance allows for members of their respective neighborhoods to stay in the loop of any and all activity around them. This allows them to cut out the distractions and irrelevant information found on social media and communicate more easily with their neighbors</p>
<p>Such functionality includes:</p>
	<ul>
		<li>Posting need to knows for fellow neighbors</li>
		<li>Collaborating for local projects</li>
		<li>Sending out event notices for parties, yard sales, etc.</li>
		<li>Sending out reports of incidents or suspicious activity</li>
	</ul>
	</div>
</div>
</div>
</div>
</div>
<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
</body>
</html>

