<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="Bean.BeanAlumno"%>
 <%@ page import="mysql.DaoAlumnoIMPL"%>
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
    	 DaoAlumnoIMPL sql= new DaoAlumnoIMPL();
    	 BeanAlumno bean= new BeanAlumno();
        lis_usu = sql.listarUsuarios();
      %>

<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimum-scale=1.0">
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="fontawesome-free-5.4.1-web/css/fontawesome.min.css">
  <link rel="icon" type="image/png" href="img/flechas.png">
<title>Alumnos</title>
    </head>
    
<body class="bg-dark">
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #000000;" >
	  <a class="navbar-brand" href="Alumnos.jsp">Registro de Alumnos</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	   <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="admin.jsp">Administrador<span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="Matricula.jsp">Matricula</a>
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
	<div class="container">
	<div class="row" style="padding-top:50px">
        <div class="col-sm-3" style="background-color: #222128;">
          <div class="card-body text-white">
            <form action="ServletAlumno" method="get">                
                <div class="form-group">
                  <input type="text" placeholder="DNI" name="DNI" id="DNI" class="form-control">
                </div>
                <div class="form-group">
                  <input type="text" placeholder="Nombres" name="Nombres" id="Nombres" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" placeholder="Apellidos" name="Apellidos" id="Apellidos" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" placeholder="Direccion" name="Direccion" id="Direccion" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" placeholder="Telefono"  name="Telefono" id="Telefono" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" placeholder="Edad"  name="Edad" id="Edad" class="form-control">
                </div>
                <div class="form-group">
				    <select class="form-control" id="Grado" name="Grado">
				    <option value="null" selected="true" disabled="disabled">Seleccione Grado</option>
				      <option>Estimulación Temprana</option>
				      <option>3 años</option>
				      <option>4 años</option>
				      <option>5 años</option>
				    </select>
				  </div>
				  <div class="form-group">
				    <select class="form-control" id="Sexo" name="Sexo">
				    <option value="null" selected="true" disabled="disabled">Seleccione Sexo</option>
				      <option>Masculino</option>
				      <option>Femenino</option>
				    </select>
				  </div>     
				  <div align="center">
                    <input type="submit" value="Agregar" name="btnAgregar" class="btn btn-outline-success"><br><br>
                  	<input type="text" placeholder="idAlumno" name="idAlumno" id="idAlumno" class="form-control"><br>
                    <input type="submit" value="Modificar" name="btnModificar" class="btn btn-outline-primary">
                    <input type="submit" value="Eliminar" name="btnEliminar" class="btn btn-outline-danger">
                  </div>
            </form>
          </div>
        </div>
          <div class="col-sm-9 bg-dark">
            <div class="table-responsive">
              <table class="table table-bordered table-dark text-white">
                <thead>
                  <tr>
                        <th>#</th>
                        <th>DNI</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Edad</th>
                        <th>Grado</th>
                        <th>Sexo</th>
			            <th>Editar</th>
			            <th>Eliminar</th>
                  </tr>
                </thead>
                <tbody >
                     <% for(int i=0;i<lis_usu.getTamanio();i++)
                        {bean=(BeanAlumno)lis_usu.getElemento(i);
                        %>                   
                      <tr>
                            <td id="idAlumno1"><%=bean.getIdAlumno()%></td>
                            <td id="DNI1"><%=bean.getDNI() %></td>
                            <td id="Nombres1"><%=bean.getNombres() %></td>
                            <td id="Apellidos1"><%=bean.getApellidos() %></td>
                            <td id="Direccion1"><%=bean.getDireccion() %></td>
                            <td id="Telefono1"><%=bean.getTelefono() %></td>
                            <td id="Edad1"><%=bean.getEdad() %></td>
                            <td id="Grado1"><%=bean.getGrado() %></td>
                            <td id="Sexo1"><%=bean.getSexo() %></td>
                            <td>
				            	<button name="btnEditar" value="Editar" id="Editar" class="btn btn-outline-primary">Editar</button>
				            </td>
				            <td>
				            	<button name="btnEliminar1" value="Eliminar" id="Eliminar1" class="btn btn-outline-danger">Eliminar</button>
				            </td>
                      </tr>
                    <% } %>
                </tbody>
              </table>
            </div>
        </div> 
        </div>
        </div>           
   <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
   <script src="js/bootstrap.min.js" type="text/javascript"></script>
   <script src="js/popper.min.js" type="text/javascript"></script>
   <script src="ajaxAlumnos.js" type="text/javascript"></script>
</body>
</html>
