$(function() {
  $('table').on('click', '#Editar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idEmpleado = row.find("#idEmpleado1").text();
  let idUsuario = row.find("#idUsuario1").text();
  let DNI = row.find("#DNI1").text();
  let Nombres = row.find("#Nombres1").text();
  let Apellidos = row.find("#Apellidos1").text();
  let Direccion = row.find("#Direccion1").text();
  let Telefono = row.find("#Telefono1").text();
  let Edad = row.find("#Edad1").text();
  let Sexo = row.find("#Sexo1").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idEmpleado").val(idEmpleado);
      $("#idUsuario").val(idUsuario);
      $("#DNI").val(DNI);
      $("#Nombres").val(Nombres);
      $("#Apellidos").val(Apellidos);
      $("#Direccion").val(Direccion);
      $("#Telefono").val(Telefono);
      $("#Edad").val(Edad);
      $("#Sexo").val(Sexo);
    }
  })
  })
})
