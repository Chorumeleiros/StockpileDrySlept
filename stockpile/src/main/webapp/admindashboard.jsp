<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Admin Dashboard</title>
		<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
			<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
			<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
			integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
			<link rel="stylesheet" type="text/css" href="css/style-admindashboard.css" />
			
	</head>
	
	<body>
		<header class="header">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	      		<a href="#" class="navbar-brand">
					<img src="imgs/sicone_logo.png" width="200" height="60" alt="Sicone">
				</a>
	      		<div class="collapse navbar-collapse" id="navbarMenu">
	        		<ul class="navbar-nav">
	          			<li class="nav-item"><a href="#" class="nav-link">Fornecedores</a></li>
	          			<li class="nav-item"><a href="#" class="nav-link">Clientes</a></li>
	          			<li class="nav-item"><a href="#" class="nav-link">Funcion�rios</a></li>
	          			<li class="nav-item"><a href="#" class="nav-link">Estoque</a></li>
	        		</ul>
	      		</div>
	      		<div class="container text-center">
	      			<ul class="navbar-nav ml-auto">
			      		<nav class="nav-flex-column">
			      			<li class="nav-item dropdown" id="iddrop">
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
	  
	  <div class="container ml-0 position-fixed" id="cardoptions">
		  <div class="card text-white bg-dark mb-3 mt-3" style="width: 18rem;">
		  	  <div class="card-body text-center">
				  <a href="#"><i class="fas fa-briefcase fa-5x" style="color: #fff"></i></a>
				  <p class="card-text">Fornecedores</p>
		  	  </div>
		  </div>
		  <div class="card text-white bg-dark mb-3" style="width: 18rem;">
		  	  <div class="card-body text-center">
				  <a href="#"><i class="fas fa-users fa-5x" style="color: #fff"></i></a>
				  <p class="card-text">Clientes</p>
		  	  </div>
		  </div>
		  <div class="card text-white bg-dark mb-3" style="width: 18rem;">
		  	  <div class="card-body text-center">
				  <a href="#"><i class="far fa-id-badge fa-5x" style="color: #fff"></i></a>
				  <p class="card-text">Funcion�rios</p>
		  	  </div>
		  </div>
		  <div class="card text-white bg-dark mb-3" style="width: 18rem;">
		  	  <div class="card-body text-center">
				  <a href="#"><i class="fas fa-archive fa-5x" style="color: #fff"></i></a>
				  <p class="card-text">Estoque</p>
		  	  </div>
		  </div>
	  </div>

	  
	</body>
</html>