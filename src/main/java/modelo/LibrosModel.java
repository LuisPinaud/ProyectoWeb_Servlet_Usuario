package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.Libros;
import interfaces.LibrosInterface;
import util.MySqlConexion;

public class LibrosModel implements LibrosInterface {

	@Override
	public List<Libros> lista() {
		List<Libros> lista=null;
		
		// Plantilla
		// Prepara conexión
		Connection con = null;  
		// preparar sentencia
		PreparedStatement pst = null; 
		ResultSet rs = null;
		try {
			// obtiene la conexión
			con = MySqlConexion.getConexion();
			
			// sentencia sql
			String sql = "select * from libros";
			
			// prepara la sentencia 
			pst = con.prepareStatement(sql);
			// setea los parámetros si existe 
		
			
			// actualiza la variable de control, ejecutando la sentencia 
			rs = pst.executeQuery();//Guarda el resultado del select
			
			lista= new ArrayList<Libros>();
			while(rs.next()) {
				Libros l = new Libros();
				l.setISBN(rs.getString("ISBN"));
				l.setTitulo(rs.getString("Titulo"));
				l.setResenia(rs.getString("Resenia"));
				l.setPrecio(rs.getDouble("Precio"));
				l.setStock(rs.getInt("Stock"));
				l.setFechaPublicacion(rs.getString("FechaPublicacion"));
				l.setIDAutor(rs.getInt("IDAutor"));
				l.setIDEditorial(rs.getInt("IDEditorial"));
				l.setRestriccionEdad(rs.getInt("RestriccionEdad"));
				lista.add(l);
			}
		} catch (Exception e) {
			System.out.println("Error al listar: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pst != null) pst.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		
		return lista;
	}

	@Override
	public List<Libros> filtro(int editorial) {
		List<Libros> lista =null;
		// Plantilla
				// Prepara conexión
				Connection con = null;  
				// preparar sentencia
				PreparedStatement pst = null; 
				ResultSet rs = null;
				try {
					// obtiene la conexión
					con = MySqlConexion.getConexion();
					
					// sentencia sql
					String sql = "select * from libros where IDEditorial = ?";
					
					// prepara la sentencia 
					pst = con.prepareStatement(sql);
					// setea los parámetros si existe 
					pst.setInt(1, editorial);
					
					// actualiza la variable de control, ejecutando la sentencia 
					rs = pst.executeQuery();//Guarda el resultado del select
					
					lista= new ArrayList<Libros>();
					while(rs.next()) {
						Libros l = new Libros();
						l.setISBN(rs.getString("ISBN"));
						l.setTitulo(rs.getString("Titulo"));
						l.setResenia(rs.getString("Resenia"));
						l.setPrecio(rs.getDouble("Precio"));
						l.setStock(rs.getInt("Stock"));
						l.setFechaPublicacion(rs.getString("FechaPublicacion"));
						l.setIDAutor(rs.getInt("IDAutor"));
						l.setIDEditorial(rs.getInt("IDEditorial"));
						l.setRestriccionEdad(rs.getInt("RestriccionEdad"));
						lista.add(l);
					}
				} catch (Exception e) {
					System.out.println("Error an filtro: " + e.getMessage());
				} finally {
					try {
						if(rs != null) rs.close();
						if(pst != null) pst.close();
						if(con != null) con.close();
					} catch (Exception e2) {
						// TODO: handle exception
						e2.printStackTrace();
					}
				}
		return lista ;
	}

	@Override
	public Libros buscar(String ISBN) {
		Libros l=null;
		// Plantilla
		// Prepara conexión
		Connection con = null;  
		// preparar sentencia
		PreparedStatement pst = null; 
		ResultSet rs = null;
		try {
			// obtiene la conexión
			con = MySqlConexion.getConexion();
			
			// sentencia sql
			String sql = "select * from libros where ISBN = ?";
			
			// prepara la sentencia 
			pst = con.prepareStatement(sql);
			// setea los parámetros si existe 
			pst.setString(1, ISBN);
			
			// actualiza la variable de control, ejecutando la sentencia 
			rs = pst.executeQuery();//Guarda el resultado del select
			
			if(rs.next()) {
				l = new Libros();
				l.setISBN(rs.getString("ISBN"));
				l.setTitulo(rs.getString("Titulo"));
				l.setResenia(rs.getString("Resenia"));
				l.setPrecio(rs.getDouble("Precio"));
				l.setStock(rs.getInt("Stock"));
				l.setFechaPublicacion(rs.getString("FechaPublicacion"));
				l.setIDAutor(rs.getInt("IDAutor"));
				l.setIDEditorial(rs.getInt("IDEditorial"));
				l.setRestriccionEdad(rs.getInt("RestriccionEdad"));
				
			}
		} catch (Exception e) {
			System.out.println("Error en buscar: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pst != null) pst.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return l;
	}

	@Override
	public List<Libros> filtroC(int categoria) {
		List<Libros> lista =null;
		// Plantilla
				// Prepara conexión
				Connection con = null;  
				// preparar sentencia
				PreparedStatement pst = null; 
				ResultSet rs = null;
				try {
					// obtiene la conexión
					con = MySqlConexion.getConexion();
					
					// sentencia sql
					String sql = "{call pro_libC(?)}";
					
					// prepara la sentencia 
					pst = con.prepareStatement(sql);
					// setea los parámetros si existe 
					pst.setInt(1, categoria);
					
					// actualiza la variable de control, ejecutando la sentencia 
					rs = pst.executeQuery();//Guarda el resultado del select
					
					lista= new ArrayList<Libros>();
					while(rs.next()) {
						Libros l = new Libros();
						l.setISBN(rs.getString("ISBN"));
						l.setTitulo(rs.getString("Titulo"));
						l.setResenia(rs.getString("Resenia"));
						l.setPrecio(rs.getDouble("Precio"));
						l.setStock(rs.getInt("Stock"));
						l.setFechaPublicacion(rs.getString("FechaPublicacion"));
						l.setIDAutor(rs.getInt("IDAutor"));
						l.setIDEditorial(rs.getInt("IDEditorial"));
						l.setRestriccionEdad(rs.getInt("RestriccionEdad"));
						lista.add(l);
					}
				} catch (Exception e) {
					System.out.println("Error an filtro: " + e.getMessage());
				} finally {
					try {
						if(rs != null) rs.close();
						if(pst != null) pst.close();
						if(con != null) con.close();
					} catch (Exception e2) {
						// TODO: handle exception
						e2.printStackTrace();
					}
				}
		return lista ;
	}

}
