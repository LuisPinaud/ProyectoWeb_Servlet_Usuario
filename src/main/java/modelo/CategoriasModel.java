package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.Categorias;
import interfaces.CategoriasInterface;
import util.MySqlConexion;

public class CategoriasModel implements CategoriasInterface {

	@Override
	public List<Categorias> ListCategorias() {
		// TODO Auto-generated method stub
		List<Categorias> listCategorias = new ArrayList<Categorias>();
		Connection cn = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "SELECT * FROM CATEGORIAS";
			psm = cn.prepareStatement(sql);
			rs = psm.executeQuery();
			while (rs.next()) {
				Categorias cat = new Categorias();
				cat.setIDCategoria(rs.getInt("IDCategoria"));
				cat.setNombreCategoria(rs.getString("NombreCategoria"));
				listCategorias.add(cat);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(psm != null) psm.close();
				if(cn != null) cn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return listCategorias;
	}

}
