<%@page import="Bean.BeanNotas"%>
<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="mysql.DaoNotasIMPL"%>
 <%@ page import="util.ToolLista"%>
 <%@ page import="Bean.BeanAlumno" %>
 <%@ page import="mysql.DaoAlumnoIMPL" %>
 <%@ page import="Bean.BeanCurso" %>
 <%@ page import="mysql.DaoCursoIMPL" %>
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
    	 DaoNotasIMPL sql= new DaoNotasIMPL();
    	 BeanNotas bean= new BeanNotas();
        lis_usu = sql.listarUsuarios();
        
        ToolLista lis_al=new ToolLista();
	   	DaoAlumnoIMPL sql_al= new DaoAlumnoIMPL();
	   	BeanAlumno bean_al= new BeanAlumno();
	    lis_al = sql_al.listarUsuarios();
	    
	    ToolLista lis_cu=new ToolLista();
	   	DaoCursoIMPL sql_cu= new DaoCursoIMPL();
	   	BeanCurso bean_cu= new BeanCurso();
	    lis_cu = sql_cu.listarUsuarios();	    
      %>
      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link rel="icon" type="image/png" href="img/flechas.png">
<title>Notas</title>
    </head>
<body class="bg-dark">

	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #000000;" >
	  <a class="navbar-brand" href="Notas.jsp">Registro de Notas</a>
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
	        <a class="nav-link" href="Alumnos.jsp">Alumnos</a>
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
            <form action="ServletNotas" method="get">
				<div class="form-group">
                  <div class="row">
	                  <div class="col-6">
	                  	<input type="text" placeholder="idCurso" name="idCurso" id="idCurso" class="form-control" style="width:200px;">
	                  </div>
	                  <div class="col-5" style="padding-left: 1px;">
	                  	<a href="#ventanaCurso" class="btn btn-dark btn-md" id="Visualizar" data-toggle="modal">Seleccionar</a>
	                  </div>                   
                  </div>
                </div>				  
                <div class="form-group">
                  <div class="row">
	                  <div class="col-6">
	                  	<input type="text" placeholder="idAlumno" name="idAlumno" id="idAlumno" class="form-control" style="width:200px;">
	                  </div>
	                  <div class="col-5" style="padding-left: 1px;">
	                  	<a href="#ventanaAlumnos" class="btn btn-dark btn-md" id="Visualizar" data-toggle="modal">Seleccionar</a>
	                  </div>                   
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" placeholder="Bim_1" name="Bim_1" id="Bim_1" class="form-control">
                </div>
                <div class="form-group">
                  <input type="text" placeholder="Bim_2" name="Bim_2" id="Bim_2" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" placeholder="Bim_3" name="Bim_3" id="Bim_3" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" placeholder="Bim_4" name="Bim_4" id="Bim_4" class="form-control">
                </div>
                <div align="center">
                    <input type="submit" value="Agregar" name="btnAgregar" class="btn btn-outline-success"><br><br>
                 	 <input type="text" placeholder="idNotas" name="idNotas" id="idNotas" class="form-control"><br>
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
                        <th>#Notas</th>
                        <th>#Curso</th>
			            <th>#Alumno</th>
			            <th>Bim1</th>
			            <th>Bim2</th>
			            <th>Bim3</th>
			            <th>Bim4</th>
			            <th>Editar</th>
			            <th>Eliminar</th>
                  </tr>
                </thead>
                <tbody >
                     <% for(int i=0;i<lis_usu.getTamanio();i++)
 		    			{bean=(BeanNotas)lis_usu.getElemento(i);
                        %>                   
                      <tr>
                            <td id="idNotas1"><%=bean.getIdNotas()%></td>
                            <td id="idCurso1"><%=bean.getIdCurso()%></td>
                            <td id="idAlumno1"><%=bean.getIdAlumno()%></td>
                            <td id="Bim_11"><%=bean.getBim_1()%></td>
                            <td id="Bim_21"><%=bean.getBim_2()%></td>
                            <td id="Bim_31"><%=bean.getBim_3()%></td>
                            <td id="Bim_41"><%=bean.getBim_4()%></td>
                            <td>
				            	<button name="btnEditar" value="Editar" id="Editar" class="btn btn-outline-success">Editar</button>
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
		<div class="modal fade" id="ventanaAlumnos">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content" style="background-color: #000000;">
						<div class="modal-header">
						<h3 class="modal-tittle text-center text-white" id="tittleModal">Alumnos</h3>
						<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<div id="modalAlumnos">
							<div class="table-responsive">
									 <table id="tableAlumnos" class="table table-dark table-bordered table-hover mt-2 text-center">
								        <tr>					
								            <th>#Alumno</th>
											<th>DNI</th>
											<th>Nombres</th>
											<th>Apellidos</th>								            
								        </tr>
								        	<%
								        	 for(int i=0;i<lis_al.getTamanio();i++)
				                                {bean_al=(BeanAlumno)lis_al.getElemento(i);
								        	%>
								        <tr>
											<td id ="idAlumnoModal"><%=bean_al.getIdAlumno()%></td>
				                            <td id ="DNIModal"><%=bean_al.getDNI()%></td>
				                            <td id ="NombresModal"><%=bean_al.getNombres()%></td>
				                            <td id ="ApellidosModal"><%=bean_al.getApellidos()%></td>
											<td>
                           					<button class="btn btn-dark" id="Seleccionar">Seleccionar</button>
                        					</td>
										  </tr>
										<%} %>
								       </table>
			                   </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>        

	<div class="modal fade" id="ventanaCurso">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content" style="background-color: #000000;">
						<div class="modal-header">
						<h3 class="modal-tittle text-center text-white" id="tittleModal">Cursos</h3>
						<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<div id="modalCurso">
							<div class="table-responsive">
									 <table id="tableCurso" class="table table-dark table-bordered table-hover mt-2 text-center">
								        <tr>					
								            <th>#Curso</th>
											<th>Curso</th>								            
								        </tr>
								        	<%
								        	 for(int i=0;i<lis_cu.getTamanio();i++)
				                                {bean_cu=(BeanCurso)lis_cu.getElemento(i);
								        	%>
								        <tr>
											<td id ="idCursoModal"><%=bean_cu.getIdCurso()%></td>
				                            <td id ="CursoModal"><%=bean_cu.getCurso()%></td>
											<td>
                           					<button class="btn btn-dark" id="Seleccionar1">Seleccionar</button>
                        					</td>
										  </tr>
										<%} %>
								       </table>
			                   </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>      
        
   <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
   <script src="js/bootstrap.min.js" type="text/javascript"></script>
   <script src="js/popper.min.js" type="text/javascript"></script>
   <script src="ajaxNotas.js" type="text/javascript"></script>
</body>
</html>