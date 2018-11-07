<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
 <%@ page import="Bean.BeanEmpleado"%>
 <%@ page import="mysql.Sql_Empleado"%>
 <%@ page import="util.ToolLista"%> 
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
 
 <%
   	ToolLista lis_usu=new ToolLista();
    		Sql_Empleado sql= new Sql_Empleado();
           BeanEmpleado bean= new BeanEmpleado();
           lis_usu = sql.listarEmpleados();
   %>      
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimum-scale=1.0">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="img/flechas.png">
	<title>Empleados</title>
</head>
<body class="bg-dark">
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #000000;" >
	  <a class="navbar-brand" href="Empleados.jsp">Registro de Empleados</a>
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
	        <a class="nav-link" href="Alumnos.jsp">Alumnos</a>
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
  <div class="row" style=" padding-top:20px">	  
	<div class="col bg-dark">
		<div>
	    	<a href="#registroEmpleados" class="btn btn-success btn-md " id="Visualizar" data-toggle="modal">
	    	<i class="fas fa-sign-in-alt"></i> Registrar</a>
	    </div> 
	    <br>	
		<div class="table-responsive">
			<table class="table table-bordered table-dark text-white">
	        <tr>
	            <th>#Empleado</th>
	            <th>#Usuario</th>
	            <th>DNI</th>
	            <th>Nombres</th>
	            <th>Apellidos</th>
	            <th>Direccion</th>
	            <th>Telefono</th>
	            <th>Edad</th>
	            <th>Sexo</th>
	            <th>Editar</th>
	            <th>Eliminar</th>
	        </tr>
	        	<%
	        	for(int i=0;i<lis_usu.getTamanio();i++)
	    		{bean=(BeanEmpleado)lis_usu.getElemento(i);
	        	%>
	        	<tr>
				<td id="idEmpleado1"><%=bean.getIdEmpleado()%></td>
				<td id="idUsuario1"><%=bean.getIdUsuario()%></td>
				<td id="DNI1"><%=bean.getDNI() %></td>
				<td id="Nombres1"><%=bean.getNombres() %></td>
				<td id="Apellidos1"><%=bean.getApellidos() %></td>
				<td id="Direccion1"><%=bean.getDireccion() %></td>
				<td id="Telefono1"><%=bean.getTelefono() %></td>
				<td id="Edad1"><%=bean.getEdad() %></td>
				<td id="Sexo1"><%=bean.getSexo() %></td>
				<td>
	            	<button name="btnEditar" value="Editar" id="Editar" class="btn btn-outline-primary">
					<a href="#modificarEmpleados" id="Visualizar" data-toggle="modal" class="text-primary">Editar</a> 
					</button> 
	            </td>
	            <td>
	            	<button name="btnRellenar" value="Rellenar" id="Rellenar" class="btn btn-outline-danger">
	            	<a href="#eliminarEmpleados" id="Visualizar" data-toggle="modal" class="text-danger">Eliminar</a>
	            	</button>
	            </td>
			  <tr>
			<%} %>
	        </table>
         </div>
       </div>
	</div>
  </div>
	
	<div class="modal fade" id="registroEmpleados">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content" style="background-color: #000000;">
						<div class="modal-header">
						<h3 class="modal-tittle text-center text-white" id="tittleModal">Empleados</h3>
						<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<div id="modalEmpleados">
						<div class="col" style="background-color: #222128;">
				          <div class="card-body text-white">
				            <form action="ServletEmpleado" method="get">	
					            <div class="form-group"> 
								   <select class="form-control" name="idUsuario" required>
								   <option value="null" selected="true" disabled="disabled">Seleccione Tipo</option>
								   <option value="1">Administrador</option>
								   <option value="2">Docente</option>
								   <option value="3">Auxiliar</option>
								   </select>
								 </div>
					            <div class="form-group">
					                  <input type="text" placeholder="DNI" name="DNI" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Nombres" name="Nombres" class="form-control" required onkeypress="return sololetras(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Apellidos" name="Apellidos" class="form-control" required onkeypress="return sololetras(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Direccion" name="Direccion" class="form-control" required onkeypress="return direccion(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Telefono" name="Telefono" class="form-control" required onkeypress="return telefono(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Edad" name="Edad" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
					            </div>		
								<div class="form-group"> 
								   <select class="form-control" name="Sexo" required>
								   <option value="null" selected="true" disabled="disabled">Seleccione Sexo</option>
								   <option>Masculino</option>
								   <option>Femenino</option>
								   </select>
								 </div>
								 <div align="center">
									<input type="submit" value="Agregar" name="btnAgregar" class="btn btn-outline-success" class="form-control">
								</div>
							</form>
				          </div>
				        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modificarEmpleados">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content" style="background-color: #000000;">
						<div class="modal-header">
						<h3 class="modal-tittle text-center text-white" id="tittleModal">Modificar Empleados</h3>
						<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<div id="modalEmpleados">
						<div class="col" style="background-color: #222128;">
				          <div class="card-body text-white">
				            <form action="ServletEmpleado" method="get">	
					            <div class="form-group"> 
								   <select class="form-control" id="idUsuario" name="idUsuario" required>
								   <option value="null" selected="true" disabled="disabled">Seleccione Tipo</option>
								   <option value="1">Administrador</option>
								   <option value="2">Docente</option>
								   <option value="3">Auxiliar</option>
								   </select>
								 </div>
					            <div class="form-group">
					                  <input type="text" placeholder="DNI" name="DNI" id="DNI" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Nombres" name="Nombres" id="Nombres" class="form-control" required onkeypress="return sololetras(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Apellidos" name="Apellidos" id="Apellidos" class="form-control" required onkeypress="return sololetras(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Direccion" name="Direccion" id="Direccion" class="form-control" required onkeypress="return direccion(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Telefono" name="Telefono" id="Telefono" class="form-control" required onkeypress="return telefono(event)" onpaste="return false">
					            </div>
					            <div class="form-group">
					                  <input type="text" placeholder="Edad" name="Edad" id="Edad" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
					            </div>		
								<div class="form-group"> 
								   <select class="form-control" id="Sexo" name="Sexo" required>
								   <option value="null" selected="true" disabled="disabled">Seleccione Sexo</option>
								   <option>Masculino</option>
								   <option>Femenino</option>
								   </select>
								 </div>
								 <div align="center">
								 	<input type="text" name="idEmpleado" placeholder="idEmpleado" id="idEmpleado" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false"><br>
									<input type="submit" value="Modificar" name="btnModificar" class="btn btn-outline-primary">
								</div>
							</form>
				          </div>
				        </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="eliminarEmpleados">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="background-color: #000000;">
					<div class="modal-header">
					<h3 class="modal-tittle text-center text-white" id="tittleModal">Eliminar Empleados</h3>
					<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
						<div id="modalEmpleados">
							<div class="col" style="background-color: #222128;">
					          <div class="card-body text-white">
					            <form action="ServletEmpleado" method="get">               
					                  <div align="center">
					                  <label>¿Desea Eliminar a el Empleado con el siguiente ID?</label>
					                  	<input type="text" placeholder="idEmpleado" name="idEmpleado" id="idEmpleadoE" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false"><br>
					                    <input type="submit" value="Eliminar" name="btnEliminar" class="btn btn-outline-danger">
					                  </div>
					            </form>
					          </div>
					        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			function sololetras(e){
				key=e.keyCode || e.which;
				teclado=String.fromCharCode(key).toLowerCase();
				letras=" abcdefghijklmnñopqrstuvwxyz";
				especiales="8-37-38-46-164";
				teclado_especial=false;
				
				for(var i in especiales){
					if(key==especiales[i]){
						teclado_especial=true;break;
					}
				}
				if(letras.indexOf(teclado)==-1 && !teclado_especial){
					return false;
				}
			}		
		</script>
		
		<script>
			function solonumeros(e){
				key=e.keyCode || e.which;
				teclado=String.fromCharCode(key);
				numeros="0123456789";
				especiales="8-37-38-46-164";
				teclado_especial=false;
				
				for(var i in especiales){
					if(key==especiales[i]){
						teclado_especial=true;break;
					}
				}
				if(numeros.indexOf(teclado)==-1 && !teclado_especial){
					return false;
				}
			}
		</script>
		
		<script>
			function telefono(e){
				key=e.keyCode || e.which;
				teclado=String.fromCharCode(key);
				numeros="+0123456789";
				especiales="8-37-38-46-164";
				teclado_especial=false;
				
				for(var i in especiales){
					if(key==especiales[i]){
						teclado_especial=true;break;
					}
				}
				if(numeros.indexOf(teclado)==-1 && !teclado_especial){
					return false;
				}
			}
		</script>
		
		<script>
			function direccion(e){
				key=e.keyCode || e.which;
				teclado=String.fromCharCode(key);
				numeros=" abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ-0123456789.";
				especiales="8-37-38-46-164";
				teclado_especial=false;
				
				for(var i in especiales){
					if(key==especiales[i]){
						teclado_especial=true;break;
					}
				}
				if(numeros.indexOf(teclado)==-1 && !teclado_especial){
					return false;
				}
			}
		</script>
		
		<script>
			function edad(e){
				var Age=parseInt(document.getElementByName('Edad').value);
				if(Age <0 && Age >101){console.log(Age);}
				else{}
				key=e.keyCode || e.which;
				teclado=String.fromCharCode(key);
				numeros="0123456789";
				especiales="8-37-38-46-164";
				teclado_especial=false;
				
				for(var i in especiales){
					if(key==especiales[i]){
						teclado_especial=true;break;
					}
				}
				if(numeros.indexOf(teclado)==-1 && !teclado_especial){
					return false;
				}
				}
			}
		</script>
	
   <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
   <script src="js/bootstrap.min.js" type="text/javascript"></script>
   <script src="js/popper.min.js" type="text/javascript"></script>
   <script src="Ajax/ajaxEmpleados/editar.js" type="text/javascript"></script>
   <script src="Ajax/ajaxEmpleados/eliminar.js" type="text/javascript"></script>
</body>
</html>