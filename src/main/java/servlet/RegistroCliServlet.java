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
 * Servlet implementation class RegistroCliServlet
 */
@WebServlet(name = "registroC", urlPatterns = { "/registroC" })
public class RegistroCliServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroCliServlet() {
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
		String nombre,apellido,correo,contrasenia;
		nombre = request.getParameter("txtNombresR");
		apellido = request.getParameter("txtApellidosR");
		correo = request.getParameter("txtUsuarioR");
		contrasenia = request.getParameter("txtContraseniaR");
		
		if (nombre == null || nombre.isBlank() || apellido == null || apellido.isBlank() || correo == null || correo.isBlank() || 
		   contrasenia == null || contrasenia.isBlank()) { 
		        request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Todos los campos son obligatorios',icon: 'error'});</script>");
		        request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);
		        return;
		    }

		    if (!correo.contains("@")) {
		        request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Introduzca una dirección de correo válida',icon: 'error'});</script>");
		        request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);
		        return;
		    }
		
		
		Clientes cli = new Clientes();
		cli.setNombreCliente(nombre);
		cli.setApellidoCliente(apellido);
		cli.setEmail(correo);
		cli.setContrasenia(contrasenia);
		
		int ok = new RegistroCliente().Registro(cli);
		
		if(ok == 0) {
			request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Error de registro!',icon: 'error'});</script>");
		} else {
			request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Registro exitoso!',icon: 'success'});</script>");

		}
		
		request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);
		
		
	}

}
