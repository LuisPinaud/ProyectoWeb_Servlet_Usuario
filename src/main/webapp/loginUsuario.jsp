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
<title>Login</title>
</head>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/styleU.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=LXGW+WenKai+TC&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">    
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
<body>
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

    <div class="loginContainer">
        <div class="container-form register">
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido</h2>
                    <p>Para realizar compras en nuestra tienda, por favor Inicia Sesión con
                        tus datos</p>
                    <input type="button" value="Iniciar Sesión" id="sign-in">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Crear una Cuenta</h2>
    
                    <form action="registroC" method="post" class="form form-register" novalidate>
                        <input type="hidden" name="type" value="register">
                        <div>
                            <label> <i class='bx bx-user'></i> <input type="text"
                                placeholder="Nombres Usuario" name="txtNombresR" required>
                            </label>
                        </div>
                        <div>
                            <label> <i class='bx bx-user'></i> <input type="text2"
                                placeholder="Apellidos Usuario" name="txtApellidosR" required>
                            </label>
                        </div>
                        <div>
                            <label> <i class='bx bx-envelope'></i> <input type="email"
                                placeholder="Correo Electronico" name="txtUsuarioR" required>
                            </label>
                        </div>
                        <div>
                            <label> <i class='bx bx-lock-alt'></i> <input
                                type="password" placeholder="Contraseña" name="txtContraseniaR" required>
                            </label>
                        </div>
    
                        <input type="submit" value="Registrarse">
                        <div class="alerta-error">Todos los campos son obligatorios</div>
                        <div class="alerta-exito">Te registraste correctamente</div>
                    </form>
                    ${mensaje}
                </div>
            </div>
        </div>
    
    
    
    
    
        <div class="container-form login hide">
            <div class="information">
                <div class="info-childs">
                    <h2>¡¡Bienvenido nuevamente!!</h2>
                    <p>Para realizar compras en nuestra tienda, por favor Inicia Sesión con
                        tus datos</p>
                    <input type="button" value="Registrarse" id="sign-up">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Iniciar Sesión</h2>
    
                    <form action="loginC" method="post" class="form form-login" novalidate>
                        <input type="hidden" name="type" value="login">
                        <div>
                            <label> <i class='bx bx-envelope'></i> <input type="email"
                                placeholder="Correo Electronico" name="txtUsuario">
                            </label>
                        </div>
                        <div>
                            <label> <i class='bx bx-lock-alt'></i> <input
                                type="password" placeholder="Contraseña" name="txtContrasenia">
                            </label>
                        </div>
                        <input type="submit" value="Iniciar Sesión">
                        <div class="alerta-error">Todos los campos son obligatorios</div>
                        <div class="alerta-exito">Te registraste correctamente</div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="js/login.js"></script>
    <script src="js/register.js"></script>
</body>
</html>