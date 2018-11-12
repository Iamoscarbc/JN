$(function() {
  $('table').on('click', '#Editar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idNotas = row.find("#idNotas1").text();
  let idCurso = row.find("#idCurso1").text();
  let idAlumno = row.find("#idAlumno1").text();
  let Bim_1 = row.find("#Bim_11").text();
  let Bim_2 = row.find("#Bim_21").text();
  let Bim_3 = row.find("#Bim_31").text();
  let Bim_4 = row.find("#Bim_41").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idNotas").val(idNotas);
      $("#idCursoM").val(idCurso);
      $("#idAlumnoM").val(idAlumno);
      $("#Bim_1").val(Bim_1);
      $("#Bim_2").val(Bim_2);
      $("#Bim_3").val(Bim_3);
      $("#Bim_4").val(Bim_4);
    }
  })
  })
})