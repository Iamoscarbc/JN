$(function() {
  $('table').on('click', '#Editar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idMatriculaM = row.find("#idMatricula1").text();
  let idEmpleadoM = row.find("#idEmpleado1").text();
  let idAlumnoM = row.find("#idAlumno1").text();
  let idPagosM = row.find("#idPagos1").text();
  let Fecha_MatriculaM = row.find("#Fecha_Matricula1").text();
  
  $.ajax({
    success: function(response)
    {
	 $("#idMatricula").val(idMatriculaM);
     $("#idEmpleadoM").val(idEmpleadoM);
     $("#idAlumnoM").val(idAlumnoM);
     $("#idPagosM").val(idPagosM);
     $("#Fecha_Matricula").val(Fecha_MatriculaM);
    }
  })
  })
})