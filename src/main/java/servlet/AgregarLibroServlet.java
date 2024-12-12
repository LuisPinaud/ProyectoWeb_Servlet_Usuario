package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.DetallesPedido;
import entidades.Libros;

/**
 * Servlet implementation class AgregarLibroServlet
 */
@WebServlet(name = "agregar", urlPatterns = { "/agregar" })
public class AgregarLibroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarLibroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Libros l = (Libros) request.getSession().getAttribute("l");
		System.out.println(l);
		
		int cantidad = Integer.parseInt(request.getParameter("cantidad"));
		System.out.println(cantidad);
		
		
		ArrayList<DetallesPedido> carro = (ArrayList<DetallesPedido>) request.getSession().getAttribute("carro");
		
		int cantArticulos = (int) request.getSession().getAttribute("cantArticulos");
		double subTotalVenta = (double) request.getSession().getAttribute("subTotalVenta");
		
		boolean productoExistente = false;

	    // Verificar si el producto ya está en el carrito
	    for (DetallesPedido d : carro) {
	        if (d.getISBN().equals(l.getISBN())) {
	            // Actualizar la cantidad y el importe del producto existente
	            d.setCantidad(d.getCantidad() + cantidad);
	            d.setImporte(d.getCantidad() * d.getPrecio());
	            cantArticulos += cantidad;
	            subTotalVenta += cantidad * d.getPrecio();
	            productoExistente = true;
	            break;
	        }
	    }

	    if (!productoExistente) {
	        // Si el producto no existe en el carrito, añadirlo como nuevo
	        DetallesPedido d = new DetallesPedido();
	        d.setISBN(l.getISBN());
	        d.setNomprod(l.getTitulo());
	        d.setPrecio(l.getPrecio());
	        d.setCantidad(cantidad);
	        d.setImporte(d.getCantidad() * d.getPrecio());
	        carro.add(d);
	        cantArticulos += d.getCantidad();
	        subTotalVenta += d.getImporte();
	    }

	    request.getSession().setAttribute("carro", carro);
	    request.getSession().setAttribute("cantArticulos", cantArticulos);
	    request.getSession().setAttribute("subTotalVenta", subTotalVenta);
	    
	    response.sendRedirect("canasta.jsp");
		
	}

}
