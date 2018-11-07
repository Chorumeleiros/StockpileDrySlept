<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SICONE | Login</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/style-login.css" />
		<script src="main.js"></script>
	</head>
		
	<body id ="back" class="p-3 mb-2 bg-dark text-gray">
		<%
			String msg = (String) session.getAttribute("MENSAGEM");
			if (msg != null) {
				session.setAttribute("MENSAGEM", null);
		%>
		<h3>
			<script>("<%=msg%>")</script>
		</h3>
		<%
			}
		%>

			<div class=" container p-3 mx-auto">
				<img src="imgs/sicone_logo.png" alt="SICONE" class="rounded mx-auto d-block" width="50%">
				<h3 class="text-center font-weight-light">Sistema Integrado de Controle de Estoque</h3>
			</div>
	
			<div class="container w-25 p-3 mx-auto">
			<form name="login" method="post" action="./Auth">
	  			<div class="form-group">
	    			<label for="id">ID</label>
	    			<input type="text" class="form-control" name="txtUser" aria-describedby="emailHelp">
	    			<small id="emailHelp" class="form-text text-muted text-gray">Não compartilhe seu ID ou senha com ninguém</small>
	  			</div>
			  	<div class="form-group">
			    	<label for="senha">Senha</label>
			    	<input type="password" class="form-control" name="txtPass">
			  	</div>
	  			<input type="submit" class="btn btn-primary float-right" id="btnEntrar" value="Entrar" name="cmd"/>
			</form>
		</div>

	</body>

</html>