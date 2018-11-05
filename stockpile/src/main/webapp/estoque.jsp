<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Produto, sicone.model.Fornecedor, sicone.model.Funcionario, java.util.List, java.util.ArrayList"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SICONE | Estoque</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" href="css/style-menu" />
		<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.mask.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/bootstrap-notify.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
			
		<script type="text/javascript">
			function confirmacao() {
				$.notify({
					message: 'Funcion�rio adicionado com sucesso!'
				}, {
					type: 'success'
				});
				return true
			}
		</script>
	</head>
	
	<body>
	
	<% 
 		String msg = (String)session.getAttribute("MENSAGEM"); 
 		List<Produto> listarProduto = (List<Produto>)session.getAttribute("LISTA_PROD"); 
//  		List<Fornecedor> listarFornecedor = (List<Fornecedor>)session.getAttribute("LISTA_FORN");
			   
 			if (listarProduto == null) {  
 				listarProduto = new ArrayList<Produto>(); 
 			} else {  
 				session.setAttribute("LISTA", null); 
 			} 
			   
 			Produto produtoAtual = (Produto)session.getAttribute("PRODUTO_ATUAL"); 
			  
 			if (produtoAtual == null) { 
 			   produtoAtual = new Produto(); 
 		   	} else {  
 			   session.setAttribute("PRODUTO_ATUAL", null);			       
 		   	} 
			
			if (msg != null) { 
			session.setAttribute("MENSAGEM", null); 
			
 	%>
		<h3 class="alert alert-danger"><%=msg%></h3>

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
		      						<a class="dropdown-item" href="#">Sair</a>
		      					</div>
		      					<div>
		      						<span class="navbar-text">Funcion�rio</span>
								</div>
							</li>
						</nav>
					</ul>
				</div>
			</nav>
	</header>
	<%if (listarProduto.size() > 0) {%>
	<div class="container-fluid pt-4">
		<div class="row justify-content-around">
			<div class="col-7 pt-3">
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
						
						<% for (Produto produto : listarProduto) { %>
						<tr>
							<th scope="row"><%=produto.getCodigo()%></th>
							<th scope="row"><%=produto.getNome()%></th>
							<th scope="row"><%=produto.getQtd()%></th>
							<th scope="row"><%=produto.getDescr()%></th>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
					<%} %>
			
				<div class="col-md-4 col-sm-2">
					<form name="adicionar-produto" action="./ProdutoC" method="post" onsubmit="return confirmacao()" class="needs-validation" novalidate>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="codigo" class="form-label">C�digo</label>
								<input class="form-control w-75" type="text" name="txtCodigo" id="codigo" value="<%=produtoAtual.getCodigo()%>" readonly>
							</div>
						<div class="form-group col-md-6">
							<label for="quantidade" class="form-label">Quantidade</label>
							<input class="form-control w-50" type="text" name="txtQtd" id="qtd" value="<%=produtoAtual.getQtd()%>" required="required">
						</div>
						</div>
						<div class="form-group w-75">
							<label for="nome" class="form-label">Item</label>
							<input class="form-control" type="text" name="txtNome" id="nome" value="<%=produtoAtual.getNome()%>" required="required" />
						</div>
						<div class="form-group w-75">
							<label for="exampleFormControlTextarea1" class="form-label">Descri��o</label>
							<textarea class="form-control" name="txtDescr" id="exampleFormControlTextarea1" value="<%=produtoAtual.getDescr()%>" rows="3"></textarea>
							<small id="descrHelp" class="form-text text-muted text-gray">M�ximo de 200 caracteres</small>	
						</div>
						<div class="form-group w-75">
							<label for="fornecedor" class="form-label">Fornecedor</label>
							<select class="custom-select">
<%-- 								<%for (Fornecedor fornecedor : listarFornecedor) { %>  --%>
<%--   								<option><%=fornecedor.getNome()%></option> --%>
<%--   								<% } %> --%>
							</select>
						</div>
						<div>
							<%if (produtoAtual.getCodigo() == 0) { %>
							<button type="button" class="btn btn-outline-primary float-none" name="cmd" value="adicionar">Adicionar</button>
							<%} %>
						</div>
					</form>
					<div class="row-md-4 pt-5">
						<form name="buscar-produto" class="form-inline">
							<div class="form-row">
								<div class="form-group col-md-8">
									<input class="form-control" type="text" name="txtNome" id="nome" placeholder="Item">
								</div>
								<div class="form-group col-md-4">
									<button type="button" class="btn btn-outline-primary ml-4">Pesquisar</button>
								</div>
							</div>
						</form>
						<form>
							<div class="form-row pt-3">
								<div class="form-group col-md-6">
									<label for="codigo" class="form-label">C�digo</label>
									<input class="form-control w-75" type="text" name="txtCod" id="codigo" readonly>
								</div>
								<div class="form-group col-md-6">
									<label for="quantidade" class="form-label">Quantidade</label>
									<input class="form-control w-50" type="text" name="txtQtd" id="qtd" readonly>
								</div>
							</div>
							<div class="form-group w-75">
								<label for="nome" class="form-label">Item</label>
								<input class="form-control" type="text" name="txtNome" id="nome" readonly>
							</div>
							<div class="form-group w-75">
								<label for="exampleFormControlTextarea1" class="form-label">Descri��o</label>
								<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly></textarea>	
							</div>
							<div class="form-group w-75">
								<label for="fornecedor" class="form-label">Fornecedor</label>
								<input class="form-control" type="text" name="txtFornecedor" id="fornecedor" readonly>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</body>

</html>