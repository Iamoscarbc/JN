$(function() {
  $('table').on('click', '#Rellenar', function(e){
	  e.preventDefault();  
  let row = $(this).closest('tr');
  let idPagos = row.find("#idPagos1").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idPagosE").val(idPagos);
    }
  })
  })
})
