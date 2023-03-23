<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>

	<h3>Report Information</h3>

	<form action="reportAdded.do" method="POST">
		<fieldset>
			<!-- input for date -->
			<div class="input-box">
				<span class="details">Date:</span> <input type="date"
					name="reportDate" required /><br>
			</div>
			<!-- input for subject-->
			<div class="input-box">
				<span class="details">Subject:</span> <input type="text" placeholder="Enter subject here"
					name="subject" required /><br>
			</div>
			<!-- input for description -->
			<div>
				<label for="description"> Description:</label><br>
				<textarea id="description" name="description" rows="4" cols="50">Enter description..
				</textarea>
			</div>
			


			<!-- input for authority contacted -->
			<div>
			<label for="contactAuthority">Were the police contacted?</label> <select
				id="contactAuthority" name="contactAuthority" required>
				<option value="True">Yes</option>
				<option value="False">No</option>
			</select><br>
			</div>
			<div>
			<label for="animalsPresent">Were the animals involved?</label> <select
				id="animalsPresent" name="animalsPresent" required>
				<option value="True">Yes</option>
				<option value="False">No</option>
			</select><br>
			</div>
			
			<!-- ==========START OF ANIMAL REPORT================================== -->
			

			<!-- input for species involved -->
			<!-- <div>
			<div class="input-box">
				<span class="details">Species Involved</span> <input type="text"
					name="reportDate" placeholder="Enter species here" required /><br>
			</div>
			</div>

			input for spottting date
			<div>
			<div class="input-box">
				<span class="details">Spotting Date:</span> <input type="date"
					name="spottingTime" required /><br>
			</div>
			</div> -->
			

			

		
			<button type="submit" class="btn btn-primary">Submit</button>
		</fieldset>
	</form>



	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>