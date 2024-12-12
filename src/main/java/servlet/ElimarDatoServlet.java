package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.DetallesPedido;

/**
 * Servlet implementation class ElimarDatoServlet
 */
@WebServlet(name = "eliminardato", urlPatterns = { "/eliminardato" })
public class ElimarDatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElimarDatoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ISBN = request.getParameter("lib");
		
		ArrayList<DetallesPedido> carro = (ArrayList<DetallesPedido>) request.getSession().getAttribute("carro");
		
		int cantArticulos = (int) request.getSession().getAttribute("cantArticulos");
		double subTotalVenta = (double) request.getSession().getAttribute("subTotalVenta");
		
		for (DetallesPedido detallesPedidos : carro) {
			if(detallesPedidos.getISBN().equals(ISBN)) {
				cantArticulos -= detallesPedidos.getCantidad();
				subTotalVenta -= detallesPedidos.getImporte();
				carro.remove(detallesPedidos);
				break;
			}
		}
		//Volvemos a enviar todo
		request.getSession().setAttribute("carro", carro);
		request.getSession().setAttribute("cantArticulos", cantArticulos);
		request.getSession().setAttribute("subTotalVenta", subTotalVenta);
		
		response.sendRedirect("canasta.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
