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
<link rel="stylesheet" href="css/registrarLibro.css">
<link rel="stylesheet" href="css/carrito.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
							<li><a href="#lib01">Populares</a></li>
							<li><a href="#lib02">Infantiles</a></li>
							<li><a href="#lib03">Juveniles</a></li>
							<li><a href="#lib04">Categorías</a></li>
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
	
	 <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h3>Editar Datos Personales</h3>
                    </div>
                    <div
                        class="container min-vh-100 d-flex justify-content-center align-items-center">
                        <form action="modificar" method="post">
                                
                           
                            <input type="hidden" name="type" value="register">
                            <div class="form-group">
                                <label>Codigo de Usuario :</label> <input class="form-control" type="text"
                                    name="txtCodigo" value="${c.IDCliente}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Nombre del usuario :</label> <input class="form-control" type="text"
                                    name="txtNombre" value="${c.nombreCliente }">
                            </div>
                            <div class="form-group">
                                <label>Apellido del usuario :</label> <input class="form-control"
                                    type="text" name="txtApellido" value="${c.apellidoCliente }">
                            </div>
                            <div class="form-group">
                                <label>Correo :</label> <input class="form-control"
                                    type="text" name="txtCorreo" value="${c.email }" readonly>
                            </div>
                            <div class="form-group">
                                <label>Contraseña :</label> <input class="form-control"
                                    type="text" name="txtClave" id="exampleInputPassword1" value="${c.contrasenia }">
                            </div>
                            
                            
                            <br> <input type="submit" class="btn btn-warning"
                                value="Actualizar">
                            <br><br>
                            <a href="Index.jsp">Volver</a>
                        </form>
                        ${mensaje}
                    </div>
                </div>
            </div>
        </div>
    </div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>