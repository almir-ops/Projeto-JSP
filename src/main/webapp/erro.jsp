<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Erro</title>
</head>
<body>
<center>
<h1 style= "color:FireBrick;">ERRO !</h1>
<h2>Entre em contato com a equipe de suporte do sistema</h2>
<%
	out.print(request.getAttribute("msg"));
%>

</center>
</body>
</html>