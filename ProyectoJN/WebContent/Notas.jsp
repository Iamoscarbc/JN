<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="Bean.BeanNotas"%>
 <%@ page import="mysql.Sql_Notas"%>
 <%@ page import="util.ToolLista"%>
 <%@ page import="Bean.BeanAlumno" %>
 <%@ page import="mysql.Sql_Alumno" %>
 <%@ page import="Bean.BeanCurso" %>
 <%@ page import="mysql.Sql_Curso" %>
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
                      	 Sql_Notas sql= new Sql_Notas();
                      	 BeanNotas bean= new BeanNotas();
                          lis_usu = sql.listarUsuarios();

                          ToolLista lis_al=new ToolLista();
                  	   	Sql_Alumno sql_al= new Sql_Alumno();
                  	   	BeanAlumno bean_al= new BeanAlumno();
                  	    lis_al = sql_al.listarUsuarios();

                  	    ToolLista lis_cu=new ToolLista();
                  	   	Sql_Curso sql_cu= new Sql_Curso();
                  	   	BeanCurso bean_cu= new BeanCurso();
                  	    lis_cu = sql_cu.listarUsuarios();
      %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimum-scale=1.0">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="fontawesome-free-5.4.1-web/css/fontawesome.min.css">

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="img/flechas.png">
<title>Notas</title>
    </head>
<body class="bg-dark" >

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
	<div class="row" style="padding-top:20px">
          <div class="col bg-dark" >
          	<div class="row">
          	<div class="col-sm-4"> 
		    	<a href="#registrarNotas" class="btn btn-primary btn-md " id="Visualizar" data-toggle="modal"><i class="fas fa-sign-in-alt"></i> Registrar</a>&nbsp;		    
		       	<button id="btnDescargarExcel" class="btn btn-success btn-md">Excel</button>&nbsp;  	
		       	<button id="descargarPDF" class="btn btn-warning btn-md">PDF</button> &nbsp;
	         </div>
	         <br> 
	         <br>
             <div class="col-sm-3"> 
               <input class="form-control mr-sm-2" type="text" id="txtBuscar" placeholder="Buscar" aria-label="Search">
              </div>
              <div class="col-sm-4">
               <button class="btn btn-outline-success my-2 my-sm-0" id="btnBuscar" type="submit">Buscar</button>
             </div>		    
		    </div>
		    <br>
            <div class="table-responsive">
              <table id="tablaNotas" class="table table-bordered table-dark text-white">
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
				            	<button name="btnEditar" value="Editar" id="Editar" class="btn btn-outline-primary">
			                       <a href="#modificarNotas" id="Visualizar" data-toggle="modal" class="text-primary">Editar</a>
			  					</button>
				            </td>
				            <td>
				            	<button name="btnRellenar" value="Rellenar" id="Rellenar" class="btn btn-outline-danger">
				            		<a href="#eliminarNotas" id="Visualizar" data-toggle="modal" class="text-danger">Eliminar</a>
				            	</button>
				            </td>
                      </tr>
                    <% } %>
                </tbody>
              </table>
            </div>
            
            <script type="text/javascript">
                function BuscarEmpleadosTabla  () {
                    let txtFiltro = document.querySelector("#txtBuscar")
                    let tablaEmpleados = document.querySelector('#tablaNotas')
                    let tbody =  tablaEmpleados.children[1]
                    // console.log(tbody.children[1].children[3].textContent)
                    for (var i = 0; i < tbody.childElementCount; i++) {
                        // console.log(tbody.children[i].children[3].textContent)

                        let nombreTablaFila = tbody.children[i].children[2].textContent
                        let coincidencia = nombreTablaFila.toLowerCase().search(txtFiltro.value.toLowerCase())
                        if (coincidencia  == -1 ) {
                             tbody.children[i].style.display= 'none'
                        }else {
                             tbody.children[i].style.display = ''
                        }

                    }
                }

            document.querySelector("#txtBuscar").addEventListener('keyup', function () {
                BuscarEmpleadosTabla()
            });

            document.querySelector('#btnBuscar').addEventListener('click', function ()  {
                BuscarEmpleadosTabla()
            });

 		     </script>

            <%--TABLA INVISIBLE --%>
            <div class="" id="loadingPDF" style="display: none;">
                 <a href="#" class="btn btn-primary btn-lg">Procesando Documento PDF<i class="fas fa-spinner fa-spin" ></i></a>
            </div>
            <div class="table-responsive"  id="tablaNotas2" style="padding: 20px; display: none; background: white ">
              <table  class="table table-bordered table-dark text-white">
                <thead>
                  <tr>
                        <th>#Notas</th>
                        <th>#Curso</th>
			            <th>#Alumno</th>
			            <th>Bim1</th>
			            <th>Bim2</th>
			            <th>Bim3</th>
			            <th>Bim4</th>
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
                      </tr>
                    <% } %>
                </tbody>
              </table>
            </div>
            </div>
        </div>
        </div>

        <div class="modal fade" id="registrarNotas">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="background-color: #000000;">
					<div class="modal-header">
					<h3 class="modal-tittle text-center text-white" id="tittleModal">Registrar Notas</h3>
					<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
						<div id="modalNotas">
					<div class="col" style="background-color: #222128;">
			          <div class="card-body text-white">
			           <form action="ServletNotas" method="get">
							<div class="form-group">
			                  <div class="row">
				                  <div class="col-6">
				                  	<input type="number" placeholder="idCurso" name="idCurso" id="idCurso" class="form-control" style="width:200px;" required onkeypress="return solonumeros(event)" onpaste="return false">
				                  </div>
				                  <div class="col-5" style="padding-left: 1px;">
				                  	<a href="#ventanaCurso" class="btn btn-dark btn-md" id="Visualizar" data-toggle="modal">Seleccionar</a>
				                  </div>
			                  </div>
			                </div>
			                <div class="form-group">
			                  <div class="row">
				                  <div class="col-6">
				                  	<input type="number" placeholder="idAlumno" name="idAlumno" id="idAlumno" class="form-control" style="width:200px;" required onkeypress="return solonumeros(event)" onpaste="return false">
				                  </div>
				                  <div class="col-5" style="padding-left: 1px;">
				                  	<a href="#ventanaAlumnos" class="btn btn-dark btn-md" id="Visualizar" data-toggle="modal">Seleccionar</a>
				                  </div>
			                  </div>
			                </div>
			                <div class="form-group">
			                  	<input type="number" max="20" min="0" placeholder="Bim_1" name="Bim_1" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div class="form-group">
			                  	<input type="number" max="20" min="0" placeholder="Bim_2" name="Bim_2"  class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div class="form-group">
			                    <input type="number" max="20" min="0" placeholder="Bim_3" name="Bim_3"  class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div class="form-group">
			                    <input type="number" max="20" min="0" placeholder="Bim_4" name="Bim_4"  class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div align="center">
			                    <input type="submit" value="Agregar" name="btnAgregar" class="btn btn-outline-success">
			                </div>
			            </form>
			          </div>
			        </div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="modificarNotas">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="background-color: #000000;">
					<div class="modal-header">
					<h3 class="modal-tittle text-center text-white" id="tittleModal">Modificar Notas</h3>
					<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
						<div id="modalNotas">
					<div class="col" style="background-color: #222128;">
			          <div class="card-body text-white">
			           <form action="ServletNotas" method="get">
							<div class="form-group">
			                  <div class="row">
				                  <div class="col-6">
				                  	<input type="number" placeholder="idCurso" name="idCurso" id="idCursoM" class="form-control" style="width:200px;" required onkeypress="return solonumeros(event)" onpaste="return false">
				                  </div> 
				                  <div class="col-5" style="padding-left: 1px;">
				                  	<a href="#ventanaCurso2" class="btn btn-dark btn-md" id="Visualizar" data-toggle="modal">Seleccionar</a>
				                  </div>
			                  </div>
			                </div>
			                <div class="form-group">
			                  <div class="row">
				                  <div class="col-6">
				                  	<input type="number" placeholder="idAlumno" name="idAlumno" id="idAlumnoM" class="form-control" style="width:200px;" required onkeypress="return solonumeros(event)" onpaste="return false">
				                  </div>
				                  <div class="col-5" style="padding-left: 1px;">
				                  	<a href="#ventanaAlumnos2" class="btn btn-dark btn-md" id="Visualizar" data-toggle="modal">Seleccionar</a>
				                  </div>
			                  </div>
			                </div>
			                <div class="form-group">
			                  <input type="number" max="20" min="0"  placeholder="Bim_1" name="Bim_1" id="Bim_1" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div class="form-group">
			                  <input type="number" max="20" min="0"  placeholder="Bim_2" name="Bim_2" id="Bim_2" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div class="form-group">
			                    <input type="number" max="20" min="0"  placeholder="Bim_3" name="Bim_3" id="Bim_3" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div class="form-group">
			                    <input type="number" max="20" min="0"  placeholder="Bim_4" name="Bim_4" id="Bim_4" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false">
			                </div>
			                <div align="center">
			                 	 <input type="number" placeholder="idNotas" name="idNotas" id="idNotas" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false" readonly="readonly"><br>
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

		<div class="modal fade" id="eliminarNotas">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="background-color: #000000;">
					<div class="modal-header">
					<h3 class="modal-tittle text-center text-white" id="tittleModal">Eliminar Notas</h3>
					<button type="button" class="close" id="ClosePro" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
						<div id="modalNotas">
					<div class="col" style="background-color: #222128;">
			          <div class="card-body text-white">
			           <form action="ServletNotas" method="get">
							<div align="center">
			                	<label>¿Desea Eliminar a la Nota con el siguiente ID?</label>
			                 	<input type="number" placeholder="idNotas" name="idNotas" id="idNotasE" class="form-control" required onkeypress="return solonumeros(event)" onpaste="return false" readonly="readonly"><br>
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
			
			<div class="modal fade" id="ventanaAlumnos2">
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
                           					<button class="btn btn-dark" id="Seleccionar2">Seleccionar</button>
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
			
			<div class="modal fade" id="ventanaCurso2">
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
                           					<button class="btn btn-dark" id="Seleccionar3">Seleccionar</button>
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

   <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
   <script src="js/bootstrap.min.js" type="text/javascript"></script>
   <script src="js/popper.min.js" type="text/javascript"></script>
   <script src="Ajax/ajaxNotas/ajaxNotas.js" type="text/javascript"></script>
   <script src="Ajax/ajaxNotas/editar.js" type="text/javascript"></script>
   <script src="Ajax/ajaxNotas/eliminar.js" type="text/javascript"></script>
   <script src="Ajax/ajaxNotas/pdfFromHTML.js" type="text/javascript"></script>
   <script src="Ajax/ajaxNotas/tableToExcel.js" type="text/javascript"></script>
</body>
</html>
