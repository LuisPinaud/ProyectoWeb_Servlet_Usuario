package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Libros;
import modelo.LibrosModel;

/**
 * Servlet implementation class FiltroEditorialServlet
 */
@WebServlet(name = "filtro", urlPatterns = { "/filtro" })
public class FiltroEditorialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltroEditorialServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int editorial;
		editorial= Integer.parseInt(request.getParameter("editorial"));
		List<Libros> lstLibros = null;
		if(editorial == 0) {
			lstLibros = new LibrosModel().lista();
			
		}
		request.setAttribute("lstLibros", lstLibros);
		
		request.getRequestDispatcher("catalogo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int editorial = Integer.parseInt(request.getParameter("Editorial"));
		
		
		List<Libros> lstLibros = null;
		if(editorial == 0) {
			lstLibros = new LibrosModel().lista();
			
		}else {
			lstLibros = new LibrosModel().filtro(editorial);

		}
		
		request.setAttribute("lstLibros", lstLibros);
		
		request.getRequestDispatcher("catalogo.jsp").forward(request, response);
	}

}
