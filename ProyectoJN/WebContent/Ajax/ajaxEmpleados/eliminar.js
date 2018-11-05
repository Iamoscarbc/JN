$(function() {
  $('table').on('click', '#Rellenar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idEmpleado = row.find("#idEmpleado1").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idEmpleadoE").val(idEmpleado);
    }
  })
  })
})
