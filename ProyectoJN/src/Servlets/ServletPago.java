package Servlets;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.BeanPago;
import mysql.Sql_Pago;

@WebServlet(name = "ServletPago", urlPatterns = {"/ServletPago"})
public class ServletPago extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String idPagos=request.getParameter("idPagos");
		String idAlumno=request.getParameter("idAlumno");
		String DNI_R=request.getParameter("DNI_R");
		String Concepto=request.getParameter("Concepto");
		String Importe=request.getParameter("Importe");
		String Fecha_Pago=request.getParameter("Fecha_Pago");
       
		
		
		BeanPago pa = new BeanPago();
		pa.setIdPagos(idPagos);
		pa.setIdAlumno(idAlumno);
		pa.setDNI_R(DNI_R);
		pa.setConcepto(Concepto);
		pa.setImporte(Importe);
		pa.setFecha_Pago(Fecha_Pago);
		
		Sql_Pago DEI = new Sql_Pago();
		
	    if ("Agregar".equals(request.getParameter("btnAgregar"))) 
	    {
	    	try 
			{
	    		DEI.ingresar(pa);
				System.out.println("Haz presionado el boton agregar");
				response.sendRedirect("Pagos.jsp");
								
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	      } else if ("Modificar".equals(request.getParameter("btnModificar"))) 
	      {
	    	  try 
				{
					DEI.modificar(pa);
					System.out.println("Haz presionado el boton modificar");
					response.sendRedirect("Pagos.jsp");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	      }  else if ("Eliminar".equals(request.getParameter("btnEliminar"))) 
	      {
	    	  try 
				{
					DEI.eliminar(pa);
					System.out.println("Haz presionado el boton eliminar");
					response.sendRedirect("Pagos.jsp");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	      }
	      
	      else {
	    	  System.out.println("error");
	      }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    /**
     * Returns a short description of the servlet.
     *
    @Override
    public String getServletInfo() {
        return "Short description";
     * @return a String containing servlet description
     */
    //} </editor-fold>
    
}


