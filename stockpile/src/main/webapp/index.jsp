<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SICONE Login</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/fontawesome-all.min.css" />
		<link rel="stylesheet" type="text/css" href="css/style-login.css" />
		<script src="main.js"></script>
	</head>
		
	<body id="back" class="p-3 mb-2 bg-dark text-gray">
				
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
			<header>
				<div class="container">
					<img src="imgs/sicone_logo.png" alt="SICONE" class="rounded mx-auto d-block" width="30%" style="margin-top:50px">
					<h4 class="text-center">Sistema Integrado de Controle de Estoque</h4>
				
				</div>
			</header>
			
			<div class="container w-25 p-3">
				<form name="login" method="post" action="">
		  			<div class="form-group">
		    			<label for="exampleInputEmail1">ID</label>
		    			<input type="text" class="form-control" id="TXTUSER" aria-describedby="emailHelp" placeholder="Insira seu ID">
		    			<small id="emailHelp" class="form-text text-muted ">Não compartilhe seu ID ou senha com ninguém.</small>
		  			</div>
				  	<div class="form-group">
				    	<label for="exampleInputPassword1">Password</label>
				    	<input type="password" class="form-control" id="TXTPASS" placeholder="Insira sua Senha">
				  	</div>
		  			<button type="submit" class="btn btn-primary" id="btnEntrar">Entrar</button>
				</form>
			</div>
	</body>

</html>