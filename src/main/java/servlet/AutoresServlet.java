package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import entidades.Autores;
import interfaces.AutoresInterface;

/**
 * Servlet implementation class AutoresServlet
 */
@WebServlet("/AutoresServlet")
public class AutoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("type");
		
		switch (type) {
		case "list": listAutores(request,response);break;
		default:

			request.setAttribute("mensaje", "Ocurrió un problema");
			request.getRequestDispatcher("registrarProducto.jsp").forward(request, response);
		}
	}

	private void listAutores(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		
		AutoresInterface autoresInterface = daoFactory.getAutores();
		List<Autores> dataAutores = autoresInterface.ListAutores();
		
		request.setAttribute("dataAutores", dataAutores);
	}

}
