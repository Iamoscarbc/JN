package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.BeanMatricula;
import mysql.Sql_Matricula;

/**
 * Servlet implementation class ServletMatricula
 */
@WebServlet("/ServletMatricula")
public class ServletMatricula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMatricula() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idMatricula=request.getParameter("idMatricula");
		String idEmpleado=request.getParameter("idEmpleado");
		String idAlumno=request.getParameter("idAlumno");
		String idPagos=request.getParameter("idPagos");
		String Fecha_Matricula=request.getParameter("Fecha_Matricula");
		
		
		BeanMatricula ma = new BeanMatricula();
		ma.setIdMatricula(idMatricula);
		ma.setIdEmpleado(idEmpleado);
		ma.setIdAlumno(idAlumno);
		ma.setIdPagos(idPagos);
		ma.setFecha_Matricula(Fecha_Matricula);
		
		Sql_Matricula DMI = new Sql_Matricula();
		
	    if ("Agregar".equals(request.getParameter("btnAgregar"))) 
	    {
	    	try 
			{
	    		DMI.ingresar(ma);
				System.out.println("Haz presionado el boton agregar");
				response.sendRedirect("Matricula.jsp");
								
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	      } else if ("Modificar".equals(request.getParameter("btnModificar"))) 
	      {
	    	  try 
				{
					DMI.modificar(ma);
					System.out.println("Haz presionado el boton modificar");
					response.sendRedirect("Matricula.jsp");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	      }  else if ("Eliminar".equals(request.getParameter("btnEliminar"))) 
	      {
	    	  try 
				{
					DMI.eliminar(ma);
					System.out.println("Haz presionado el boton eliminar");
					response.sendRedirect("Matricula.jsp");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	      }
	      
	      else {
	    	  System.out.println("error");
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
