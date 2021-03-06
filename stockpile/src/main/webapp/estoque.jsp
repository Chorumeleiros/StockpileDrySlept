<%@page import="sicone.dao.FuncionarioDAOImpl"%>
<%@page import="sicone.model.Funcionario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Produto, sicone.model.Fornecedor, sicone.model.UserInfo, java.util.List, java.util.ArrayList"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SICONE | Estoque</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" href="css/style-menu" />
		<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		
	</head>
	
	<body>
	
	<% 
	
	UserInfo funcionarioLogado = (UserInfo)session.getAttribute("FUNCIONARIO_LOGADO");
	
	if (funcionarioLogado == null) {
		funcionarioLogado = new UserInfo();
	
	}
	String msg = (String)session.getAttribute("MENSAGEM");

	
	@SuppressWarnings("unchecked")
 	List<Produto> listaProduto = (List<Produto>)session.getAttribute("LISTA_PROD");
	
	if (listaProduto == null) {  
			listaProduto = new ArrayList<Produto>(); 
	}
	@SuppressWarnings("unchecked")
	List<Fornecedor> listaFornecedor = (List<Fornecedor>)session.getAttribute("LISTA_FORNECEDOR");
 		
 		if (listaFornecedor == null) {  
 			listaFornecedor = new ArrayList<Fornecedor>(); 

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
	      		<a href="#" class="navbar-brand">
					<img src="imgs/sicone_logo.png" width="200" height="60" alt="Sicone">
				</a>
	      		<button class="navbar-toggler" data-toggler="collapse" data-target="#navbarMenu" role="button" 
	      			aria-haspopup="true" aria-expanded="false">
	        		<span clas="navbar-toggler-icon"></span>
	        	</button>
	      		<div class="collapse navbar-collapse" id="navbarMenu">
	        		<ul class="navbar-nav">
	          			<li class="nav-item"><a href="./estoque.jsp" class="nav-link" style="color:#FF6347;">Estoque</a></li>
	          			<li class="nav-item dropdown">
							<a class="nav-link" data-toggle="dropdown" href="#" role="button" 
								aria-haspopup="true" aria-expanded="false">Pedidos
							</a>
						    <div class="dropdown-menu">
						    	<a class="dropdown-item" href="./novo-pedido.jsp">Novo</a>
						    	<a class="dropdown-item" href="./consulta-pedido.jsp">Consultar</a>
							</div>
						</li>
	        		</ul>
						        		
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
			      					<form action="./Logout" method="post">
		      							<a class="dropdown-item" name="cmd" value="sair" href="./logout.jsp">Sair</a>
		      						</form>
		      					</div>
		      					<div>
		      						<span class="navbar-text"><%=funcionarioLogado.getProfile() %></span>
								</div>
							</li>
						</nav>
					</ul>
				</div>
			</nav>
	</header>
	
	<div class="container-fluid pt-4">
		<div class="row justify-content-around">
			<div class="col-7 pt-3">
			<h4>LISTA DE PRODUTOS</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">C�digo</th>
							<th scope="col">Item</th>
							<th scope="col">Quantidade</th>
							<th scope="col">Descri��o</th>
							
						</tr>
					</thead>
					<tbody>	
						<tr>
						<%if (listaProduto.size() > 0) {%>
							<% for (Produto produto : listaProduto) { %>
							<th scope="row"><%=produto.getCodigo()%></th>
							<th scope="row"><%=produto.getNome()%></th>
							<th scope="row"><%=produto.getQtd()%></th>
							<th scope="row"><%=produto.getDescr()%></th>
						</tr>
							<% } %>
						<%} %>
					</tbody>
				</table>
			</div>
				<div class="col-md-4 col-sm-2">
					<form name="adicionar-produto" action="./ProdutoC" method="post">
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="txtCodigo" class="form-label">C�digo</label>
								<input class="form-control w-75" type="text" name="txtCodigo" id="txtCodigo" value="<%=listaProduto.size() + 1%>" readonly>
							</div>
						<div class="form-group col-md-6">
							<label for="txtQtd" class="form-label">Quantidade</label>
							<input class="form-control w-50" type="text" name="txtQtd" id="txtQtd" required="required">
						</div>
						</div>
						<div class="form-group w-75">
							<label for="txtNome" class="form-label">Item</label>
							<input class="form-control" type="text" name="txtNome" id="txtNome" required="required" />
						</div>
						<div class="form-group w-75">
							<label for="txtDescr" class="form-label">Descri��o</label>
							<textarea class="form-control" name="txtDescr" id="txtDescr" rows="3"></textarea>
							<small id="descrHelp" class="form-text text-muted text-gray">M�ximo de 200 caracteres</small>	
						</div>
						<div class="form-group w-75">
							<label for="txtFornecedor" class="form-label">Fornecedor</label>
							<select class="custom-select">
								<option selected>Selecione</option>
								<%if (listaFornecedor.size() > 0) {%>
									<%for (Fornecedor fornecedor : listaFornecedor) { %> 
  								<option name="txtFornecedor" value="txtFornecedor"><%=fornecedor.getNome()%></option>
  									<% } 
  								}%>
							</select>
							
						</div>
						<div>
							
							<button type="submit" class="btn btn-outline-primary float-none" name="cmd" value="adicionar" data-toggle="modal" data-target="#modalAlert">Adicionar</button>
						</div>
					</form>
					<div class="row-md-4 pt-5">
						<form name="buscar-produto" action="./ProdutoC" method="post" class="form-inline">
							<div class="form-row">
								<div class="form-group col-md-8">
									<input class="form-control" type="text" name="txtNome" id="txtNome" placeholder="Item">
								</div>
								<div class="form-group col-md-4">
									<button type="submit" class="btn btn-outline-primary ml-4" name="cmd" value="pesquisar">Pesquisar</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>