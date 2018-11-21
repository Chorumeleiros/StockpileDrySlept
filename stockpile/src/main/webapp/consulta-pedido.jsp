<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Produto, sicone.model.Fornecedor, sicone.model.Funcionario, 
sicone.model.UserInfo, java.util.List, java.util.ArrayList"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SICONE | Pedido</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" href="css/style-menu" />
		<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.mask.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
			
		<script type="text/javascript">
			$(document).ready(function(){
				$('#dataPedido').mask('00/00/0000');
			})
		
		</script>
	</head>
	
	<body>
	
		<% 		
		UserInfo funcionarioLogado = (UserInfo)session.getAttribute("FUNCIONARIO_LOGADO");
		
		if (funcionarioLogado == null) {
			funcionarioLogado = new UserInfo();
		
		}
		
 		String msg = (String)session.getAttribute("MENSAGEM");
 		
 		@SuppressWarnings("unchecked")
 		List<Produto> listarProduto = (List<Produto>)session.getAttribute("LISTA"); 
			   
 			if (listarProduto == null) {  
 				listarProduto = new ArrayList<Produto>(); 
 			}
		   
 			Produto produtoAtual = (Produto)session.getAttribute("PRODUTO_ATUAL"); 
			  
 			if (produtoAtual == null) {  
 			   produtoAtual = new Produto(); 
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

		<% } %>
	
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
	          			<li class="nav-item"><a href="./estoque.jsp" class="nav-link">Estoque</a></li>
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
		      						<a class="dropdown-item" name="cmd" value="sair" href="./logout.jsp">Sair</a>
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
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Nº do Pedido</th>
							<th scope="col">Cliente</th>
							<th scope="col">Data</th>
						</tr>
					</thead>
					<tbody>
						<%if (listarProduto.size() > 0) {%>
						<% for (Produto produto : listarProduto) { %>
						<tr>
							<th scope="row"><%=produto.getCodigo()%></th>
							<th scope="row"><%=produto.getNome()%></th>
							<th scope="row"><%=produto.getQtd()%></th>
						</tr>
						<% } %>
						<%} %>
					</tbody>
				</table>
			</div>
			
			
				<div class="col-md-4 pt-3 col-sm-2">
					<form name="buscar-produto" action="./PedidoC" method="post" class="form-inline justify-content-start">
						<div class="form-row">
							<div class="form-group col-md-8">
								<input class="form-control" type="text" name="txtNumPedido" id="numPedido" placeholder="Nº do Pedido">
							</div>
							<div class="form-group col-md-4">
								<button type="submit" class="btn btn-outline-primary ml-4">Pesquisar</button>
							</div>
						</div>
					</form>
					<form>
						<div class="form-row pt-3">
							<div class="form-group col-md-6">
								<label for="codigo" class="form-label">Cliente</label>
								<input class="form-control" type="text" name="txtCod" id="codigo" readonly>
							</div>								
							<div class="form-group col-md-6">
								<label for="quantidade" class="form-label">Data</label>
								<input class="form-control w-50" type="text" name="dataPedido" id="qtd" readonly>
							</div>
						</div>
					</form>
					<div class="w-75 pt-4">
						<table class="table table-hover">
							<thead>
								
								<tr>
									<th scope="col">Cód</th>
									<th scope="col">Item</th>
									<th scope="col">Qtd</th>
								</tr>
							</thead>
							<tbody>
								<%if (listarProduto.size() > 0) {%>
								<% for (Produto produto : listarProduto) { %>
								<tr>
									<th scope="row"><%=produto.getCodigo()%></th>
									<th scope="row"><%=produto.getNome()%></th>
									<th scope="row"><%=produto.getQtd()%></th>
								</tr>
								<% } %>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

	</body>

</html>