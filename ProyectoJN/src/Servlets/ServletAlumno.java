package Servlets;

import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.BeanAlumno;
import mysql.Sql_Alumno;

@WebServlet(name = "ServletAlumno", urlPatterns = {"/ServletAlumno"})
public class ServletAlumno extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String idAlumno=request.getParameter("idAlumno");
				String DNI=request.getParameter("DNI");
				String Nombres=request.getParameter("Nombres");
				String Apellidos=request.getParameter("Apellidos");
				String Direccion=request.getParameter("Direccion");
				String Telefono=request.getParameter("Telefono");
		        String Edad=request.getParameter("Edad");
				String Grado=request.getParameter("Grado");
				String Sexo=request.getParameter("Sexo");
		
		
		BeanAlumno al = new BeanAlumno();
		al.setIdAlumno(idAlumno);
		al.setDNI(DNI);
		al.setNombres(Nombres);
		al.setApellidos(Apellidos);
		al.setDireccion(Direccion);
		al.setTelefono(Telefono);
        al.setEdad(Edad);
		al.setGrado(Grado);
		al.setSexo(Sexo);
		
		Sql_Alumno DAI = new Sql_Alumno();
		
	    if ("Agregar".equals(request.getParameter("btnAgregar"))) 
	    {
	    	try 
			{
	    		DAI.ingresar(al);
				System.out.println("Haz presionado el boton agregar");
				response.sendRedirect("Alumnos.jsp");
								
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	      } else if ("Modificar".equals(request.getParameter("btnModificar"))) 
	      {
	    	  try 
				{
					DAI.modificar(al);
					System.out.println("Haz presionado el boton modificar");
					response.sendRedirect("Alumnos.jsp");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	      }  else if ("Eliminar".equals(request.getParameter("btnEliminar"))) 
	      {
	    	  try 
				{
					DAI.eliminar(al);
					System.out.println("Haz presionado el boton eliminar");
					response.sendRedirect("Alumnos.jsp");
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
