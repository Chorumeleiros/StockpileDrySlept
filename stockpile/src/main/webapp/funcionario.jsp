<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Admin Dashboard</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" href="css/style-menu" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	
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
	          			<li class="nav-item"><a href="#" class="nav-link">Fornecedores</a></li>
	          			<li class="nav-item"><a href="#" class="nav-link">Clientes</a></li>
	          			<li class="nav-item"><a href="#" class="nav-link">Funcionários</a></li>
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
		      						<span class="navbar-text">Admin</span>
								</div>
							</li>
						</nav>
					</ul>
				</div>
			</nav>
	</header>
	
	<div class="container ml-3 pt-4">
		<div class="row">
			<div class="col mr-5 col-sm-8">
				<table class="table table-borderlass overflow-y: hidden">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Nome</th>
							<th scope="col">CPF</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">0001</th>
							<th scope="row">Jonas da Bigorna</th>
							<th scope="row">0123456789</th>
						</tr>
						<tr>
							<th scope="row">0002</th>
							<th scope="row">Xerone Milanes</th>
							<th scope="row">9876543210</th>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row ml-4">
				<div class="col pt-4">
					<form>
						<div class="form-group row text-right">
							<label for="ID" class="col-sm-2 col-form-label">ID</label>
								<div class="col">
									<input class="form-control w-75" type="text" placeholder="Próximo ID válido" readonly>
								</div>
						</div>
						<div class="form-group row">
							<label for="CPF" class="col-sm-2 col-form-label">CPF</label>
								<div class="col">
									<input class="form-control" type="text" placeholder="000.000.000-00">
								</div>
						</div>
						<div class="form-group row">
							<label for="Nome" class="col-sm-2 col-form-label">Nome</label>
								<div class="col">
									<input class="form-control" type="text" placeholder="Milis Davis?">
								</div>
						</div>
						<div>
							<button type="button" class="btn btn-outline-primary float-right">Adicionar</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	</body>

</html>