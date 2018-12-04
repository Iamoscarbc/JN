<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/xml" %>
 <%@ page import="Bean.BeanAlumno"%>
 <%@ page import="mysql.Sql_Alumno"%>
 <%@ page import="util.ToolLista"%>
 
<jsp:useBean id="alumno" class="Bean.BeanAlumno" />

<%
      	ToolLista lis_usu=new ToolLista();
          	 Sql_Alumno sql= new Sql_Alumno();
          	 BeanAlumno bean= new BeanAlumno();
              lis_usu = sql.listarUsuarios();
      %>
          
<proyectojn>
		<% for(int i=0;i<lis_usu.getTamanio();i++)
          {bean=(BeanAlumno)lis_usu.getElemento(i);
          %>
    <Alumno>
      <IdAlumno><%=bean.getIdAlumno()%></IdAlumno>
      <DNI><%=bean.getDNI()%></DNI>
      <Nombres><%=bean.getNombres()%></Nombres>
      <Apellidos><%=bean.getApellidos()%></Apellidos>
      <Direccion><%=bean.getDireccion()%></Direccion>
      <Telefono><%=bean.getTelefono()%></Telefono>
      <Edad><%=bean.getEdad()%></Edad>
      <Grado><%=bean.getGrado()%></Grado>
      <Sexo><%=bean.getSexo()%></Sexo>
    </Alumno>
     <% } %>
</proyectojn>