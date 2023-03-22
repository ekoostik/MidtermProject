<!-- David -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>View Post</title>
<link rel="stylesheet" href="css/stylesheet.css">
<style>
body {
	margin-top: 20px;
	background-color: #ecf0f5;
}

.box-widget {
	border: none;
	position: relative;
}

.box {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}

.box-header.with-border {
	border-bottom: 1px solid #f4f4f4;
}

.box-header {
	color: #444;
	display: block;
	padding: 10px;
	position: relative;
}

.user-block img {
	width: 40px;
	height: 40px;
	float: left;
}

.user-block .username {
	font-size: 16px;
	font-weight: 600;
}

.user-block .description {
	color: #999;
	font-size: 13px;
}

.user-block .username, .user-block .description, .user-block .comment {
	display: block;
	margin-left: 50px;
}

.box-header>.box-tools {
	position: absolute;
	right: 10px;
	top: 5px;
}

.btn-box-tool {
	padding: 5px;
	font-size: 12px;
	background: transparent;
	color: #97a0b3;
}

.box-body {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	padding: 10px;
}

.pad {
	padding: 10px;
}

.box .btn-default {
	background-color: #f4f4f4;
	color: #444;
	border-color: #ddd;
}

.box-comments {
	background: #f7f7f7 !important;
}

.box-footer {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	border-top: 1px solid #f4f4f4;
	padding: 10px;
	background-color: #fff;
}

.box-comments .box-comment:first-of-type {
	padding-top: 0;
}

.box-comments .box-comment {
	padding: 8px 0;
	border-bottom: 1px solid #eee;
}

.img-sm, .box-comments .box-comment img, .user-block.user-block-sm img {
	width: 30px !important;
	height: 30px !important;
}

.img-sm, .img-md, .img-lg, .box-comments .box-comment img, .user-block.user-block-sm img
	{
	float: left;
}

.box-comments .comment-text {
	margin-left: 40px;
	color: #555;
}

.box-comments .username {
	color: #444;
	display: block;
	font-weight: 600;
}

.box-comments .text-muted {
	font-weight: 400;
	font-size: 12px;
}

.img-sm+.img-push {
	margin-left: 40px;
}

.box .form-control {
	border-radius: 0;
	box-shadow: none;
	border-color: #d2d6de;
}
</style>
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>



	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet">
	<div class="container bootstrap snippets bootdey">
		<div class="col-md-8">
			<div class="box box-widget">
				<div class="box-header with-border">
					<div class="user-block">
						<img class="img-circle" src="${post.user.profilePic}"
							alt="User Image" class="user"> <a
							href="GoToProfile.do?id=${post.user.id}">${post.user.firstName}</a> <span
							class="description">Posted:${post.createDate}</span>
					</div>

				</div>
				

				<div class="box-body" style="display: block;">
					<img class="img-responsive pad" src="${post.image}" alt="Photo">
					<p>${post.description}</p>
				
					<form action="commentLike.do" method="POST">
						<input name="postId" type="hidden" value="${post.id}"></input> <input
							name="userId" type="hidden" value="${loggedinuser.id}"></input>
							<input type="submit" class="btn btn-default" value="Unlike">
							<span class="pull-right text-muted">${likes}
								likes</span>
					</form>
					
				



					<c:if test="${loggedinuser.id == post.user.id}">


						<form action="deletePost.do" method="POST">
						<label for="id"></label>
						<input type="hidden" name="id" value="${post.id}" />
						<input type="submit" class="btn btn-danger" value="Delete" />


							<a class="btn btn-warning" href="updatePost.do?id=${post.id}"
								role="button">Edit Post</a> 
								
						</form>
					</c:if>







				</div>
				<div class="box-footer box-comments" style="display: block;">
					<div class="box-comment">
						<c:forEach var="comments" items="${comments}">
							<img class="img-circle img-sm" src="${comments.user.profilePic}"
								alt="User Image">
							<div class="comment-text">
								<span class="username"></span>
								 <span
									class="text-muted pull-right">${comments.createDate}
									
									</span>
									<a href="GoToProfile.do?id=${comments.user.id}">${comments.user.firstName} ${comments.user.lastName}</a> 
								 
								<p>${comments}</p>
							</div>
						</c:forEach>
					</div>

					<div class="box-footer" style="display: block;">
						<form action="addComment.do?" method="post">
							<img class="img-responsive img-circle img-sm"
								src="${loggedinuser.profilePic}" alt="Alt Text">
							<div class="img-push">

								<label for="decription"></label> <input type="text"
									name="description" value="" /> 
									<input name="postId" type="hidden" value="${post.id}"></input> 
									<input name="userId" type="hidden" value="${loggedinuser.id}"></input> 
									
									<input type="submit"
									class="btn btn-success" value="Comment">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


</div>






















		<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>