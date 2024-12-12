package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Clientes;
import modelo.RegistroCliente;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "loginC", urlPatterns = { "/loginC" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String correo,clave;
		
		correo=request.getParameter("txtUsuario");
		clave=request.getParameter("txtContrasenia");
		
		if ( correo == null || correo.isBlank() || clave == null || clave.isBlank()) { 
				        request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Complete los campos',icon: 'error'});</script>");
				        request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);
				        return;
				    }

				    if (!correo.contains("@")) {
				        request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Introduzca una dirección de correo válida',icon: 'error'});</script>");
				        request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);
				        return;
				    }
		
		
		Clientes c = new Clientes();
		c.setEmail(correo);
		c.setContrasenia(clave);
		
		c=new RegistroCliente().login(c);
		
		if(c != null) {
			
		
			//Ahora se guarda en un request a nivel de sesion que hace que se guarde o mantenga a pesar de hacer mas requerimientos
			request.getSession().setAttribute("c", c);//atributo como request es momentario cuanda aplastas o haces un requerimiento borra info para agilizar las cosas 
			
			request.getRequestDispatcher("Index.jsp").forward(request, response);
		}else {
			request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Usuario no registrado!',icon: 'error'});</script>");
			
			request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);
		}
	}

}
