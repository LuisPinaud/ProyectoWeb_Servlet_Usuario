package interfaces;

import java.util.List;

import entidades.Libros;

public interface LibrosInterface {
	public List<Libros> lista();
	public List<Libros> filtro(int editorial);
	public Libros buscar(String ISBN);
	public List<Libros> filtroC(int categoria);
}
