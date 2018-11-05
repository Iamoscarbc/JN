package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.BeanEmpleado;
import mysql.Sql_Empleado;

/**
 * Servlet implementation class servletEmpleado
 */
@WebServlet(name = "ServletEmpleado", urlPatterns = {"/ServletEmpleado"})
public class ServletEmpleado extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String idEmpleado= request.getParameter("idEmpleado");
		String idUsuario= request.getParameter("idUsuario");
		String DNI= request.getParameter("DNI");
		String Nombres= request.getParameter("Nombres");
		String Apellidos= request.getParameter("Apellidos");
		String Direccion= request.getParameter("Direccion");
		String Telefono= request.getParameter("Telefono");
		String Edad= request.getParameter("Edad");
		String Sexo=request.getParameter("Sexo");
		
		
		BeanEmpleado ep = new BeanEmpleado();

		ep.setIdEmpleado(idEmpleado);
		ep.setIdUsuario(idUsuario);
		ep.setDNI(DNI);
		ep.setNombres(Nombres);
		ep.setApellidos(Apellidos);
		ep.setDireccion(Direccion);
		ep.setTelefono(Telefono);
		ep.setEdad(Edad);
		ep.setSexo(Sexo);
		
		Sql_Empleado dei = new Sql_Empleado();
		
		
		 if ("Agregar".equals(request.getParameter("btnAgregar"))) 
		    {
			 ////////////
				 try 
					{
						dei.ingresar(ep);
						System.out.println("Haz presionado el boton agregar");
						response.sendRedirect("Empleados.jsp");
						
					} catch (Exception e) 
					{
						e.printStackTrace();
					}
				 
		     ////////////	 
		    } 
		 else if ("Modificar".equals(request.getParameter("btnModificar"))) 
		    {
			 ////////////
		    	  try 
					{
		    		    dei.modificar(ep);
		    		    System.out.println("Haz presionado el boton modificar");
		    		    response.sendRedirect("Empleados.jsp");
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    	  ////////////
		      } 
		 else if("Eliminar".equals(request.getParameter("btnEliminar")))
		 {
			 
			 try
			 {
				 dei.eliminar(ep);
				 System.out.println("Haz presionado el boton eliminar");
				 response.sendRedirect("Empleados.jsp");
			 }catch (Exception e) {
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
		// TODO Auto-generated method s
	}

}
