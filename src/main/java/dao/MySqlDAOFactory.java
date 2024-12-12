package dao;

import interfaces.AutoresInterface;
import interfaces.CategoriasInterface;
import interfaces.EditorialInterface;
import modelo.AutoresModel;
import modelo.CategoriasModel;
import modelo.EditorialModel;

public class MySqlDAOFactory extends DAOFactory {

	@Override
	public CategoriasInterface getCategorias() {
		// TODO Auto-generated method stub
		return new CategoriasModel();
	}

	@Override
	public AutoresInterface getAutores() {
		// TODO Auto-generated method stub
		return new AutoresModel();
	}

	@Override
	public EditorialInterface getEditorial() {
		// TODO Auto-generated method stub
		return new EditorialModel();
	}

}
