$(function() {
  $('table').on('click', '#Seleccionar', function(e){
	  e.preventDefault(); 
 let row = $(this).closest('tr');
  let idAlumno = row.find("#idAlumnoModal").text();
  let DNI = row.find("#DNIModal").text();
  let Nombres = row.find("#NombresModal").text();
  let Apellidos = row.find("#ApellidosModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idAlumno").val(idAlumno);
      $("#DNI").val(DNI);
      $("#Nombres").val(Nombres);
      $("#Apellidos").val(Apellidos);
    }
  })
  })
})

$(function() {
  $('table').on('click', '#Seleccionar1', function(e){
	  e.preventDefault(); 
 let row = $(this).closest('tr');
  let idCurso = row.find("#idCursoModal").text();
  let Curso = row.find("#CursoModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idCurso").val(idCurso);
      $("#Curso").val(Curso);
    }
  })
  })
})

$(function() {
  $('table').on('click', '#Seleccionar2', function(e){
	  e.preventDefault(); 
 let row = $(this).closest('tr');
  let idAlumno = row.find("#idAlumnoModal").text();
  let DNI = row.find("#DNIModal").text();
  let Nombres = row.find("#NombresModal").text();
  let Apellidos = row.find("#ApellidosModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idAlumnoM").val(idAlumno);
      $("#DNI").val(DNI);
      $("#Nombres").val(Nombres);
      $("#Apellidos").val(Apellidos);
    }
  })
  })
})

$(function() {
  $('table').on('click', '#Seleccionar3', function(e){
	  e.preventDefault(); 
 let row = $(this).closest('tr');
  let idCurso = row.find("#idCursoModal").text();
  let Curso = row.find("#CursoModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idCursoM").val(idCurso);
      $("#Curso").val(Curso);
    }
  })
  })
})
