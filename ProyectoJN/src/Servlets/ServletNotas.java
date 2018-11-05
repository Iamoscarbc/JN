package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mysql.Sql_Notas;

import Bean.BeanNotas;

/**
 * Servlet implementation class ServletAlumno
 */
@WebServlet("/ServletNotas")
public class ServletNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNotas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idNotas=request.getParameter("idNotas");
		String idCurso=request.getParameter("idCurso");
		String idAlumno=request.getParameter("idAlumno");
		String Bim_1=request.getParameter("Bim_1");
		String Bim_2=request.getParameter("Bim_2");
		String Bim_3=request.getParameter("Bim_3");
		String Bim_4=request.getParameter("Bim_4");
		
		
		BeanNotas no = new BeanNotas();
		no.setIdNotas(idNotas);
		no.setIdCurso(idCurso);
		no.setIdAlumno(idAlumno);
		no.setBim_1(Bim_1);
		no.setBim_2(Bim_2);
		no.setBim_3(Bim_3);
		no.setBim_4(Bim_4);
		
		Sql_Notas DNI = new Sql_Notas();
		
	    if ("Agregar".equals(request.getParameter("btnAgregar"))) 
	    {
	    	try 
			{
	    		DNI.ingresar(no);
				System.out.println("Haz presionado el boton agregar");
				response.sendRedirect("Notas.jsp");
								
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	      } else if ("Modificar".equals(request.getParameter("btnModificar"))) 
	      {
	    	  try 
				{
					DNI.modificar(no);
					System.out.println("Haz presionado el boton modificar");
					response.sendRedirect("Notas.jsp");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	      }  else if ("Eliminar".equals(request.getParameter("btnEliminar"))) 
	      {
	    	  try 
				{
					DNI.eliminar(no);
					System.out.println("Haz presionado el boton eliminar");
					response.sendRedirect("Notas.jsp");
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
