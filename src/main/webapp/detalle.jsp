<%@page import="modelo.CategoriasModel"%>
<%@page import="entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/styleU.css">
<link rel="stylesheet" href="css/carrito.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=LXGW+WenKai+TC&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	referrerpolicy="no-referrer" />
<style>
.carrito-icono {
    position: relative;
    display: inline-block;
}

.badge {
    position: absolute;
    top: -8px;
    right: -8px; 
    background-color: red; 
    color: white;
    border-radius: 50%; 
    width: 20px;
    height: 20px;
    font-size: 12px; 
    text-align: center;
    line-height: 15px;
}
</style>
</head>
<body style="background-color: #e3e9f7;">
<div class="header-container">
		<header>
			<div class="logo">
				<img src="img/logo.png" alt="">
				<h1>Ricón Literario</h1>
			</div>
			<input type="checkbox" id="nav_check" hidden>
			<nav>
				<ul>
					<li><a href="Index.jsp">Inicio</a>
						<ul class="opciones">
							<li><a href="Index.jsp#lib01">Populares</a></li>
							<li><a href="Index.jsp#lib02">Infantiles</a></li>
							<li><a href="Index.jsp#lib03">Juveniles</a></li>
							<li><a href="Index.jsp#lib04">Categorías</a></li>
						</ul></li>

						<%
				List<Categorias> lstCategorias = new CategoriasModel().ListCategorias();
				
				request.setAttribute("lstCategorias", lstCategorias);
				%>
					<li><a href="filtro?editorial=0">Catálogo</a>
						<ul class="opciones">
						<c:forEach items="${lstCategorias}" var="c">
							<li><a href="filtroC?categoria=${c.IDCategoria }">${c.nombreCategoria }</a></li>
						</c:forEach>
						</ul></li>
					<li><a href="canasta.jsp">Entrega 
						<div class="carrito-icono">
							<img src="img/carritoLogo.png" alt="Carrito de compras"
								style="width: 20px; height: 20px; margin-left: 5px;">
							<!-- Aquí mostraremos el número de artículos en el carrito -->
							<div class="badge">${cantArticulos}</div>
						</div>
						</a>
						
					</li>
					<li><a href="contacto.jsp">Contacto</a></li>

					<li><a href="#" class="active"> <img src="img/usuario.png"
							alt=""></a>
						<ul class="opciones">
							<c:if test="${c != null }">
								<li class="navbar-toggler" type="button"><a href="modificar.jsp">Perfil</a> </li>
							</c:if>
							<c:if test="${c == null }">
								<li class="navbar-toggler" type="button"><a href="loginUsuario.jsp">Ingresar</a></li>
							</c:if>
							<li><a href="salir"><img
									src="img/salida.png" alt=""></a></li>
						</ul></li>
				</ul>
			</nav>

			<label for="nav_check" class="hamburger">
				<div></div>
				<div></div>
				<div></div>
			</label>
		</header>
	</div>
	<!-- ------------------------------------------------------------------------- -->
	<div class="container" style="background-color: white; border-radius:2%; height:10%; margin-top:20px; padding-top:10px; padding-bottom:10px; display: flex;">
		<div id="carouselBooks" class="carousel-books carousel slide"
			data-bs-ride="false">
			<div class="carousel-inner carousel-inner-books">
				<div class="carousel-item-books active">
					<c:if test="${l.stock > 0 }">
					<div class="card">
						<img style="width:90%" src="img/libros/${l.ISBN}.webp" class="card-img-top" alt="Libro 1">
					</div>
					</c:if>
					<c:if test="${l.stock == 0 }">
					<div class="card">
						<img style="opacity: 0.5; width:90%" src="img/libros/${l.ISBN}.webp" class="card-img-top" alt="Libro 1">
					</div>
					</c:if>
				</div>
			</div>
			</div>
			<div class="container">
			<h1>${l.titulo }</h1> <br>
			<p>${l.resenia }</p>
			<br><br>
			<form action="agregar" method="post" class="row g-3">
							
						<div>
								<label for="inputPre" class="col">Precio:</label>
								<label for="inputPre" class="col">${l.precio}</label>
							</div>
							<div >
								<label for="inputCan" class="col">Cantidad:</label>
								<div class="col">
									<input type="number" id="inputCan" name="cantidad" 
										class="form-control" min="1" max="${l.stock }" 
										placeholder="0" required>
									<div id="emailHelp" class="form-text">Stock máx. ${l.stock } unidades</div>
								</div>
								<div>
								<c:if test="${l.stock > 0 }">
								<button type="submit" class="btn btn-primary">
									Agregar al carro <i class="fas fa-shopping-cart"></i>
								</button>
								</c:if>
								<c:if test="${l.stock == 0 }">
								<button type="submit" class="btn btn-danger">
									Agregar al carro <i class="fas fa-shopping-cart"></i>
								</button>
								</c:if>
								</div>
								 <c:if test="${l.stock == 0 }">
								<div><a href="filtro?editorial=0">Volver al catalogo</a></div>
								 </c:if>
			</div>
			</form>
			</div>
			</div>
				
			
		
			
			<!------------------------------------------------------PIE-------------------------------------------------------------->


	<footer style="color: #fff; background-color: #1B2631;" id="Pie";>
		<hr>
		<div class="container__footer">


			<div class="box__footer">
				<h2>Contacto:</h2>
				<a href="https://wa.me/+51936927488" target="_blank"
					style="color: #FDFEFE;" onmouseover="this.style.color='#A9CCE3';"
					onmouseout="this.style.color='#FDFEFE';"> 936927488</a> <a
					href="https://wa.me/+51991280416" target="_blank"
					style="color: #FDFEFE;" onmouseover="this.style.color='#A9CCE3';"
					onmouseout="this.style.color='#FDFEFE';"> 991280416</a> <br>

			</div>

			<div class="box__footer">
				<h2>Compañía:</h2>
				<a href="https://pe.computrabajo.com" target="_blank"
					style="color: #FDFEFE;" onmouseover="this.style.color='#A9CCE3';"
					onmouseout="this.style.color='#FDFEFE';"> Acerca de Trabajo</a> <a
					href="https://pe.computrabajo.com" target="_blank"
					style="color: #FDFEFE;" onmouseover="this.style.color='#A9CCE3';"
					onmouseout="this.style.color='#FDFEFE';"> Servicio</a>
			</div>

			<div class="box__footer">
				<h2>Redes Sociales:</h2>
				<a href="https://www.facebook.com/steve.shavier.1" target="_blank"
					style="color: #ffffff;" onmouseover="this.style.color='#A9CCE3';"
					onmouseout="this.style.color='#ffffff';"><i
					class="fa-brands fa-facebook"></i> Facebook</a> <a
					href="https://www.instagram.com/takis_peru/" target="_blank"
					style="color: #ffffff;" onmouseover="this.style.color='#A9CCE3';"
					onmouseout="this.style.color='#ffffff';"><i
					class="fa-brands fa-instagram"></i> Instagram</a> <a
					href="https://twitter.com/hrenzo27" target="_blank"
					style="color: #ffffff;" onmouseover="this.style.color='#A9CCE3';"
					onmouseout="this.style.color='#ffffff';"><i
					class="fa-brands fa-twitter"></i> Twitter</a>


			</div>
		</div>
		<hr>
		<div class="box__copyright">
			<br> <br>
			<div class="terms">
				<h2>Experiencias formativas de trabajo II</h2>
				<p>© 2024 Todos los derechos reservados | Experiencias
					formativas de trabajo II</p>
			</div>
			<br> <br>
		</div>

	</footer>











	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>