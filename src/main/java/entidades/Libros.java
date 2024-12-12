package entidades;

public class Libros {
	public String ISBN, Titulo, Resenia, FechaPublicacion;
	public double Precio;
	public int Stock, IDAutor, IDEditorial, RestriccionEdad;
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitulo() {
		return Titulo;
	}
	public void setTitulo(String titulo) {
		Titulo = titulo;
	}
	public String getResenia() {
		return Resenia;
	}
	public void setResenia(String resenia) {
		Resenia = resenia;
	}
	public String getFechaPublicacion() {
		return FechaPublicacion;
	}
	public void setFechaPublicacion(String fechaPublicacion) {
		FechaPublicacion = fechaPublicacion;
	}
	public double getPrecio() {
		return Precio;
	}
	public void setPrecio(double precio) {
		Precio = precio;
	}
	public int getStock() {
		return Stock;
	}
	public void setStock(int stock) {
		Stock = stock;
	}
	public int getIDAutor() {
		return IDAutor;
	}
	public void setIDAutor(int iDAutor) {
		IDAutor = iDAutor;
	}
	public int getIDEditorial() {
		return IDEditorial;
	}
	public void setIDEditorial(int iDEditorial) {
		IDEditorial = iDEditorial;
	}
	public int getRestriccionEdad() {
		return RestriccionEdad;
	}
	public void setRestriccionEdad(int restriccionEdad) {
		RestriccionEdad = restriccionEdad;
	}
	
}
