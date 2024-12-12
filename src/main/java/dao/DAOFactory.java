package dao;

import interfaces.AutoresInterface;
import interfaces.CategoriasInterface;
import interfaces.EditorialInterface;

public abstract class DAOFactory {
	public static final int MYSQL=1;
	public static final int SQLSERVER=2;
	public static final int ORACLE=3;
	
	public abstract CategoriasInterface getCategorias();
	public abstract AutoresInterface getAutores();
	public abstract EditorialInterface getEditorial();
	
	public static DAOFactory getDaoFactory(int tipo) {
		switch (tipo) {
		case MYSQL:
			return new MySqlDAOFactory();
			
		case SQLSERVER:
			return null;
			
		case ORACLE:
			return null;
		default:
			return null;
		}
	}
}
