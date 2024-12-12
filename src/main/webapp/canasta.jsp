<%@page import="modelo.CategoriasModel"%>
<%@page import="entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Canasta</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/styleU.css">
<link rel="stylesheet" href="css/carrito.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- CSS Bootstrap -->
<link
	href="https://fonts.googleapis.com/css2?family=LXGW+WenKai+TC&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- CSS Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
<body style="background-color: white;">
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
<br><br><hr>
	<div class="container">

		<main>
			<%-- condicional si no hay productos --%>
			<c:if test="${cantArticulos == 0 }">
				<div style="text-align: center;">
					<h1>Carro de compra</h1>
					<img style="width: 40%" alt="" src="img/CarritoVacio.jpeg">
					<p>
						Su carrito de compras está vacío, pulse <a href="filtro?editorial=0">aquí</a>
						para empezar a comprar
					</p>
				</div>
			</c:if>
			<%-- condicional si hay productos --%>
			<c:if test="${cantArticulos > 0 }">
				<div class="row">
					<div class="col-8">
						<h1>Carrito de compra</h1>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">ISBN</th>
									<th scope="col">Nombre</th>
									<th scope="col">Cantidad</th>
									<th scope="col">Precio</th>
									<th scope="col">Importe</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<fmt:setLocale value=""/>
								<c:forEach items="${carro }" var="d">
									<tr>
										<th scope="row"><img alt="" src="img/libros/${d.ISBN}.webp" width="100px"></th>
										<td>${d.nomprod }</td>
										<td>${d.cantidad }</td>
										<td><fmt:formatNumber value="${d.precio}" type="currency"></fmt:formatNumber></td>
										<td><fmt:formatNumber value="${d.importe }" type="currency" ></fmt:formatNumber></td>
										<td><a href="eliminardato?lib=${d.ISBN}"
											class="btn btn-outline-danger">Eliminar <i
												class="fas fa-trash"></i></a></td>
									</tr>
								</c:forEach>
									
							</tbody>
						</table>

						<br> <a href="filtro?editorial=0" class="btn btn-primary">Continuar
							comprando <i class="fa fa-shopping-cart" aria-hidden="true"></i>
						</a>
					</div>
					<div class="col-4">
						<h1>Resumen de pedido</h1>
						<hr>
						<div class="mb-3 row">
							<label for="inputCod" class="col">Total artículos:</label> 
							<label for="inputCod" class="col">(${cantArticulos })</label>
						</div>
						<div class="mb-3 row">
							<label for="inputCod" class="col">Total importe:</label> 
							<label for="inputCod" class="col"><fmt:formatNumber value="${subTotalVenta }" type="currency"></fmt:formatNumber></label>
						</div>
						<form action="procesar" method="post">
							<button class="btn btn-primary">
								Procesar compra <i class="fas fa-credit-card"></i>
							</button>
						</form>
					</div>
				</div>
			</c:if>

			${mensaje}
		</main>
		<footer> </footer>
	</div>
</body>
</html>
