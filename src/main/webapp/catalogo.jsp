<%@page import="modelo.CategoriasModel"%>
<%@page import="entidades.Categorias"%>
<%@page import="modelo.EditorialModel"%>
<%@page import="entidades.Editorial"%>
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
	<!-- ------------------------------------------------------------------------------- -->
	<div class="contenedorCategorias">
        <h2>Catálogo</h2><div class="col-4">
									<form action="filtro" method="post">
				<%
				//obtener listado de categoria
				//enviar el listado como atributo
				List<Editorial> lstEditorial = new EditorialModel().ListEditoriales();
				
				request.setAttribute("lstEditorial", lstEditorial);
				%>
				
				
				<%--Combo o lista de opciones --%>
					<div class="col-6">
									<label class="form-label" for="autoSizingSelect">Editorial:</label>
									<select name="Editorial" class="form-select"
										id="autoSizingSelect">
										<option value="0" selected>Seleccione...</option>
										<c:forEach items="${lstEditorial}" var="e">
											<option value="${e.IDEditorial}"> ${e.nombreEditorial }</option>
										</c:forEach>
										
									</select>
								</div>
								<br>
								<div style="display: flex; justify-content: center; align-items: center">
								<button style="margin-right: 2px"
									class="btn btn-outline-primary">Aplicar filtro</button>
									</div>
				</form>
				</div>
				<br><br>
				<hr>
        <div class="categorias">
        <c:forEach items="${lstLibros }" var="l">
        <c:if test="${l.stock == 0 }">
            <div class="categoriaNoFiccion">
                <img style="opacity: 0.5; " src="img/libros/${l.ISBN}.webp" alt="" >
                <div class="categoriaInfo">
                    <h3>${l.titulo }</h3>
                    <a href="buscar?q=${l.ISBN}" class="boton">Detalles</a>
                    <br>
                    <img style="width: 30%" src="img/agotado.png" alt="" >
                </div>
            </div>
         </c:if>
         <c:if test="${l.stock > 0 }">
            <div class="categoriaFiccion">
                <img src="img/libros/${l.ISBN}.webp" alt="">
                <div class="categoriaInfo">
                    <h3>${l.titulo }</h3>
                    <a href="buscar?q=${l.ISBN}" class="boton">Detalles</a>
                </div>
            </div>
         </c:if>
         </c:forEach>
           
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