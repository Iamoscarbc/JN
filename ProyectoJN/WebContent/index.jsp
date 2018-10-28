<%--
    Document   : pruebadelogin
    Created on : 15/10/2018, 11:39:03 AM
    Author     : Sobrino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LOGIN</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="fontawesome-free-5.4.1-web/css/fontawesome.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="icon" type="image/png" href="img/flechas.png">

<style type="text/css">
    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		color: #636363;
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-login .modal-header {
		border-bottom: none;
        position: relative;
        justify-content: center;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-login .form-control:focus {
		border-color: #70c5c0;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 3px;
	}
	.modal-login .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}
	.modal-login .modal-footer {
		background: #16309e;
		border-color: #0b0a22;
		text-align: center;
        justify-content: center;
		margin: 0 -20px -20px;
		border-radius: 5px;
		font-size: 13px;
	}
	.modal-login .modal-footer a {
		color: #999;
	}
	.modal-login .avatar {
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -70px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: rgba(22, 48, 158, 0.93);
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-login .avatar img {
		width: 100%;
	}
	.modal-login.modal-dialog {
		margin-top: 80px;
	}
    .modal-login .btn {
        color: #fff;
        border-radius: 4px;
		background: #16309e;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
    }
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #0a0e1a;
		outline: none;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>

</head>
<body class="p-3 mb-2 bg-dark text-white">
<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<a href="#myModal" class="trigger-btn text-white" data-toggle="modal">Clic Para Desplegar Login</a>
</div>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<div class="avatar">
                   <img src="img/avatar.png" alt="Avatar"/>
				</div>
				<h4 class="modal-title">LOGIN</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="SERVLOGIN" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="txtusuario" placeholder="Ingrese su usuario" required="required">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="txtcontra" placeholder="Ingrese su contraseña" required="required">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-lg btn-block login-btn" name="btnIniciar" value="Iniciar Sesion">Ingresar</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="reestablecer.jsp">¿Olvidaste tu Contraseña?</a>
			</div>
		</div>
	</div>
</div>
<%
		HttpSession sesion = request.getSession();
		int tipo=0;
		if(request.getAttribute("tipo")!=null){
			tipo = (Integer)request.getAttribute("tipo");
			if(tipo==1){
				sesion.setAttribute("nombre", request.getAttribute("nombre"));
				sesion.setAttribute("tipo", tipo);
				response.sendRedirect("admin.jsp");
			}
            else if(tipo==2){
				sesion.setAttribute("nombre", request.getAttribute("nombre"));
				sesion.setAttribute("tipo", tipo);
				response.sendRedirect("docente.jsp");
			}
            else
                        {response.sendRedirect("error.jsp");}
		}
        if(request.getParameter("cerrar")!=null){
                    session.invalidate();}
		%>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
</body>
</html>
