<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background:#eee;
}
.separator {
    border-right: 1px solid #dfdfe0; 
}
.icon-btn-save {
    padding-top: 0;
    padding-bottom: 0;
}
.input-group {
    margin-bottom:10px; 
}
.btn-save-label {
    position: relative;
    left: -12px;
    display: inline-block;
    padding: 6px 12px;
    background: rgba(0,0,0,0.15);
    border-radius: 3px 0 0 3px;
}

</style>
</head>
<body>

<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-th"></span>
                        New Post   
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6 separator social-login-box"> <br>
                           <img alt="" class="img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar1.png">  
                                <form action="addPost.do?" method="post">
                                <input name="description" class="form-control" type="text" placeholder="Description">
                                <label for="decription"></label> 
                                <input name="photo" class="form-control" type="text" placeholder="Upload a Photo">
                                <label for="photo"></label> 
								<input type="submit" class="btn btn-success" value="Post">                      
                                </form>
			
                        </div>
                     
                    </div>
                </div>
             
            </div>
        </div>
    </div>
</div>

</body>
</html>