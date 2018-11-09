$(function() {
  $('table').on('click', '#Rellenar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idMatriculaE = row.find("#idMatricula1").text();
  $.ajax({
    success: function(response)
    {
      $("#idMatriculaE").val(idMatriculaE);
    }
  })
  })
})
