<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page For Employee</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>Hello There Welcome To Home Page!!!!!!!!!!!!!!!!!!!</h2>
	User : <security:authentication property="principal.username"/>
	Role : <security:authentication property="principal.authorities"/>
	<form:form action="${pageContext.request.contextPath}/logout" method="POST" cssClass="form-horizontal">
		<div style="margin-top: 10px" class="form-group">						
		<div class="col-sm-6 controls">
			<button type="submit" class="btn btn-success">Logout</button>
		</div>
	</div>
	</form:form>
	<security:authorize access="hasRole('MANAGER')">
	<p> 
		<hr>
		<a href = "${pageContext.request.contextPath}/leader">
			 LeaderShip Meeting (Only For Manager) 
		</a> 
		<hr>
	</p>
	</security:authorize>
	<security:authorize access="hasRole('ADMIN')">
	<p> 
		<a href = "${pageContext.request.contextPath}/system"> 
			Admin Page (Only For Admin) 
		</a> 
		<hr>
	</p>
	</security:authorize>
</body>
</html>