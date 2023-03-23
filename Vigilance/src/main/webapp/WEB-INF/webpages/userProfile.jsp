<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="css/stylesheet.css">
<style>
body {
	margin-top: 20px;
	background: #DCDCDC;
}

#centerButtons {
	color: #DCDCDC;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.content {
	padding: 35px 0px;
}

.post-list {
	padding: 90px 0px;
}

.post-detail {
	padding: 40px 0px;
	margin-top: 120px;
}

.post {
	width: 100%;
	float: left;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.4);
	-moz-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.4);
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.4);
	background: #fff;
	margin-bottom: 40px;
	border-radius: 3px;
}

.feature-post .thumbnail .author-info {
	padding: 20px 5px 20px 40px;
	text-align: left;
	min-height: 80px;
	background: #2c3840;
	float: left;
	width: 100%;
}

.post .post-type {
	float: left;
	width: 100%;
}

.post iframe {
	padding: 0px;
	margin: 0px;
}

.post .mejs-container {
	border-radius: 3px 3px 0px 0px;
	width: 100% !important;
}

.post .post-video {
	border-radius: 3px 3px 0px 0px;
}

.post .post-video iframe {
	width: 100%;
}

.post .post-video video {
	border-radius: 3px 3px 0px 0px;
}

.post .post-multiple-img a img {
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	width: 100%;
	height: auto;
	display: block;
	min-height: 160px;
}

.post .post-multiple-img a {
	float: left;
	width: 100%;
	display: block;
}

.post .post-multiple-img a:hover img {
	opacity: 0.7;
}

.post .post-audio {
	height: auto;
}

.post .post-audio ._SMB-widget {
	width: 100%;
}

.post .post-quote blockquote {
	text-align: center;
	margin: 0px;
	padding: 25px 15px;
}

.post .post-quote blockquote h3 {
	color: #e74c3c;
	font-size: 36px;
	margin: 0px 0px 10px 0px;
}

.post .post-quote blockquote p {
	color: #333;
	font-size: 24px;
	font-weight: 300;
}

.post .post-img a {
	display: block;
}

.post .post-img:hover a img {
	opacity: 0.7;
}

.post .post-img a img {
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	width: 100%;
	height: auto;
	border-radius: 3px 3px 0px 0px;
}

.post-detail .post .caption {
	padding: 55px 45px 0px 45px;
}

.post .caption {
	float: left;
	width: 100%;
	text-align: left;
	padding: 25px 25px;
}

.post .caption h3 {
	margin: 0px 0px 20px 0px;
	color: #36a0e7;
	font-weight: 300;
	font-size: 34px;
	line-height: 42px;
}

.post .caption p {
	line-height: 28px;
	margin-bottom: 20px;
	font-size: 16px;
}

.post .author-info {
	padding: 15px 15px 15px 15px;
	text-align: left;
	min-height: 60px;
	border-bottom: 1px solid #ddd;
	background: #fcfcfc;
	float: left;
	width: 100%;
}

.post .author-info .list-inline {
	margin: 0px;
}

.post .author-info ul li:first-child {
	border-left: none;
	padding-left: 0px;
}

.post .author-info ul li {
	float: left;
	border-left: 1px solid #ddd;
	padding-left: 20px;
	padding-right: 20px;
}

.post .author-info ul li p {
	line-height: 16px;
	color: #3b4952;
	font-weight: 300;
	font-size: 14px;
	margin: 0px;
}

.post .author-info ul li strong {
	color: #3b4952;
}

.post .author-info ul li a {
	color: #3b4952;
	font-weight: 700;
	font-size: 16px;
	line-height: 20px;
}

.post .author-info ul li a:hover {
	color: #e74c3c;
	text-decoration: none;
}

.post .author-info ul li .icon-box {
	margin-right: 15px;
	width: 36px;
	text-align: center;
	line-height: 36px;
	font-size: 30px;
	height: 36px;
	float: left;
	background: transparent;
	color: #aebbc5;
}

.post .author-info ul li .icon-box img {
	border-radius: 3px;
	width: 100%;
}

.post .author-info ul li .info {
	float: left;
}

.post .author-info.author-info-2 ul li:first-child {
	border-left: none;
	padding-left: 0px;
}

.post .author-info.author-info-2 ul li .icon-box {
	font-size: 28px;
}

.post .post-category {
	float: left;
	width: 100%;
	text-align: left;
	margin-bottom: 20px;
}

.post .post-category a {
	margin: 0px;
	font-size: 18px;
	font-weight: 300;
	color: #3b4952;
}

.post .post-category span {
	width: 12px;
	height: 12px;
	display: inline-block;
	background: #3b4952;
	vertical-align: middle;
	margin-right: 10px;
}

.post .post-category a:hover span {
	background: #e74c3c;
	color: #e74c3c;
}

.post .post-category a:hover {
	color: #e74c3c;
}

.post .tags {
	float: left;
	width: 100%;
	margin-bottom: 20px;
}

.post .tags li {
	margin-bottom: 8px;
	padding: 0px 2px;
}

.post .tags li a {
	background: #ebf1f4;
	font-size: 14px;
	font-weight: 300;
	border-radius: 3px;
	padding: 4px 8px;
	color: #3b4952;
}

.post .tags li a:hover {
	background: #3b4952;
	color: #fff;
}

.img-grid {
	float: left;
	margin-bottom: 40px;
}

.img-grid li {
	margin: 0px;
	float: left;
}

.post .caption h5 {
	text-decoration: underline;
	margin: 0px 0px 20px 0px;
	color: #3b4952;
	font-weight: 300;
	font-size: 24px;
	line-height: 30px;
}

.post .list-unstyled {
	margin-bottom: 40px;
}

.post .list-unstyled li {
	font-size: 16px;
	line-height: 28px;
	font-weight: 500;
	color: #49545b;
}

.post .list-unstyled li i {
	color: #a0b9ca;
	margin-right: 15px;
}

blockquote {
	background: #f2f6f8;
	border: 1px solid #e5e5e5;
	line-height: 28px;
	margin-bottom: 40px;
	font-size: 16px;
	font-weight: 500;
	color: #49545b;
}

.line-block {
	padding: 20px 45px;
	border-top: 1px solid #eef3f6;
	border-bottom: 1px solid #eef3f6;
	float: left;
	width: 100%;
}

.post .line-block .tags {
	margin-bottom: 0px;
}

.share-this {
	padding: 20px 45px;
	border-bottom: 1px solid #eef3f6;
	float: left;
	width: 100%;
}

.share-this p, .share-this ul {
	margin-bottom: 0px;
}

.share-this li a {
	background: #2c3840;
	line-height: 34px;
	text-align: center;
	color: #fff;
	width: 32px;
	height: 32px;
	display: block;
	border-radius: 50%;
}

.share-this li a.pinterest {
	background: #d91c1c;
}

.share-this li a.google-plus {
	background: #f25353;
}

.share-this li a.facebook {
	background: #2b77be;
}

.share-this li a.twitter {
	background: #62bfef;
}

.related-post {
	padding: 40px 45px;
	border-bottom: 1px solid #eef3f6;
	float: left;
	width: 100%;
}

.related-post .thumbnail {
	padding: 0px;
	border: none;
}

.related-post .thumbnail .caption {
	padding: 30px 0px 0px 0px;
}

.related-post .thumbnail .caption a {
	font-size: 18px;
	line-height: 28px;
	font-weight: 300;
	color: #49545b;
}

.related-post .thumbnail .caption a:hover {
	color: #36a0e7;
}

.related-post .thumbnail:hover a img {
	opacity: 0.7;
}

.related-post h4 {
	color: #49545b;
	font-weight: 700;
	font-size: 18px;
	margin: 0px 0px 20px 0px;
}

.comment-count {
	padding: 45px 45px;
	border-bottom: 1px solid #eef3f6;
	float: left;
	width: 100%;
}

.comment-count h4 {
	font-weight: 500;
	font-size: 24px;
	color: #3b4952;
}

.comment-count p {
	margin-bottom: 0px;
}

.comment-list {
	float: left;
	width: 100%;
}

.comment-list .media:first-child {
	margin-top: 0px;
	border-bottom: 1px solid #eef3f6;
}

.comment-list .media {
	padding: 30px 45px;
	margin-top: 0px;
}

.comment-list .media .media-body .media {
	padding-top: 30px;
	padding-bottom: 30px;
	padding-left: 30px;
	padding-right: 30px;
	margin-left: -80px;
	border-left: 1px solid #eef3f6;
	border-bottom: 1px solid #eef3f6;
}

.comment-list .media .media-body {
	position: relative;
}

.comment-list .media .media-left {
	padding-right: 20px;
}

.comment-list .media .nested-first {
	margin-top: 30px;
	border-top: 1px solid #eef3f6;
}

.comment-list .media .nested-first:before {
	position: absolute;
	left: -80px;
	top: 90px;
	content: '';
	width: 1px;
	background: #eef3f6;
	height: 170px;
}

.comment-list .media, .comment-list .media-body {
	overflow: visible;
	zoom: 1;
}

.comment-list .media .media-body ul {
	margin-bottom: 0px;
}

.comment-list .media .media-body ul li a {
	color: #919ea8;
	font-size: 18px;
	font-weight: 500;
}

.comment-list .media .media-body ul li a:hover {
	color: #36a0e7;
}

.comment-list .media .media-body ul li a.reply-btn {
	color: #49545b;
	text-decoration: underline;
}

.comment-list .media .media-body ul li a.reply-btn:hover {
	color: #36a0e7;
}

.comment-list .media .media-body ul li {
	font-size: 18px;
	padding-right: 15px;
	color: #919ea8;
	font-weight: 500;
}

.comment-form {
	float: left;
	width: 100%;
	padding: 30px 45px;
}

.comment-form h4 {
	font-weight: 300;
	font-size: 28px;
	color: #3b4952;
	margin-bottom: 40px;
}

.comment-form .form-control {
	border-radius: 0px;
	background: #f1f4f6;
	border: none;
	height: 50px;
	color: #4a555c;
	font-size: 16px;
}

.comment-form .form-control::-webkit-input-placeholder {
	color: #4a555c;
}

.comment-form .form-control:-moz-placeholder {
	color: #4a555c;
}

.comment-form .form-control::-moz-placeholder {
	color: #4a555c;
}

.comment-form .form-control:-ms-input-placeholder {
	color: #4a555c;
}

.comment-form textarea.form-control {
	height: auto;
	min-height: 200px;
	resize: none;
}

.comment-form form {
	margin-bottom: 40px;
}

.vt-post.post .author-info ul li {
	padding-left: 15px;
	padding-right: 15px;
	float: none;
}

.vt-post.post .author-info {
	border-radius: 0px 0px 0px 3px;
	border-bottom: none;
	border-right: 1px solid #ddd;
	padding: 15px 12px 15px 12px;
}

.vt-post.post .post-img a img {
	border-radius: 3px 0px 0px 0px;
}

.vt-post.post .caption {
	padding: 25px 0px;
}

.post .caption h3 {
	margin: 0px 0px 20px 0px;
	color: #36a0e7;
	font-weight: 300;
	font-size: 34px;
	line-height: 42px;
}

.md-heading {
	font-size: 24px !important;
	line-height: 36px !important;
	margin-bottom: 15px !important;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	background-color: #3b4952;
	border-color: #3b4952;
}

.pagination>li>a, .pagination>li>span {
	color: #2c3840;
	margin: 0px 5px;
	border-radius: 3px;
	-webkit-box-shadow: 0px 1px 3px 0px rgba(44, 56, 64, 0.2);
	-moz-box-shadow: 0px 1px 3px 0px rgba(44, 56, 64, 0.2);
	box-shadow: 0px 1px 3px 0px rgba(44, 56, 64, 0.2);
	border: none;
	font-size: 16px;
}

.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus,
	.pagination>li>span:hover {
	background-color: #e74c3c;
	border-color: #e74c3c;
	color: #fff;
}

.pagination-wrap {
	width: 100%;
	float: left;
	margin-bottom: 35px;
}

.pagination {
	margin: 0px;
}
</style>
</head>
<jsp:include page="../bootstrap/navbar.jsp" />
<body>
	<div class="card">
		<h1>${user.firstName}${user.lastName}</h1>
		<p>This page will show all posts, entries, etc particular to the
			user.</p>
		<jsp:include page="../bootstrap/bootstrapFooter.jsp" />
		<div id="centerButtons">
			<a href="#" width="100px" height="100px"><img
				src="${user.profilePic}"
				class="img-responsive" alt="image post"></a><br><br><br>
		</div>
		<div id="centerButtons">
		
				<a class="btn btn-default" href="RetrieveMyPosts.do" 
				role="button">View My Posts</a> 
				
				<a class="btn btn-default" href="RetrieveMyReports.do"
				role="button">View My Reports</a> 
				
				<a class="btn btn-default"
				href="RetrieveMyEvents.do" role="button" >View My Events</a> <br>
		</div>
		<strong>About me:</strong>
		<c:choose>
			<c:when test="${user.aboutme == null}">
				<a href="updateUserForm.do">No About Me Yet! Add one</a>
			</c:when>
			<c:otherwise>
					${user.aboutme}
				</c:otherwise>
		</c:choose>
		<h4>
			Name: ${user.firstName } ${loggedinuser.lastName}<br> 
			Date Joined Vigilance: ${user.createDate }<br> 
			Date of Birth: ${user.dateOfBirth }<br>
			Email: ${user.email }<br>
		</h4>
	</div>
	</div>
</body>
</html>