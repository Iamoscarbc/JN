$(function() {
  $('table').on('click', '#Editar', function(e){
	  e.preventDefault(); 
  let row = $(this).closest('tr');
  let idPagos = row.find("#idPagos1").text();
  let idAlumno = row.find("#idAlumno1").text();
  let DNI_R = row.find("#DNI_R1").text();
  let Concepto = row.find("#Concepto1").text();
  let Importe = row.find("#Importe1").text();
  let Fecha_Pago = row.find("#Fecha_Pago1").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idPagos").val(idPagos);
      $("#idAlumnoM").val(idAlumno);
      $("#DNI_R").val(DNI_R);
      $("#Concepto").val(Concepto);
      $("#Importe").val(Importe);
      $("#Fecha_Pago").val(Fecha_Pago);
    }
  })
  })
})