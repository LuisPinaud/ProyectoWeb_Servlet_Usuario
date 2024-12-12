package entidades;

public class Clientes {
	public int IDCliente;
	public String NombreCliente, ApellidoCliente, Email, Contrasenia;
	
	@Override
	public String toString() {
		return "Clientes [IDCliente=" + IDCliente + ", NombreCliente=" + NombreCliente + ", ApellidoCliente="
				+ ApellidoCliente + ", Email=" + Email + ", Contrasenia=" + Contrasenia + "]";
	}
	public int getIDCliente() {
		return IDCliente;
	}
	public void setIDCliente(int iDCliente) {
		IDCliente = iDCliente;
	}
	public String getNombreCliente() {
		return NombreCliente;
	}
	public void setNombreCliente(String nombreCliente) {
		NombreCliente = nombreCliente;
	}
	public String getApellidoCliente() {
		return ApellidoCliente;
	}
	public void setApellidoCliente(String apellidoCliente) {
		ApellidoCliente = apellidoCliente;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getContrasenia() {
		return Contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		Contrasenia = contrasenia;
	}
	
	
}
