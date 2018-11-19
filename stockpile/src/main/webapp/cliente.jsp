<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Cliente, java.util.List, java.util.ArrayList"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SICONE | Clientes</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" href="css/style-menu" />
		<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.mask.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
			
		<script type="text/javascript">
			$(document).ready(function(){
				$('#txtCpf').mask('000.000.000-00');
			})
		</script>
	</head>
	
	<%
	
	String msg = (String)session.getAttribute("MENSAGEM");

	@SuppressWarnings("unchecked")
 	List<Cliente> listaCliente = (List<Cliente>)session.getAttribute("LISTA_CLIENTE"); 
	
	if (listaCliente == null) {  
			listaCliente = new ArrayList<Cliente>(); 
	
		} else {  
			session.setAttribute("LISTA", null); 
		} 			   
			
		Cliente clienteAtual = (Cliente)session.getAttribute("CLIENTE_ATUAL"); 
	  
		if (clienteAtual == null) { 
			clienteAtual = new Cliente();  	
	   
		} else {  
		   session.setAttribute("CLIENTE_ATUAL", null);
		   
		} 
		
	if (msg != null) { 
		session.setAttribute("MENSAGEM", null); 
	%>	
	
	 		<div class="modal fade" id="modalAlert" aria-hidden="true" tabindex="-1" role="dialog">
 			<div class="modal-dialog">
 				<div class="modal-content">
 					<div class="modal-body">
 						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>&times;</span></button>
 						<p><%=msg %></p>
 					</div>
 				</div>
 			</div>
 		</div>
 		
	<%} %>
	
	<body>
		<header class="header">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	      		<a href="#" class="navbar-brand">
					<img src="imgs/sicone_logo.png" width="200" height="60" alt="Sicone">
				</a>
	      		<button class="navbar-toggler" data-toggler="collapse" data-target="#navbarMenu" role="button" 
	      			aria-haspopup="true" aria-expanded="false">
	        		<span clas="navbar-toggler-icon"></span>
	        	</button>
	      		<div class="collapse navbar-collapse" id="navbarMenu">
	        		<ul class="navbar-nav">
	          			<li class="nav-item"><a href="./fornecedor.jsp" class="nav-link">Fornecedores</a></li>
	          			<li class="nav-item"><a href="./cliente.jsp" class="nav-link">Clientes</a></li>
	          			<li class="nav-item"><a href="./funcionario.jsp" class="nav-link">Funcionários</a></li>
	        		</ul>
					<div class="container">
						<form class="form-inline" name="atualizar-cliente" action="./ClienteC" method="post">
						<button class="btn btn-sm btn-outline-secondary" type="submit" 
							name="cmd" value="atualizar" data-toggle="modal" data-target="#modalAlert">Atualizar</button>
						</form>
					</div>	        		
	      		</div>
	      		<div class="container text-center">
	      			<ul class="navbar-nav ml-md-auto">
			      		<nav class="nav-flex-column">
			      			<li class="nav-item dropdown">
			      				<a href="#" class="nav-item nav-link-dropdown-toggle" data-toggle="dropdown" 
			      					role="button" aria-haspopup="true" aria-expanded="false">
			      					<i class="fas fa-user-tie fas fa-stroopwafel fa-2x" style="color: #fff"></i>
			      				</a>
			      				<div class="dropdown-menu dropdown-menu-right">
		      						<a class="dropdown-item" href="#">Sair</a>
		      					</div>
		      					<div>
		      						<span class="navbar-text">Admin</span>
								</div>
							</li>
						</nav>
					</ul>
				</div>
			</nav>
	</header>
	
	<div class="container-fluid pt-4">
		
		<div class="row justify-content-around">
			<div class="col-7">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Nome</th>
							<th scope="col">CPF</th>
						</tr>
					</thead>
					<tbody>
					    <%if (listaCliente.size() > 0) {%>
							<%for (Cliente cliente : listaCliente) { %>
						<tr>
							<th scope="row"><%=cliente.getNome()%></th>
							<th scope="row"><%=cliente.getCpf()%></th>
						</tr>
							<%} %>
						<%}%>
					</tbody>
				</table>
			</div>
			
				<div class="col-md-4 col-sm-2">
					<form name="adicionar-cliente" action="./ClienteC" method="post">
						<div class="row">
							<div class="form-group w-50">
								<label for="txtCpf" class="form-label">CPF</label>
								<input class="form-control" type="text" name="txtCpf" id="txtCpf" required="required">
								<small id="cpfHelp" class="form-text text-muted text-gray">Digite apenas números</small>
								<div class="invalid-feedback">CPF inválido</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group w-75">
								<label for="txtNome" class="form-label">Nome</label>
								<input class="form-control" type="text" name="txtNome" id="txtNome" required="required">	
							</div>
						</div>
					<div class="row">
						<button type="submit" class="btn btn-outline-primary float-none mr-3" name="cmd" 
							value="adicionar" data-toggle="modal" data-target="#modalAlert">Adicionar</button>
					</div>
					</form>
					</div>
				</div>
			</div>

	</body>
</html>