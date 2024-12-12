package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import entidades.Categorias;
import interfaces.CategoriasInterface;

/**
 * Servlet implementation class CategoriasServlet
 */
@WebServlet("/CategoriasServlet")
public class CategoriasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("type");
		
		switch (type) {
		case "list": listCategorias(request,response);break;
		default:

			request.setAttribute("mensaje", "Ocurrió un problema");
			request.getRequestDispatcher("registrarProducto.jsp").forward(request, response);
		}
	}

	private void listCategorias(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		
		CategoriasInterface categoriasInterface = daoFactory.getCategorias();
		List<Categorias> dataCategorias = categoriasInterface.ListCategorias();
		
		request.setAttribute("dataCategorias", dataCategorias);
	}

}
