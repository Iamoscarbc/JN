<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="Bean.BeanAlumno"%>
 <%@ page import="mysql.Sql_Alumno"%>
 <%@ page import="util.ToolLista"%>
 <%@page session="true"%>   
    
    <%
           	HttpSession sesion= request.getSession();

           if(sesion.getAttribute("tipo")==null){
               response.sendRedirect("index.jsp");
               }
           else{
               String nivel = sesion.getAttribute("tipo").toString();
               if(!nivel.equals("1") && !nivel.equals("2") )
                 {response.sendRedirect("index.jsp");
                 }
               }
           %>

      <%
      	ToolLista lis_usu=new ToolLista();
          	 Sql_Alumno sql= new Sql_Alumno();
          	 BeanAlumno bean= new BeanAlumno();
              lis_usu = sql.listarUsuarios();
      %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimum-scale=1.0">
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link rel="icon" type="image/png" href="img/flechas.png">
<title>Tabla Matricula</title>
</head>
<body class="bg-dark">

	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #000000;" >
	  <a class="navbar-brand" href="Matricula.jsp">Registro de Matricula</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	   <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="admin.jsp">Administrador<span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="Alumnos.jsp">Alumnos</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="Empleados.jsp">Empleados</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="Notas.jsp">Notas</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Pagos
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="Pagos.jsp">Importe de Alumnos</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item disabled" href="admin.jsp">Pagos a Empleados</a>	
	        </div>
	      </li>
	    </ul>
	   <form class="form-inline my-2 my-lg-0">
	      <h5 class="text-uppercase font-weight-bold mr-sm-2"><%=sesion.getAttribute("nombre")%></h5>
	      <a class="btn btn-dark my-2 my-sm-0" href="index.jsp?cerrar=true" role="button">Cerrar Sesión</a>
	    </form>
	  </div>
	</nav>
	<br>
	<br>
	<h1 class="text-white" align="center">AQUI PRONTO EL REGISTRO DE MATRICULA</h1>
	<div align="center"><img class="img-responsive mt-3" src="img/matricula-icon.png" style="width:600px"></div> 
	
   <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
   <script src="js/bootstrap.min.js" type="text/javascript"></script>
   <script src="js/popper.min.js" type="text/javascript"></script>	
</body>
</html>