<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Produto, sicone.model.Fornecedor, sicone.model.Funcionario, sicone.model.Cliente,
java.util.List, java.util.ArrayList"%> 
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
		<script src="js/bootstrap-notify.min.js" type="text/javascript"></script>
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
 		String msg = (String)session.getAttribute("MENSAGEM"); 
		
		@SuppressWarnings("unchecked")
 		List<Produto> listaItemProduto = (List<Produto>)session.getAttribute("LISTA"); 
			   
 			if (listaItemProduto == null) {  
 				listaItemProduto = new ArrayList<Produto>(); 
 			} else {  
 				session.setAttribute("LISTA", null); 
 			} 
			   
 			Produto produtoAtual = (Produto)session.getAttribute("PRODUTO_ATUAL");
		  
 			if (produtoAtual == null) {  
 			   produtoAtual = new Produto(); 
 		   	} else {  
 			   session.setAttribute("PRODUTO_ATUAL", null);			       
 		   	}
 			
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
		      						<span class="navbar-text">Funcionário</span>
								</div>
							</li>
						</nav>
					</ul>
				</div>
			</nav>
		</header>
	
	<div class="container-fluid pt-4">
		<div class="row pt-3 justify-content-around">
			<div class="col-6 pt-3">
  				<form name="pedido">
					<div class="form-row justify-content-start">
						<div class="form-inline col-md-6">
							<label class="sr-only" for="numPedido"></label>
  							<div class="input-group mb-2 mr-sm-2">
    							<div class="input-group-prepend">
      								<div class="input-group-text">Nº do Pedido</div>
    							</div>
    							<input type="text" class="form-control" id="numPedido" readonly>
  							</div>
						</div>
						<div class="form-inline col-md-4">
							<label class="sr-only" for="dataPedido"></label>
  							<div class="input-group mb-2 mr-sm-2">
    							<div class="input-group-prepend">
      								<div class="input-group-text">Data</div>
    							</div>
    							<input type="text" class="form-control" id="dataPedido" readonly>
  							</div>
						</div>
					</div>
	  			</form>
  			
				
				<div class="row pt-4">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">Código</th>
								<th scope="col">Item</th>
								<th scope="col">Quantidade</th>
							</tr>
						</thead>
						<tbody>
							<%if (listaItemProduto.size() > 0) {%>
							<% for (Produto produto : listaItemProduto) { %>
							<tr>
								<th scope="row"><%=produto.getCodigo()%></th>
								<th scope="row"><%=produto.getNome()%></th>
								<th scope="row"><%=produto.getQtd()%></th>
							</tr>
							<% } %>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
			
				<div class="col-md-4 pt-3 col-sm-2">
					<form name="novo-pedido" action="./PedidoC" method="post">
						<div class="form-row">
							<div class="input-group w-75">
								<select class="custom-select" id="txtCliente" name="txtCliente" required="required">
									<option selected>Selecione o cliente</option>
									<%if (listaCliente.size() > 0) {%>
									<%for (Cliente cliente : listaCliente) { %> 
  									<option><%=cliente.getNome()%></option>
  									<% } 
  								}%>
								</select>
								<div class="input-group-append">
				    				<button class="btn btn-outline-primary" name="cmd" value="novo-pedido" type="submit">Novo Pedido</button>
				  				</div>
							</div>
						</div>
					</form>
					<form name="buscar-produto" class="form-inline justify-content-start">
							<div class="form-row pt-5">
								<div class="form-group col-md-8">
									<select class="custom-select" id="txtCliente" name="txtCliente" placeholder="Item" required="required">
									<%if (listaItemProduto.size() > 0) {%>
									<%for (Produto produto : listaItemProduto) { %> 
  								<option><%=produto.getNome()%></option>
  									<% } 
  								}%>
								</select>
								</div>
								<div class="form-group col-md-4">
									<button type="button" class="btn btn-outline-primary ml-4">Pesquisar</button>
								</div>
							</div>
						</form>
						<form>
							<div class="form-row pt-3">
								<div class="form-group col-md-6">
									<label for="codigo" class="form-label">Código</label>
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
								<label for="exampleFormControlTextarea1" class="form-label">Descrição</label>
								<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly></textarea>	
							</div>
							<div>
								<button type="button" class="btn btn-outline-success float-none mr-4">Adicionar</button>
								<button type="button" class="btn btn-outline-warning float-none">Remover</button>
							</div>
							<div class="pt-5">
								<button type="button" class="btn btn-outline-primary float-none mr-4">Finalizar Pedido</button>
								<button type="button" class="btn btn-outline-danger float-none">Limpar Pedido</button>
							</div>
						</form>
				</div>
			</div>
		</div>

	</body>

</html>