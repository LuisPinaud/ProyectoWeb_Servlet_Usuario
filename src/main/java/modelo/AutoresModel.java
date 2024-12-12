package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.Autores;
import interfaces.AutoresInterface;
import util.MySqlConexion;

public class AutoresModel implements AutoresInterface {

	@Override
	public List<Autores> ListAutores() {
		// TODO Auto-generated method stub
		List<Autores> listAutores = new ArrayList<Autores>();
		Connection cn = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "SELECT * FROM AUTORES";
			psm = cn.prepareStatement(sql);
			rs = psm.executeQuery();
			while (rs.next()) {
				Autores au = new Autores();
				au.setIDAutor(rs.getInt("IDAutor"));
				au.setNombreAutor(rs.getString("NombreAutor"));
				au.setApellidoAutor(rs.getString("ApellidoAutor"));
				listAutores.add(au);
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
		
		return listAutores;
	}

}
