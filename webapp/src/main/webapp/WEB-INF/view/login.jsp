<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

</head>
<body>
	<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
		<p>User Name : <input type="text" name = "username"/></p>
		<p>Password : <input type="password" name = "password"/></p>
		<input type="submit" value="Login"/>
	</form:form>
</body>
</html>