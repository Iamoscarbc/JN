$(function() {
  $('table').on('click', '#Rellenar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idAlumno = row.find("#idAlumno1").text();
  $.ajax({
    success: function(response)
    {
      $("#idAlumnoE").val(idAlumno);
    }
  })
  })
})
