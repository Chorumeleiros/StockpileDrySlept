<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sicone.model.Produto, sicone.model.Fornecedor, sicone.model.Funcionario, sicone.model.Cliente, 
sicone.model.Pedido, java.util.List, java.util.ArrayList"%> 
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
			
			$('#txtCliente').html("<option value='nomeCliente'></option>");
			
			blockSelect()
			
			function remover(id) {
				if (confirm("Remove o sorvete com id " + id)) {
					$('#novo-pedido').empty();
					$('#novo-pedido').append('<input type="hidden" name="txtId" value="' + id + '"/>');
					$('#novo-pedido').append('<input type="hidden" name="cmd" value="remover"/>');
					$('#novo-pedido').submit();
				}
			}
		</script>
	</head>
	
	<body>
	
		<% 
		Pedido pedido = new Pedido();
		Funcionario funcionario = new Funcionario(); 
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
			      					<form action="./Logout" method="post">
		      							<a class="dropdown-item" name="cmd" value="sair" href="#">Sair</a>
		      						</form>
		      					</div>
		      					<div>
		      						<span class="navbar-text"><%=funcionario.getNome() %></span>
								</div>
							</li>
						</nav>
					</ul>
				</div>
			</nav>
		</header>
	
	<div class="container-fluid pt-4">
		<div class="row justify-content-around">
			<div class="col-6">
				<div class="row pt-3">
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
								<%for (Produto produto : listaItemProduto) { %>
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
								<select class="custom-select" required="required">
									<option selected>Selecione o cliente</option>
									<%if (listaCliente.size() > 0) {%>
										<%for (Cliente cliente : listaCliente) { %> 
  									<option name="nomeCliente" value="nomeCliente"><%=cliente.getNome()%></option>
  										<% } 
  									}%>
								</select>
								<div class="input-group-append">
				    				<button class="btn btn-outline-primary" name="cmd" value="novo-pedido" type="submit">Novo Pedido</button>
				  				</div>
							</div>
						</div>
						<div class="form-row pt-4">	
  							<div class="input-group w-75">
    							<div class="input-group-prepend">
      								<div class="input-group-text">Nº do Pedido</div>
    							</div>
    							<input type="text" class="form-control" name="numPedido" id="numPedido" value="<%=pedido.getNumPedido()%>" readonly>
  							</div>
  						</div>
						<div class="form-row pt-3">
  							<div class="input-group w-50">
    							<div class="input-group-prepend">
      								<div class="input-group-text">Data</div>
    							</div>
    							<input type="text" class="form-control" name="dataPedido" id="dataPedido" value="<%=pedido.getDataPedido()%>" readonly>
  							</div>
						</div>
	
	  			</form>
						<form name="novo-pedido" id="novo-pedido" action="./PedidoC" method="post">
							<div class="form-row pt-5 w-75">
								<div class="input-group">
									<div class="input-group-prepend">
										<label class="input-group-text" for="txtItem">Item</label>
									</div>
									<select class="custom-select" required="required">
										<option selected> </option>
										<%if (listaItemProduto.size() > 0) {%>
										<%for (Produto produto : listaItemProduto) { %> 
	  									<option name="item" value="item"><%=produto.getNome()%></option>
	  										<% } 
	  									}%>
									</select>
								</div>
							</div>
							<div class="form-row pt-3 w-50">
								<div class="input-group">
									<div class="input-group-prepend">
										<label class="input-group-text" for="txtQtd">Quantidade</label>
									</div>
									<select class="custom-select" required="required">
										<option selected> </option>
										<%if (listaItemProduto.size() > 0) {%>
										<%for (Produto produto : listaItemProduto) { %> 
	  									<option name="qtd" value="qtd"><%=produto.getQtd()%></option>
	  										<% } 
	  									}%>
									</select>
								</div>
							</div>
							<div class="pt-4">
								<button type="submit" class="btn btn-outline-success float-none mr-4">Adicionar</button>
								<button type="submit" class="btn btn-outline-warning float-none">Remover</button>
							</div>
							<div class="pt-5">
								<button type="submit" class="btn btn-outline-primary float-none mr-4">Finalizar Pedido</button>
								<button type="submit" class="btn btn-outline-danger float-none">Limpar Pedido</button>
							</div>
						</form>
				</div>
			</div>
		</div>

	</body>

</html>