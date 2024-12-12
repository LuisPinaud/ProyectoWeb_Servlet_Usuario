package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Clientes;
import entidades.DetallesPedido;
import entidades.Pedidos;
import modelo.VentaModel;

/**
 * Servlet implementation class VentaServlet
 */
@WebServlet(name = "venta", urlPatterns = { "/venta" })
public class VentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VentaServlet() {
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
		Clientes c =(Clientes) request.getSession().getAttribute("c");
		
		if(c == null) {
			request.setAttribute("mensaje", "Debe ingresar a su cuenta");	
			request.setAttribute("estilo", "alert alert-danger");	
			request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);	
			return;
		}
		Pedidos p = new Pedidos();
		p.setIDCliente(c.getIDCliente());
		
		
		
		ArrayList<DetallesPedido> carro = (ArrayList<DetallesPedido>) request.getSession().getAttribute("carro");
		
		int cantArticulos = (int) request.getSession().getAttribute("cantArticulos");
		double subTotalVenta = (double) request.getSession().getAttribute("subTotalVenta");
		
		
		int ok = new VentaModel().realizarVenta(p, carro);
		if(ok == 0) {
			request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Error de venta!',icon: 'error'});</script>");
			request.getRequestDispatcher("canasta.jsp").forward(request, response);
		}else {
			request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Venta exitosa!',icon: 'success'});</script>");
			
			// reiniciar las variables 
			carro.clear();
			cantArticulos = 0;
			subTotalVenta = 0.00;
			request.getSession().setAttribute("carro", carro);
			request.getSession().setAttribute("cantArticulos", cantArticulos);
			request.getSession().setAttribute("subTotalVenta", subTotalVenta);
			request.getRequestDispatcher("canasta.jsp").forward(request, response);

		}
	}

}
