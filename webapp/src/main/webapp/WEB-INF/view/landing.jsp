<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
   <head>
      <title>WebApp Landing Page</title>
      <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   </head>
   <body>
      <h2>WebApp Landing Page</h2>
      <hr>
      <p>
         Welcome to the landing page! This page is open to the public ... no login required :-)
      </p>
      <hr>
      <p>
         <a href="${pageContext.request.contextPath}/employees">Access Secure Site (requires login)</a>
      </p>
   </body>
</html>