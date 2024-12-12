package servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import entidades.Clientes;
import entidades.DetallesPedido;
import entidades.Pedidos;
import modelo.VentaModel;

/**
 * Servlet implementation class ProcesarCompraServlet
 */
@WebServlet(name = "procesar", urlPatterns = { "/procesar" })
public class ProcesarCompraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcesarCompraServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Clientes c = (Clientes) request.getSession().getAttribute("c");

	    if (c == null) {
	        request.setAttribute("mensaje", "Debe ingresar a su cuenta");
	        request.setAttribute("estilo", "alert alert-danger");
	        request.getRequestDispatcher("loginUsuario.jsp").forward(request, response);
	        return;
	    }

	    try {
	        // Validar la información de la tarjeta de crédito
	        String cardNumber = request.getParameter("cardNumber");
	        String expiryDate = request.getParameter("expiryDate");
	        String cvv = request.getParameter("cvv");

	        if (cardNumber == null || cardNumber.length() != 16) {
	            throw new Exception("Ingrese un numero de tarjeta valido para continuar con la compra.");
	        }

	        if (expiryDate == null || !expiryDate.matches("(0[1-9]|1[0-2])/([0-9]{2})")) {
	            throw new Exception("Fecha de expiración inválida.");
	        }

	        if (cvv == null || cvv.length() != 3) {
	            throw new Exception("CVV inválido.");
	        }

	        Pedidos p = new Pedidos();
	        p.setIDCliente(c.getIDCliente());

	        
	        ArrayList<DetallesPedido> carro = (ArrayList<DetallesPedido>) request.getSession().getAttribute("carro");

	        int ok = new VentaModel().realizarVenta(p, carro);
	        if (ok == 0) {
	        	request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Error de venta!',icon: 'error'});</script>");
	            request.getRequestDispatcher("tarjeta.jsp").forward(request, response);
	        } else {
	        	
	        	try {
	        		//Generar el comprobante de pago en PDF
	                ByteArrayOutputStream baos = new ByteArrayOutputStream();
	                Document document = new Document();
	                PdfWriter.getInstance(document, baos);
	                document.open();

	                Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, Font.BOLD);
	                Font fontSubtitulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, Font.BOLD);
	                Font fontCelda = FontFactory.getFont(FontFactory.HELVETICA, 10);

	                Paragraph titulo = new Paragraph("Boleta de Compra", fontTitulo);
	                titulo.setAlignment(Element.ALIGN_CENTER);
	                document.add(titulo);

	                document.add(new Paragraph("ID Cliente: " + c.getIDCliente(), fontSubtitulo));
	                document.add(new Paragraph("Nombre Cliente: " + c.getNombreCliente(), fontSubtitulo));
	                document.add(new Paragraph(" ", fontSubtitulo));
	                
	                PdfPTable table = new PdfPTable(3);
	                table.setWidthPercentage(100);

	                PdfPCell cellProducto = new PdfPCell(new Paragraph("Producto", fontSubtitulo));
	                cellProducto.setBackgroundColor(BaseColor.LIGHT_GRAY);
	                cellProducto.setHorizontalAlignment(Element.ALIGN_CENTER);
	                table.addCell(cellProducto);

	                PdfPCell cellCantidad = new PdfPCell(new Paragraph("Cantidad", fontSubtitulo));
	                cellCantidad.setBackgroundColor(BaseColor.LIGHT_GRAY);
	                cellCantidad.setHorizontalAlignment(Element.ALIGN_CENTER);
	                table.addCell(cellCantidad);

	                PdfPCell cellPrecio = new PdfPCell(new Paragraph("Precio", fontSubtitulo));
	                cellPrecio.setBackgroundColor(BaseColor.LIGHT_GRAY);
	                cellPrecio.setHorizontalAlignment(Element.ALIGN_CENTER);
	                table.addCell(cellPrecio);

	                for (DetallesPedido detalle : carro) {
	                    table.addCell(new PdfPCell(new Paragraph(detalle.getNomprod(), fontCelda)));
	                    table.addCell(new PdfPCell(new Paragraph(String.valueOf(detalle.getCantidad()), fontCelda)));
	                    table.addCell(new PdfPCell(new Paragraph(String.valueOf(detalle.getPrecio()), fontCelda)));
	                }

	                document.add(table);

	                document.add(new Paragraph("Total: " + request.getSession().getAttribute("subTotalVenta"), fontSubtitulo));

	                document.close();

	                response.setContentType("application/pdf");
	                response.setHeader("Content-Disposition", "attachment; filename=BoletaRincónLiteraio.pdf");
	                response.setContentLength(baos.size());
	                
	                //Enviar PDF al usuario
	                response.getOutputStream().write(baos.toByteArray());
	                response.getOutputStream().flush();
	                
	                // Reiniciar variables de sesión y configurar mensaje de éxito
	                request.getSession().setAttribute("carro", new ArrayList<DetallesPedido>());
	                request.getSession().setAttribute("cantArticulos", 0);
	                request.getSession().setAttribute("subTotalVenta", 0.00);

	                request.setAttribute("mensaje", "<script> Swal.fire({title: 'Aviso!',text: 'Venta exitosa!',icon: 'success'});</script>");

	                // Limpiar el carrito
	                carro.clear();

	                // Redireccionar a la página del carrito de compras
	                request.getRequestDispatcher("canasta.jsp").forward(request, response);
	                
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
	        	
	        }
	    } catch (Exception e) {
	        request.setAttribute("mensaje", e.getMessage());
	        request.setAttribute("estilo", "alert alert-danger");
	        request.getRequestDispatcher("tarjeta.jsp").forward(request, response);
	    }
	}

}
