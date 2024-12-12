package interfaces;

import entidades.Clientes;

public interface ClienteInterface {
	public int Registro(Clientes c);
	public Clientes login(Clientes c);
	public int actualizar(Clientes c);
}
