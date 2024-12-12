package interfaces;

import java.util.ArrayList;

import entidades.DetallesPedido;
import entidades.Pedidos;

public interface VentaInterface {
	public int realizarVenta(Pedidos ped, ArrayList<DetallesPedido> det);
}
