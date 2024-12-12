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
 * Servlet implementation class ModificarUsuarioServlet
 */
@WebServlet(name = "modificar", urlPatterns = { "/modificar" })
public class ModificarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int codigo;
		String nombre;
		String apellido;
		String clave;
		
		
		codigo = Integer.parseInt(request.getParameter("txtCodigo"));
		nombre = request.getParameter("txtNombre");
		apellido = request.getParameter("txtApellido");
		clave = request.getParameter("txtClave");
		
		if (nombre == null || nombre.isBlank() || apellido == null || apellido.isBlank() || clave == null || clave.isBlank()) { 
				        request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Todos los campos son obligatorios',icon: 'error'});</script>");
				        request.getRequestDispatcher("modificar.jsp").forward(request, response);
				        return;
				    }

	
		
		Clientes c = new Clientes();
		c.setIDCliente(codigo);
		c.setNombreCliente(nombre);
		c.setApellidoCliente(apellido);
		c.setContrasenia(clave);
		
		
		int ok = new RegistroCliente().actualizar(c);
		
		if(ok != 0) {
			request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Usuario modificado vuelva a ingresar para ver los cambios!',icon: 'success'});</script>");

		}else {
			request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Error al modificar!',icon: 'error'});</script>");

		}
		
		request.getRequestDispatcher("modificar.jsp").forward(request, response);
	}

}
