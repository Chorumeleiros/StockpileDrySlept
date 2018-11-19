<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Funcionario, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SICONE | Admin Dashboard - FUNCIONARIOS</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"	href="css/style-menu" />
		<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.mask.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		
		<script type="text/javascript">
	 	$(document).ready(function() {
	 		$('#txtCpf').mask('000.000.000-00');
	 	})
		</script>
</head>

<body>
	<%
	String msg = (String) session.getAttribute("MENSAGEM"); 
	
	@SuppressWarnings("unchecked")
	List<Funcionario> listaFuncionario = (List<Funcionario>) session.getAttribute("LISTA_FUNCIONARIO");
	
	if (listaFuncionario == null) {
		listaFuncionario = new ArrayList<Funcionario>();
	} else {
		session.setAttribute("LISTA_FUNCIONARIO", null);
	}
	Funcionario funcionarioAtual = (Funcionario)session.getAttribute("FUNCIONARIO_ATUAL"); 
	  
		if (funcionarioAtual == null) { 
			funcionarioAtual = new Funcionario();  	
	   
		} else {  
		   session.setAttribute("FUNCIONARIO_ATUAL", null);
		   
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
 		
	<header class="header"> 
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark"> 
			<a href="#" class="navbar-brand"><img src="imgs/sicone_logo.png" width="200" height="60" alt="Sicone"></a>
			<button class="navbar-toggler" data-toggler="collapse" data-target="#navbarMenu" role="button" aria-haspopup="true" aria-expanded="false">
				<span clas="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarMenu">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="./fornecedor.jsp" class="nav-link">Fornecedores</a></li>
					<li class="nav-item"><a href="./cliente.jsp" class="nav-link">Clientes</a></li>
					<li class="nav-item"><a href="./funcionario.jsp" class="nav-link">Funcionários</a></li>
				</ul>
			</div>
			<div class="container text-center">
				<ul class="navbar-nav ml-md-auto">
					<nav class="nav-flex-column">
						<li class="nav-item dropdown">
							<a href="#" class="nav-item nav-link-dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
								<i	class="fas fa-user-tie fas fa-stroopwafel fa-2x" style="color: #fff"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<form action="./Logout" method="post">
		      						<a class="dropdown-item" name="cmd" value="sair" href="#">Sair</a>
		      					</form>
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
							<th scope="col">ID</th>
							<th scope="col">Nome</th>
							<th scope="col">CPF</th>
							<th scope="col">Senha</th>
						</tr>
					</thead>
					<tbody>
						<%if (listaFuncionario.size() > 0) {%>
						<% for (Funcionario funcionario : listaFuncionario) {
						%>
						<tr>
							<th scope="row"><%=funcionario.getId()%></th>
							<th scope="row"><%=funcionario.getNome()%></th>
							<th scope="row"><%=funcionario.getCpf()%></th>
							<th scope="row"><%=funcionario.getPassword()%></th>
						</tr>
							<%}
						}
						%>
					</tbody>
				</table>
			</div>
			
			<div class="col-md-4 col-sm-2">
				<form name="adicionar-funcionario" action="./FuncionarioC" method="post">
					<div class="row">
						<div class="form-group w-25">
							<label for="id" class="form-label">ID</label>
							<input class="form-control" type="text" value="<%=listaFuncionario.size() + 1%>" id="id" readonly>
						</div>
					</div>
					<div class="row">
						<div class="form-group w-75">
							<label for="nome" class="form-label">Nome</label>
							 <input	class="form-control" type="text" id="nome" required="required" name="txtNome" required="required">
						</div>
					</div>
					<div class="row">
						<div class="form-group w-50">
							<label for="cpf" class="form-label">CPF</label>
							<input class="form-control" type="text" name="txtCpf" id="txtCpf" required="required">
							<small id="cpfHelp" class="form-text text-muted text-gray">Digite apenas números</small>
							<div class="invalid-feedback">CPF inválido</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group w-50">
							<label for="senha" class="form-label">Senha</label> 
							<input class="form-control" type="password" name="txtSenha" id="senha" required="required">
						</div>
					</div>
				</form>
					<div class="row">
						<form name="adicionar-funcionario" action="./FuncionarioC" method="post">
							<button type="submit" class="btn btn-outline-primary float-none mr-3" name="cmd" value="adicionar" data-toggle="modal" data-target="#modalAlert">Adicionar</button>
						</form>
						<form name="atualizar-funcionario" action="./FuncionarioC" method="post">
							<button type="submit" class="btn btn-outline-primary float-none" name="cmd" value="atualizar" data-toggle="modal" data-target="#modalAlert">Atualizar</button>
						</form>
					</div>
			</div>
		</div>
	</div>
	
</body>

</html>