package listeners;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import dao.DAOFactory;
import entidades.Autores;
import entidades.Categorias;
import entidades.DetallesPedido;
import entidades.Editorial;
import interfaces.AutoresInterface;
import interfaces.CategoriasInterface;
import interfaces.EditorialInterface;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
@WebListener
public class SessionListener implements HttpSessionListener {
	public static List<Categorias> dataCategorias;
	public static List<Autores> dataAutores;
	public static List<Editorial> dataEditoriales;
    /**
     * Default constructor. 
     */
    public SessionListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
    	
    	CategoriasInterface dao = daoFactory.getCategorias();
    	dataCategorias = dao.ListCategorias();
    	
    	se.getSession().setAttribute("listCategorias", dataCategorias);
    	
    	AutoresInterface dao2 = daoFactory.getAutores();
    	dataAutores = dao2.ListAutores();
    	
    	se.getSession().setAttribute("listAutores", dataAutores);
    	
    	EditorialInterface dao3 = daoFactory.getEditorial();
    	dataEditoriales = dao3.ListEditoriales();
    	
    	se.getSession().setAttribute("listEditoriales", dataEditoriales);
    	/////////////////////////////////////////////////////////////////////////
    	ArrayList<DetallesPedido> carro = new ArrayList<DetallesPedido>();
        /*Acumulador*/
        double subTotalVenta = 0.00;
        
        int cantArticulos = 0;
        //Se enviaran las variables a nivel de sesion
        se.getSession().setAttribute("carro", carro);
        se.getSession().setAttribute("subTotalVenta", subTotalVenta);
        se.getSession().setAttribute("cantArticulos", cantArticulos);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	se.getSession().invalidate();
    }
	
}
