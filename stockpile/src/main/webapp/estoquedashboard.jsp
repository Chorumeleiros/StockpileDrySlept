<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard Estoque</title>
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" href="css/style-menu" />
<link rel="stylesheet" 	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"	crossorigin="anonymous">
</head>
<body>
	<header class="header"> 
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark"> 
	<a href="#"class="navbar-brand"> 
	<img src="imgs/sicone_logo.png" width="200"height="60" alt="Sicone">
	</a>
	<button class="navbar-toggler" data-toggler="collapse" 	data-target="#navbarMenu" role="button" aria-haspopup="true"aria-expanded="false">
		<span clas="navbar-toggler-icon">
		</span>
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
			<li class="nav-item dropdown"><a href="#"
				class="nav-item nav-link-dropdown-toggle" data-toggle="dropdown"
				role="button" aria-haspopup="true" aria-expanded="false"> <i
					class="fas fa-user-tie fas fa-stroopwafel fa-2x"
					style="color: #fff"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" href="#">Sair</a>
				</div>
				<div>
					<span class="navbar-text">Funcionario</span>
				</div></li>
			</nav>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
	
		<div class="form-group">
			<label for="txtCodigo">Codigo</label> <input type="text"
				class="form-control" id="txtCodigo" name="txCodigo" readonly />
		</div>
		<div class="form-group">
			<label for="txtCnpj">Item</label> <input type="text"
				class="form-control" id="txtitem" name="txitem"  />
		</div>
		<div class="form-group">
			<label for="txtNome">Quantidade</label> <input type="text"
				class="form-control" id="txtQtd" name="txtQtd"  />
		</div>
		<div class="form-group">
    			<label for="txtTipo">Fornecedor</label>
    			<select class="form-control" id="txtFornecedor" name="txtForn">
      				<option value="Fornecedor"> </option>
      				</select>
		</div>
		<div class="container">
			<table class="table table-striped">
				<tbody>
<%-- 					<% for () { %> --%>
<!-- 					<tr> -->
<%-- 						<td><%=s.getCodigo()%></td> --%>
<%-- 						<td><%=s.getItem()%></td> --%>
<%-- 						<td><%=s.getQuantidade()%></td> --%>
						
<!-- 					</tr> -->
<%-- 					<% } %> --%>
				</tbody>
			</table>
</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary" name="cmd"
				value="incluir">Incluir</button>
			<button type="submit" class="btn btn-primary" name="cmd"
				value="pesquisar">Pesquisar</button>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"crossorigin="anonymous"></script>

<body>
</html>