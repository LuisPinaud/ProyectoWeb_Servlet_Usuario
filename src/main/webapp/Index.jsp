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
<title>Libreria</title>
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
	<br>
	<h3 class="titulo">Bienvenido: ${c.nombreCliente}</h3>
	<!------------------------------------------------------CARRUSEL-------------------------------------------------------------->


	<div class="carrusel">
		<div id="carouselExampleAutoplaying" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="./img/Carrusel/libroo1.jpeg" class="d-block w-100"
						alt="Libro 1">
				</div>
				<div class="carousel-item">
					<img src="./img/Carrusel/libroo2.jpeg" class="d-block w-100"
						alt="Libro 2">
				</div>
				<div class="carousel-item">
					<img src="./img/Carrusel/libroo3.jpeg" class="d-block w-100"
						alt="Libro 3">
				</div>
				<div class="carousel-item">
					<img src="./img/Carrusel/libroo4.jpeg" class="d-block w-100"
						alt="Libro 4">
				</div>
				<div class="carousel-item">
					<img src="./img/Carrusel/libroo5.jpeg" class="d-block w-100"
						alt="Libro 5">
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				onclick="changeSlide('prev')" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span> <span
					class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				onclick="changeSlide('next')" aria-label="Next">
				<span aria-hidden="true">&raquo;</span> <span
					class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<script>
		let slideIndex = 0; // Variable para seguir el índice del slide actual

		function changeSlide(direction) {
			const slides = document
					.querySelectorAll('#carouselExampleAutoplaying .carousel-item');

			// Oculta el slide actual
			slides[slideIndex].classList.remove('active');

			// Calcula el nuevo índice de slide
			if (direction === 'next') {
				slideIndex = (slideIndex + 1) % slides.length;
			} else if (direction === 'prev') {
				slideIndex = (slideIndex - 1 + slides.length) % slides.length;
			}

			// Muestra el nuevo slide
			slides[slideIndex].classList.add('active');
		}
	</script>

	<br>
	<br>
	<br>

	<h3 class="titulo" id="lib01">Libros Populares</h3>
	<br>
	<br>
	<style>
/* Estilo para las imágenes dentro de las tarjetas */
.card-img-top {
	height: 450px; /* Altura deseada para las imágenes */
	width: 900px;
	/* Ancho al 100% para que ocupe todo el espacio disponible */
	object-fit: cover; /* Ajuste para cubrir el contenido */
}
</style>
	<div class="container">
		<div id="carouselBooks" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="d-flex justify-content-around">
						<div class="card h-100">
							<img src="img/libros/lib01.jpeg" class="card-img-top img-fluid"
								alt="Libro 1">
							<div class="card-body">
								<h5 class="card-title">La sombra del viento</h5>
								<p class="card-text">Novela gótica ambientada en la
									posguerra española - S/69.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib02.jpeg" class="card-img-top img-fluid"
								alt="Libro 2">
							<div class="card-body">
								<h5 class="card-title">Cien años de soledad</h5>
								<p class="card-text">Saga familiar en un pueblo
									latinoamericano - S/79.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib03.jpeg" class="card-img-top img-fluid"
								alt="Libro 3">
							<div class="card-body">
								<h5 class="card-title">El principito</h5>
								<p class="card-text">Fábula filosófica sobre la amistad y el
									amor - S/49.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib04.jpeg" class="card-img-top img-fluid"
								alt="Libro 4">
							<div class="card-body">
								<h5 class="card-title">1984</h5>
								<p class="card-text">Distopía sobre un futuro totalitario y
									vigilado - S/59.90</p>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-around">
						<div class="card h-100">
							<img src="img/libros/lib05.jpeg" class="card-img-top img-fluid"
								alt="Libro 5">
							<div class="card-body">
								<h5 class="card-title">Matar a un ruiseñor</h5>
								<p class="card-text">Drama legal ambientado en el Sur de
									Estados Unidos - S/64.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib06.jpeg" class="card-img-top img-fluid"
								alt="Libro 6">
							<div class="card-body">
								<h5 class="card-title">El Alquimista</h5>
								<p class="card-text">Novela de autoayuda y espiritualidad -
									S/54.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib07.jpeg" class="card-img-top img-fluid"
								alt="Libro 7">
							<div class="card-body">
								<h5 class="card-title">Orgullo y prejuicio</h5>
								<p class="card-text">Clásico de la literatura romántica
									inglesa - S/49.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib08.jpeg" class="card-img-top img-fluid"
								alt="Libro 8">
							<div class="card-body">
								<h5 class="card-title">Don Quijote de la Mancha</h5>
								<p class="card-text">Novela cómica sobre un caballero
									andante - S/59.90</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselBooks" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselBooks" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<br>
	<br>
	<br>
	<h2 style="text-align:center" >Proximos Libros</h2>
	<br>
	<h3 class="titulo" id="lib02">Libros Infantiles</h3>
	<br>
	<br>
	<div class="container">

		<div id="carouselBooks2" class="carousel slide"
			data-bs-ride="carousel">

			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="d-flex justify-content-around">
						<div class="card h-100">
							<img src="img/libros/lib09.jpeg" class="card-img-top img-fluid"
								alt="Libro 1">
							<div class="card-body">
								<h5 class="card-title">Caperucita Roja</h5>
								<p class="card-text">Cuento clásico de hadas para niños -
									S/29.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib10.jpeg" class="card-img-top img-fluid"
								alt="Libro 2">
							<div class="card-body">
								<h5 class="card-title">El patito feo</h5>
								<p class="card-text">Historia sobre aceptación y autoestima
									en niños - S/34.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib11.jpeg" class="card-img-top img-fluid"
								alt="Libro 3">
							<div class="card-body">
								<h5 class="card-title">El gato con botas</h5>
								<p class="card-text">Aventuras de un astuto gato en botas -
									S/29.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib12.jpeg" class="card-img-top img-fluid"
								alt="Libro 4">
							<div class="card-body">
								<h5 class="card-title">La bella durmiente</h5>
								<p class="card-text">Clásico cuento de princesas y magia -
									S/32.90</p>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-around">
						<div class="card h-100">
							<img src="img/libros/lib13.jpeg" class="card-img-top img-fluid"
								alt="Libro 5">
							<div class="card-body">
								<h5 class="card-title">El soldadito de plomo</h5>
								<p class="card-text">Aventuras de un valiente soldadito de
									juguete - S/27.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib14.jpeg" class="card-img-top img-fluid"
								alt="Libro 6">
							<div class="card-body">
								<h5 class="card-title">El lobo y los siete cabritillos</h5>
								<p class="card-text">Cuento clásico sobre la astucia y la
									precaución - S/29.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib15.jpeg" class="card-img-top img-fluid"
								alt="Libro 7">
							<div class="card-body">
								<h5 class="card-title">Pulgarcito</h5>
								<p class="card-text">Aventuras del pequeño Pulgarcito en un
									mundo gigante - S/25.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib16.jpeg" class="card-img-top img-fluid"
								alt="Libro 8">
							<div class="card-body">
								<h5 class="card-title">Blancanieves</h5>
								<p class="card-text">Clásico cuento de hadas con enanitos y
									magia - S/28.90</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselBooks2" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselBooks2" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<h3 class="titulo" id="lib03">Libros Juveniles</h3>
	<br>
	<br>
	<div class="container">
		<div id="carouselBooks3" class="carousel slide"
			data-bs-ride="carousel">

			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="d-flex justify-content-around">
						<div class="card h-100">
							<img src="img/libros/lib01.jpeg" class="card-img-top img-fluid"
								alt="Libro 1">
							<div class="card-body">
								<h5 class="card-title">Harry Potter y la piedra filosofal</h5>
								<p class="card-text">Aventuras mágicas en la escuela de
									magia - S/59.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib02.jpeg" class="card-img-top img-fluid"
								alt="Libro 2">
							<div class="card-body">
								<h5 class="card-title">Los juegos del hambre</h5>
								<p class="card-text">Competencia brutal en un futuro
									distópico - S/49.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib03.jpeg" class="card-img-top img-fluid"
								alt="Libro 3">
							<div class="card-body">
								<h5 class="card-title">El ladrón del rayo</h5>
								<p class="card-text">Aventuras mitológicas y heroísmo
									juvenil - S/45.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib04.jpeg" class="card-img-top img-fluid"
								alt="Libro 4">
							<div class="card-body">
								<h5 class="card-title">Bajo la misma estrella</h5>
								<p class="card-text">Historia de amor y superación personal
									- S/39.90</p>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-around">
						<div class="card h-100">
							<img src="img/libros/lib05.jpeg" class="card-img-top img-fluid"
								alt="Libro 5">
							<div class="card-body">
								<h5 class="card-title">Percy Jackson y el ladrón del rayo</h5>
								<p class="card-text">Aventuras mitológicas y humor juvenil -
									S/42.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib06.jpeg" class="card-img-top img-fluid"
								alt="Libro 6">
							<div class="card-body">
								<h5 class="card-title">La ciudad de las bestias</h5>
								<p class="card-text">Aventuras en la selva amazónica -
									S/44.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib07.jpeg" class="card-img-top img-fluid"
								alt="Libro 7">
							<div class="card-body">
								<h5 class="card-title">El señor de los anillos</h5>
								<p class="card-text">Fantasía épica y aventuras legendarias
									- S/55.90</p>
							</div>
						</div>
						<div class="card h-100">
							<img src="img/libros/lib08.jpeg" class="card-img-top img-fluid"
								alt="Libro 8">
							<div class="card-body">
								<p class="card-text">Aventuras paranormales y romance
									juvenil - S/48.90</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselBooks3" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselBooks3" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>





	<div class="contenedorCategorias">
		<h2 class="titulo" id="lib04">Categorias Mas Buscadas</h2>
		<div class="categorias">
			<div class="categoriaFiccion">
				<img src="img/Ficción.png" alt="">
				<div class="categoriaInfo">
					<h3>Ficción</h3>
					<a href="filtroC?categoria=10" class="boton">Ver</a>
				</div>
			</div>
			<div class="categoriaNoFiccion">
				<img src="img/No ficción.png" alt="">
				<div class="categoriaInfo">
					<h3>Novelas</h3>
					<a href="filtroC?categoria=1" class="boton">Ver</a>
				</div>
			</div>

		</div>
	</div>
	<div class="contenedorCategorias">
		<div class="categorias">
			<div class="categoriaFiccion" style="background-color: #f4ff91;">
				<img src="img/Aventura.png" alt="">
				<div class="categoriaInfo">
					<h3>Aventura</h3>
					<a href="filtroC?categoria=14" class="boton">Ver</a>
				</div>
			</div>
			<div class="categoriaNoFiccion" style="background-color: #d6a735;">
				<img src="img/Comedia.png" alt="">
				<div class="categoriaInfo">
					<h3>Drama</h3>
					<a href="filtroC?categoria=5" class="boton">Ver</a>
				</div>
			</div>
		</div>
	</div>
	<div class="contenedorCategorias">
		<div class="categorias">
			<div class="categoriaFiccion" style="background-color: #0af299;">
				<img src="img/Infantil.png" alt="">
				<div class="categoriaInfo">
					<h3>Romance</h3>
					<a href="filtroC?categoria=13" class="boton">Ver</a>
				</div>
			</div>
			<div class="categoriaNoFiccion" style="background-color: #ffbf75;">
				<img src="img/Empresariales.png" alt="">
				<div class="categoriaInfo">
					<h3>Poesia</h3>
					<a href="filtroC?categoria=3" class="boton">Ver</a>
				</div>
			</div>
		</div>
	</div>
	<div class="contenedorCategorias">
		<div class="categorias">
			<div class="categoriaFiccion" style="background-color: #ff5f7c;">
				<img src="img/Comics.png" alt="">
				<div class="categoriaInfo">
					<h3>Cuento</h3>
					<a href="filtroC?categoria=2" class="boton">Ver</a>
				</div>
			</div>
			<div class="categoriaNoFiccion" style="background-color: #6aa3b4;">
				<img src="img/Novelas.png" alt="">
				<div class="categoriaInfo">
					<h3>Historia</h3>
					<a href="filtroC?categoria=7" class="boton">Ver</a>
				</div>
			</div>
		</div>
	</div>

	
	



	






	<br>
	<br>
	<br>
	<br>
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
	<script src="js/carrito.js"></script>
</body>
</html>