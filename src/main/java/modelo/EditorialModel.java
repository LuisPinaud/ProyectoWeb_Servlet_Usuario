package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.Editorial;
import interfaces.EditorialInterface;
import util.MySqlConexion;

public class EditorialModel implements EditorialInterface {

	@Override
	public List<Editorial> ListEditoriales() {
		// TODO Auto-generated method stub
		List<Editorial> listEditoriales = new ArrayList<Editorial>();
		Connection cn = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "SELECT * FROM EDITORIAL";
			psm = cn.prepareStatement(sql);
			rs = psm.executeQuery();
			while (rs.next()) {
				Editorial ed = new Editorial();
				ed.setIDEditorial(rs.getInt("IDEditorial"));
				ed.setNombreEditorial(rs.getString("NombreEditorial"));
				listEditoriales.add(ed);
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
		
		return listEditoriales;
	}

}
