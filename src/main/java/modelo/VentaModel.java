package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.DetallesPedido;
import entidades.Pedidos;
import interfaces.VentaInterface;
import util.MySqlConexion;

public class VentaModel implements VentaInterface {

	@Override
	public int realizarVenta(Pedidos ped, ArrayList<DetallesPedido> det) {
		int rs = 0;
        Connection con = null;
        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        PreparedStatement pst3 = null;
        
        try {
            con = MySqlConexion.getConexion();
            con.setAutoCommit(false);  // Deshabilitar el auto-commit

            // Insertar en la tabla Pedidos y obtener el ID generado automáticamente
            String sql1 = "INSERT INTO Pedidos (FechaPedido, IDCliente) VALUES (CURDATE(), ?)";
            pst1 = con.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
            pst1.setInt(1, ped.getIDCliente());
            rs= pst1.executeUpdate();
            
            // Obtener el IDPedido generado
            ResultSet generatedKeys = pst1.getGeneratedKeys();
            int idPedidoGenerado = 0;
            if (generatedKeys.next()) {
                idPedidoGenerado = generatedKeys.getInt(1);
            } else {
                throw new SQLException("No se obtuvo el ID generado para el pedido.");
            }
            
            // Insertar en DetallesPedido y actualizar el Stock
            String sql2 = "INSERT INTO DetallesPedido VALUES (?, ?, ?, ?)";
            String sql3 = "UPDATE Libros SET Stock = Stock - ? WHERE ISBN = ?";
            pst2 = con.prepareStatement(sql2);
            pst3 = con.prepareStatement(sql3);
            
            for (DetallesPedido d : det) {
                // Insertar en DetallesPedido
                pst2.setInt(1, idPedidoGenerado);
                pst2.setString(2, d.getISBN());
                pst2.setInt(3, d.getCantidad());
                pst2.setDouble(4, d.getPrecio());
                rs += pst2.executeUpdate();
                // Actualizar el Stock en Libros
                pst3.setInt(1, d.getCantidad());
                pst3.setString(2, d.getISBN());
                rs += pst3.executeUpdate();
            }

            con.commit();  // Confirmar la transacción

        } catch (Exception e) {
			System.out.println("Error en registrar : " + e.getMessage());
			rs = 0;
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("Error al cerrar : " + e1.getMessage());
			}
        } finally {
            try {
                if (pst1 != null) pst1.close();
                if (pst2 != null) pst2.close();
                if (pst3 != null) pst3.close();
                if (con != null) con.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return rs;
		/*int rs = 0;
		// Plantilla
		Connection con = null;
		PreparedStatement pst1 = null;
		PreparedStatement pst2 = null;
		PreparedStatement pst3 = null;
		try {
			con = MySqlConexion.getConexion();

			con.setAutoCommit(false);

			String sql1 = "insert into Pedidos values (null,curdate(),?)";
			pst1 = con.prepareStatement(sql1);

			
			pst1.setInt(1, ped.getIDCliente());
			rs = pst1.executeUpdate();

			String sql2 = "insert into DetallesPedido values (?,?,?,?)";
			String sql3 = "update libros set Stock = Stock - ? where ISBN = ?";
			for (DetallesPedido d : det) {
				pst2 = con.prepareStatement(sql2);
				pst2.setString(1, ped.getNum_bol()); 
				pst2.setString(2, d.getISBN());
				pst2.setInt(3, d.getCantidad());
				pst2.setDouble(4, d.getPrecio());
				rs += pst2.executeUpdate();

				pst3 = con.prepareStatement(sql3);
				pst3.setInt(1, d.getCantidad());
				pst3.setString(2, d.getISBN());

				rs += pst3.executeUpdate();
			}

			con.commit();
		} catch (Exception e) {
			System.out.println("Error en registrar : " + e.getMessage());
			rs = 0;
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("Error al cerrar : " + e1.getMessage());
			}
		} finally {
			try {
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
			
		}
		return rs;*/
	}

}
