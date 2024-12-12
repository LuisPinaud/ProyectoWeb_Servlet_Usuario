<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Producto</title>
	<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/registrarLibro.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=LXGW+WenKai+TC&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">    

</head>
<body>
	<header>
        <div class="logo">
            <img src="img/logo.png" alt="">
            <h1>Ricón Literario</h1>
        </div>
        <input type="checkbox" id="nav_check" hidden>
        <nav>
            <ul>
                <li>
                    <a href="filtro?editorial=0">Catálogo</a>
                </li>
                <li>
                    <a href="registrarProducto.html">Agregar Producto</a>
                </li>
                <li>
                    <a href="editarProducto.html">Editar Producto</a>
                </li>
                <li>
                    <a href="">Reportes</a>
                </li>
                <li>
                    <a href="" class="active">
                        <img src="img/administrador.png" alt="">
                    </a>
                </li>
            </ul>
        </nav>
        <label for="nav_check" class="hamburger">
            <div></div>
            <div></div>
            <div></div>
        </label>
    </header>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h3>¿Seguro de Eliminar?</h3>
                    </div>
                    <div
                        class="container min-vh-100 d-flex justify-content-center align-items-center">
                        <form action="#" method="post">
                            <input type="hidden" name="type" value="register">
                            <div class="form-group">
                                <label>ISBN:</label> <input class="form-control" type="text"
                                    name="txtISBN" value="978-987-25620-2-1" readonly>
                            </div>
                            <div class="form-group">
                                <label>Título:</label> <input class="form-control" type="text"
                                    name="txtTitulo" value="Libro1" readonly>
                            </div>
                            <div class="form-group">
                                <label>Reseña:</label> <input class="form-control"
                                    type="text" name="txtDescripcion" value="Es un libro" readonly>
                            </div>
                            <div class="form-group">
                                <label>Autor:</label> <input class="form-control"
                                    type="text" name="txtDescripcion" value="Autor 1" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Categoría:</label>
                                <input class="form-control"
                                    type="text" name="txtDescripcion" value="Categoria 1" readonly>
                            </div>
                            <div class="form-group">
                                <label>Precio (S/.):</label> <input class="form-control" type="number" name="txtPrecio" min="1" value="1" readonly>
                            </div>
                            <div class="form-group">
                                <label>Stock:</label> <input class="form-control" type="number" name="txtStock" min="1" value="2" readonly>
                            </div>
                            <br> <input type="submit" class="btn btn-danger"
                                value="Eliminar">
                            <button type="button" class="btn btn-primary"
                                onclick="">Regresar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>