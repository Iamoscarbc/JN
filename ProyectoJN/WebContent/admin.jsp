<%--
    Document   : admin.jsp
    Created on : 14/10/2018, 02:22:57 PM
    Author     : Sobrino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
HttpSession sesion= request.getSession();

if(sesion.getAttribute("tipo")==null){
    response.sendRedirect("index.jsp");
    }
else{
    String nivel = sesion.getAttribute("tipo").toString();
    if(!nivel.equals("1"))
      {response.sendRedirect("index.jsp");
      }
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimum-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/png" href="img/flechas.png">
        <title>ADMINISTRADOR</title>
    </head>
    <body class="bg-dark">   
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #000000;" >
	  <a class="navbar-brand" href="admin.jsp">Bienvenido Administrador</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	   <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="Alumnos.jsp">Alumnos<span class="sr-only">(current)</span></a>
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
	
	<br>
	<br>
	<h1 class="text-white" align="center">AQUI PRONTO UN PERFIL</h1>
	<div align="center"><img class="img-responsive mt-3" src="img/user-icon.png" style="width:600px"></div> 
	
<%-- 	/*<div id="main" class="" >
            <div class="row d-flex justify-content-center ">
                <div class="col-md-11">
                    <div class="row mt-5 ">
                        <div class="col-md-3" style="box-shadow: inset 1px 1px #dedfe0,inset 0 -1px #dedfe0;">
                            <div class="col-md-12" align="center">
                                <img class="img-responsive mt-3" src="<%out.print(usuario.getImagen()); %>" alt="" style="border-radius: 5px; -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.75);
								-moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.75);
								box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.75);"  width="120" height="150">
                            </div>
                            <div class="col-md-12" style="text-align: center">
                                <h4>
                                    <p><small><%out.print(usuario.getNombre() + " "+usuario.getApellido()); %></small> </p>
                                </h4>
                            </div>
                            <hr class="row">
                            <div class="row">
                                <div class="list-group" style="width:100%;">
                                    <a href="index.html" class="list-group-item list-group-item-action">
                                    <i class="fas fa-home"></i> Jesus de Nazareth
                                    </a>
                                    <a href="menuPerfil.jsp" class="list-group-item list-group-item-action">
                                    <i class="fas fa-address-card"></i> Mi perfil</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-9" style="border: 1px solid #dedfe0; padding: 15px;">
                            <div class="col-md-12" style="text-align: center">
                                <h3>
                                    <i class="fas fa-user"></i> Mi Perfil
                                    <p><small class="text-muted">Añade y modica tu informacion</small> </p>
                                </h3>
                            </div>
                            <hr>
                            <div class="col-md-12" >
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-8">
                                        <form action="ServletPerfil">
                                            <div class="form-group ">
                                                <label for="exampleInputEmail1">ID</label>
                                                <input name="idPersona" value="<%out.print(usuario.getIdPersona()); %>"  type="text" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ID" disabled>

                                            </div>
                                            <div class="form-group ">
                                                <label for="exampleInputEmail1">Usuario</label>
                                                <input name="usuario" value="<%out.print(usuario.getUsuario()); %>"  type="text" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Usuario" disabled>
                                                <small id="emailHelp" class="form-text text-muted">Nosotros nunca compartiremos tu informacion a nadie.</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Nombre</label>
                                                <input name="nombre" value="<%out.print(usuario.getNombre()); %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="Ingrese Nombre">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Apellidos</label>
                                                <input name="apellido" value="<%out.print(usuario.getApellido()); %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="Ingrese apellidos">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Direccion</label>
                                                <input name="direccion" value="<%out.print(usuario.getDireccion()); %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="Direccion">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Email</label>
                                                <input name="mail" value="<%out.print(usuario.getMail()); %>" type="email" class="form-control" id="exampleInputPassword1" placeholder="ejemplo@colgioJN.com">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Celular</label>
                                                <input name="celular" value="<%out.print(usuario.getNumeroCelular()); %>" type="number" class="form-control" id="exampleInputPassword1" placeholder="Ingrese Celular">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Telefono</label>
                                                <input name="telefono" value="<%out.print(usuario.getNumeroTelefono()); %>" type="number" class="form-control" id="exampleInputPassword1" placeholder="Ingrese Telefono">
                                            </div>
                                            <div class="form-group form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                            </div>
                                            <input type="hidden" name="accion" value="INS">
                                            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Guardar</button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div> --%>
	
            <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
    </body>
</html>
