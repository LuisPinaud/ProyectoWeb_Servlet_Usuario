package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entidades.Clientes;
import interfaces.ClienteInterface;
import util.MySqlConexion;

public class RegistroCliente implements ClienteInterface {

	@Override
	public int Registro(Clientes c) {
int ok=0;
		
		// Plantilla
		// Prepara conexión
		Connection con = null;  
		// preparar sentencia
		PreparedStatement pst = null; 

		try {
			// obtiene la conexión
			con = MySqlConexion.getConexion();
			
			// sentencia sql
			String sql = "insert into clientes values (null, ?, ?, ?,?);";
			
			// prepara la sentencia 
			pst = con.prepareStatement(sql);
			// setea los parámetros si existe 
			pst.setString(1, c.getNombreCliente());
			pst.setString(2, c.getApellidoCliente());
			pst.setString(3, c.getEmail());
			pst.setString(4, c.getContrasenia());
			
			// actualiza la variable de control, ejecutando la sentencia 
			ok = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error en registrar: " + e.getMessage());
		} finally {
			try {
	
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}

	
		
		return ok;
	}

	@Override
	public Clientes login(Clientes c) {
		Clientes cliente = null;
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
					//String sql = "select * from tb_usuarios where usuario = ? and clave = ?";
					String sql = "{call clp_buscar(?,?)}";

					// prepara la sentencia 
					pst = con.prepareStatement(sql);
					// setea los parámetros si existe 
					pst.setString(1, c.getEmail());
					pst.setString(2, c.getContrasenia());
					
					//  ejecutando la sentencia 
					rs = pst.executeQuery();//Guarda el resultado del select
					
					
					if(rs.next()) {
						cliente = new Clientes();
						cliente.setIDCliente(rs.getInt("IDCliente"));
						cliente.setNombreCliente(rs.getString("NombreCliente"));
						cliente.setApellidoCliente(rs.getString("ApellidoCliente"));
						cliente.setEmail(rs.getString("Email"));
						cliente.setContrasenia(rs.getString("Contrasenia"));
					}
				} catch (Exception e) {
					System.out.println("Error en validar: " + e.getMessage());
				} finally {
					try {
						
						if(con != null) con.close();
					} catch (Exception e2) {
						// TODO: handle exception
						e2.printStackTrace();
					}
				}
		return cliente ;
	}

	@Override
	public int actualizar(Clientes c) {
		int ok=0;
		// Plantilla
		// Prepara conexión
		Connection con = null;  
		// preparar sentencia
		PreparedStatement pst = null; 

		try {
			// obtiene la conexión
			con = MySqlConexion.getConexion();
			
			// sentencia sql
			String sql = "{call modificar(?,?,?,?)}";
			// prepara la sentencia 
			pst = con.prepareStatement(sql);
			// setea los parámetros si existe 
			pst.setString(1, c.getNombreCliente() );
			pst.setString(2, c.getApellidoCliente());
			pst.setString(3, c.getContrasenia() );
			pst.setInt(4, c.getIDCliente());
		
			// actualiza la variable de control, ejecutando la sentencia 
			ok = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error en registrar: " + e.getMessage());
		} finally {
			try {
				
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return ok;
	}
	
}
