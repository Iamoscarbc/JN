$(function() {
  $('table').on('click', '#Rellenar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idNotas = row.find("#idNotas1").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idNotasE").val(idNotas);
    }
  })
  })
})
