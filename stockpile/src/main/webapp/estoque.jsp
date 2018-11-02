<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Produto, sicone.model.Fornecedor, java.util.List, java.util.ArrayList"%> 
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
					message: 'Funcionário adicionado com sucesso!'
				}, {
					type: 'success'
				});
				return true
			}
		</script>
	</head>
	
	<body>
	
<%-- 		<%  --%>
// 		String msg = (String)session.getAttribute("MENSAGEM");
// 		List<Produto> listarProduto = (List<Produto>)session.getAttribute("LISTA");
			   
// 			if (listarProduto == null) { 
// 				listarProduto = new ArrayList<Produto>();
// 			} else { 
// 				session.setAttribute("LISTA", null);
// 			}
			   
// 			Produto produtoAtual = (Produto)session.getAttribute("PRODUTO_ATUAL");
			  
// 			if (produtoAtual == null) { 
// 			   produtoAtual = new Produto();
// 		   	} else { 
// 			   session.setAttribute("PRODUTO_ATUAL", null);			      
// 		   	}
			
// 			if (msg != null) {
// 				session.setAttribute("MENSAGEM", null);
			
<%-- 		%> --%>
		
<%-- 		<h3 class="alert alert-danger"><%=msg%></h3> --%>

<%-- 		<% } %> --%>
	
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
	          			<li class="nav-item"><a href="#" class="nav-link">Estoque</a></li>
	          			<li class="nav-item"><a href="#" class="nav-link">Pedidos</a></li>
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
		      						<span class="navbar-text">Funcionário</span>
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
<%-- 				<%if (listarProduto.size() > 0) {%> --%>
				<table class="table table-borderlass">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Código</th>
							<th scope="col">Nome</th>
							<th scope="col">Quantidade</th>
							<th scope="col">Descrição</th>
						</tr>
					</thead>
					<tbody>
<%-- 						<% for (Produto produto : listarProduto) { %> --%>
<!-- 						<tr> -->
<%-- 							<th scope="row"><%=produto.getCodigo()%></th> --%>
<%-- 							<th scope="row"><%=produto.getNome()%></th> --%>
<%-- 							<th scope="row"><%=produto.getQtd()%></th> --%>
<%-- 							<th scope="row"><%=produto.getDescr()%></th> --%>
<!-- 						</tr> -->
<%-- 						<% } %> --%>
					</tbody>
				</table>
			</div>
<%-- 			<%} %> --%>
			
				<div class="col-md-4 col-sm-2">
					<form name="adicionar-produto" action="./ProdutoC" method="post" onsubmit="return confirmacao()" class="needs-validation" novalidate>
						<div class="form-group w-25">
							<label for="codigo" class="form-label">Código</label>
							<input class="form-control" type="text" name="txtCod" id="codigo" readonly>
						</div>
						<div class="form-group w-25">
							<label for="quantidade" class="form-label">Quantidade</label>
							<input class="form-control" type="text" name="txtQtd" id="qtd" required="required">
						</div>
						<div class="form-group w-75">
							<label for="nome" class="form-label">Nome</label>
							<input class="form-control" type="text" name="txtNome" id="nome" required="required" />
							
						</div>
						<div class="form-group w-75">
							<label for="exampleFormControlTextarea1" class="form-label">Descrição</label>
							<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
							<small id="descrHelp" class="form-text text-muted text-gray">Máximo de 200 caracteres</small>	
						</div>
						<div class="form-group w-75">
							<label for="fornecedor" class="form-label">Fornecedor</label>
							<select class="form-control" required="required">
<%-- 								<%List<Fornecedor> listarFornecedor = (List<Fornecedor>)session.getAttribute("LISTA"); --%>
<%-- 								for (Fornecedor fornecedor : listarFornecedor) { %> --%>
<%--   								<option><%=fornecedor.getNome()%></option> --%>
<%--   								<% } %> --%>
							</select>
						</div>
						<div>
							<button type="button" class="btn btn-outline-primary float-none">Adicionar</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>

	</body>

</html>