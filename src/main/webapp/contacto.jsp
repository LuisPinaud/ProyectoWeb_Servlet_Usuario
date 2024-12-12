<%@page import="modelo.CategoriasModel"%>
<%@page import="entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="es">
<head> 
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Contacto - Rincón Literario</title>
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
	rel="stylesheet">
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

	<br>
	<br>



	<div class="container mt-5">
		<div class="text-center mb-4">
			<img src="img/banner2.jpeg" alt="Banner de Contacto"
				class="img-fluid rounded">
		</div>

		<h2 class="text-center mb-4">Contacto</h2>
		<p class="text-center">Estamos aquí para ayudarte. Si tienes
			alguna pregunta o necesitas más información, no dudes en contactarnos
			a través de los siguientes medios:</p>

		<div class="row">
			<div class="col-md-6">
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								Información de Contacto</button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse show"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<strong>Teléfonos:</strong> <br> <a
									href="https://wa.me/+51936927488" target="_blank">936927488<a>-
										Luis Pinaud</a>
								</a> <br> <a href="https://wa.me/+51991280416" target="_blank">952520615<a>-
										Jhosep Palacios</a></a> <br> <a href="https://wa.me/+51936927488"
									target="_blank">989372781<a>- Luis Vera</a>
								</a> <br> <a href="https://wa.me/+51991280416" target="_blank">995520615<a>-
										Sebastian Guzman</a></a> <br>
								<br> <strong>Email:</strong> <br> <a
									href="mailto:contacto@rinconliterario.com">contacto@rinconliterario.com</a><br>
								<a href="mailto:soporte@rinconliterario.com">soporte@rinconliterario.com</a><br>
								<a href="mailto:ventas@rinconliterario.com">ventas@rinconliterario.com</a><br>
								<a href="mailto:info@rinconliterario.com">info@rinconliterario.com</a><br>
								<a href="mailto:admin@rinconliterario.com">admin@rinconliterario.com</a><br>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								Dirección</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<strong>Oficina Principal:</strong> <br> Av. Principal 123,
								Lima, Perú
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Horarios de Atención</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<strong>Lunes a Viernes:</strong> 9:00 AM - 6:00 PM <br> <strong>Sábados:</strong>
								10:00 AM - 2:00 PM <br> <strong>Domingos:</strong> Cerrado
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-body">
						<h3 class="card-title">Visión</h3>
						<p class="card-text">Nuestra visión es convertirnos en la
							librería online líder en América Latina, ofreciendo una amplia
							variedad de libros a precios competitivos y con un excelente
							servicio al cliente.</p>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<h3 class="card-title">Misión</h3>
						<p class="card-text">Nuestra misión es fomentar la lectura y
							el amor por los libros, proporcionando una plataforma accesible y
							conveniente para que los amantes de la lectura encuentren y
							compren sus libros favoritos. Nos comprometemos a ofrecer una
							experiencia de compra excepcional y a apoyar a autores y
							editoriales independientes.</p>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<h3 class="card-title">Valores</h3>
						<ul>
							<li>Pasión por los libros</li>
							<li>Compromiso con el cliente</li>
							<li>Innovación y mejora continua</li>
							<li>Respeto y diversidad</li>
							<li>Sostenibilidad</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

<br>
<hr style="border-width: 5px" >
		<div class="mt-5" >
			<div class="card mb-4" style=" background-color: #3A3A3A; border-width: 5px; border-style: solid;">
				<div class="card-body" style="background-color: #FFFD99;">
					<h3>Historia</h3>
					<p>Rincón Literario nació en 2010 con el objetivo de acercar la
						lectura a todas las personas. Desde nuestros humildes comienzos,
						hemos crecido hasta convertirnos en una de las librerías online
						más reconocidas en la región, gracias a nuestro compromiso con la
						calidad y el servicio al cliente. Ofrecemos una amplia selección
						de libros y trabajamos con editoriales independientes para traer a
						nuestros clientes obras únicas y emocionantes.</p>
				</div>
			</div>


		</div>

		<div class="mt-4">
			<div class="card mb-4" style=" background-color: #3A3A3A; border-width: 5px; border-style: solid;">
				<div class="card-body" style="background-color: #9DE3DE;">

					<h3>Equipo</h3>
					<div class="row">
						<div class="col-md-3 text-center">
							<img src="img/usuario2.png" alt="Miembro del Equipo"
								class="img-fluid rounded-circle mb-2">
							<h5>Luis Pinaud</h5>
							<p>Fundador y CEO</p>
						</div>
						<div class="col-md-3 text-center">
							<img src="img/usuario2.png" alt="Miembro del Equipo"
								class="img-fluid rounded-circle mb-2">
							<h5>Luis Vera</h5>
							<p>Director de Operaciones</p>
						</div>
						<div class="col-md-3 text-center">
							<img src="img/usuario2.png" alt="Miembro del Equipo"
								class="img-fluid rounded-circle mb-2">
							<h5>Jhosep Palacios</h5>
							<p>Gerente de Marketing</p>
						</div>
						<div class="col-md-3 text-center">
							<img src="img/usuario2.png" alt="Miembro del Equipo"
								class="img-fluid rounded-circle mb-2">
							<h5>Sebastian Guzman</h5>
							<p>Jefe de Atención al Cliente</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="mt-4">
			<div class="card mb-4" style=" background-color: #3A3A3A; border-width: 5px; border-style: solid;">
				<div class="card-body" style="background-color: #DFFFB5;">

					<h3>Servicios</h3>
					<p>En Rincón Literario ofrecemos una variedad de servicios para
						mejorar tu experiencia de compra:</p>
					<ul>
						<li>Recomendaciones personalizadas</li>
						<li>Club de lectura</li>
						<li>Entrega a domicilio</li>
						<li>Descuentos y promociones exclusivas</li>
					</ul>

				</div>
			</div>
		</div>

		<div class="mt-4">

			<div class="card mb-4" style=" background-color: #3A3A3A; border-width: 5px; border-style: solid;">
				<div class="card-body" style="background-color: #BEFFE0;">

					<h3>Testimonios</h3>
					<div id="testimonials" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="d-flex justify-content-center">
									<div class="testimonial">
										<p>"Rincón Literario tiene una selección increíble de
											libros y su servicio es impecable. ¡Siempre encuentro lo que
											busco!"</p>
										<small>- Laura García</small>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="d-flex justify-content-center">
									<div class="testimonial">
										<p>"Me encanta el club de lectura de Rincón Literario. He
											conocido a muchas personas con mis mismos intereses y he
											descubierto libros fantásticos."</p>
										<small>- Andrés Pérez</small>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="d-flex justify-content-center">
									<div class="testimonial">
										<p>"La entrega a domicilio es muy rápida y eficiente.
											Además, siempre tienen descuentos increíbles."</p>
										<small>- Sofía Rodríguez</small>
									</div>
								</div>
							</div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#testimonials" data-bs-slide="prev" style="background-color: black; width: 40px; height: 40px;">
    <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black; width: 20px; height: 20px;"></span>
    <span class="visually-hidden">Previous</span>
</button>
<button class="carousel-control-next" type="button" data-bs-target="#testimonials" data-bs-slide="next" style="background-color: black; width: 40px; height: 40px;">
    <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: black; width: 20px; height: 20px;"></span>
    <span class="visually-hidden">Next</span>
</button>


					</div>

				</div>
			</div>
		</div>







		<div class="mt-4">
			<h3>Suscríbete a nuestro boletín</h3>
			<form id="subscribeForm">
				<div class="input-group mb-3">
					<input type="email" class="form-control" id="emailInput"
						placeholder="Ingresa tu email" required>
					<button class="btn btn-primary" type="submit">Suscribirse</button>
				</div>
				<div id="confirmationMessage" class="alert alert-success d-none"
					role="alert">¡Gracias por suscribirte! Hemos enviado un
					correo de confirmación a tu email.</div>
			</form>
		</div>
	</div>

	<script>
		document.getElementById('subscribeForm').addEventListener(
				'submit',
				function(event) {
					event.preventDefault();
					var emailInput = document.getElementById('emailInput');
					var confirmationMessage = document
							.getElementById('confirmationMessage');

					// Validar formato de email
					if (!validateEmail(emailInput.value)) {
						alert('Por favor, ingresa un email válido con @');
						return;
					}

					// Mostrar mensaje de confirmación
					confirmationMessage.classList.remove('d-none');
					emailInput.value = '';
				});

		function validateEmail(email) {
			var re = /\S+@\S+\.\S+/;
			return re.test(email);
		}
	</script>






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



	</div>
</body>
</html>
