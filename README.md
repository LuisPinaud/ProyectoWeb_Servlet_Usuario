# ProyectoWeb_Servlet_Usuario

## Sistema de Gestión de Ventas - Parte del Usuario

## 📝 Descripción
Esta parte del sistema está diseñada para ofrecer a los usuarios una experiencia fluida al interactuar con el catálogo de productos, permitiendo la visualización, selección y compra de libros de manera intuitiva.

## 🌟 Funcionalidades
- **Catálogo de Productos:**
  - Visualización de los libros disponibles, con opción de filtrar por campos como editorial (a través de un combo dinámico extraído de la base de datos).
  - Los productos sin stock aparecen resaltados en rojo con un mensaje de "Agotado".
- **Detalles del Producto:**
  - Muestra información adicional como descripción, precio y opción para elegir la cantidad.
  - Posibilidad de agregar el libro al carrito de compras.
- **Carrito de Compras:**
  - Almacena los libros seleccionados con detalles como cantidad, precio unitario e importe total.
  - Muestra un resumen a la derecha con el total de artículos y el importe general.
  - Opción para procesar la compra.
- **Validaciones:**
  - Los productos con stock igual a 0 son destacados en rojo.
  - Solo usuarios registrados pueden procesar la compra; si no se está logueado, el sistema redirige automáticamente a la pantalla de inicio de sesión.
- **Descarga de Factura:**
  - Una vez procesada la compra, se genera automáticamente un PDF con los detalles de la misma.

## 🛠️ Tecnologías Utilizadas
- **Backend:** Java con Servlets y JSP.
- **Base de Datos:** MySQL.
- **Frontend:** HTML, CSS, y JavaScript.
- **PDF:** Generación de archivos con la librería iTextPDF.

## 📋 Requisitos
1. Servidor Apache Tomcat.
3. Base de datos MySQL con las tablas necesarias configuradas.
4. Dependencias de iTextPDF configuradas en el proyecto.

## 🚀 Configuración
1. Clona este repositorio en tu máquina local.
2. Configura la conexión a la base de datos en el archivo de propiedades.
3. Despliega el proyecto en Apache Tomcat.
4. Accede al sistema desde el navegador.

## 🔗 Enlaces
- Para obtener más información como las indicaciones y la base de datos ingresar a este enlace de drive: https://drive.google.com/file/d/1cZ9ey9rGYPDEAHRi35STL0KhesT4FRwn/view?usp=sharing
