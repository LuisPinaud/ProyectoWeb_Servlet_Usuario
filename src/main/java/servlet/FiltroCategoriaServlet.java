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
 * Servlet implementation class FiltroCategoriaServlet
 */
@WebServlet(name = "filtroC", urlPatterns = { "/filtroC" })
public class FiltroCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltroCategoriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoria;
		categoria= Integer.parseInt(request.getParameter("categoria"));
		
		List<Libros> lstLibros = null;
		lstLibros = new LibrosModel().filtroC(categoria);
		
		request.setAttribute("lstLibros", lstLibros);
		
		request.getRequestDispatcher("catalogo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
