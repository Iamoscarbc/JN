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
  let idEmpleadoModal = row.find("#idEmpleadoModal").text();
  let DNI_EModal = row.find("#DNI_EModal").text();
  let Nombres_EModal = row.find("#Nombres_EModal").text();
  let Apellidos_EModal = row.find("#Apellidos_EModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idEmpleado").val(idEmpleadoModal);
      $("#DNI_E").val(DNI_EModal);
      $("#Nombres_E").val(Nombres_EModal);
      $("#Apellidos_E").val(Apellidos_EModal);
    }
  })
  })
})

$(function() {
  $('table').on('click', '#Seleccionar2', function(e){
	  e.preventDefault(); 
 let row = $(this).closest('tr');
  let idPagosModal = row.find("#idPagosModal").text();
  let idAlumno_PModal = row.find("#idAlumno_PModal").text();
  let DNI_RModal = row.find("#DNI_RModal").text();
  let ConceptoModal = row.find("#ConceptoModal").text();
  let ImporteModal = row.find("#ImporteModal").text();
  let Fecha_PagoModal = row.find("#Fecha_PagoModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idPagos").val(idPagosModal);
      $("#idAlumno").val(idAlumno_PModal);
      $("#DNI_R").val(DNI_RModal);
      $("#Concepto").val(ConceptoModal);
      $("#Importe").val(ImporteModal);
      $("#Fecha_Pago").val(Fecha_PagoModal);
    }
  })
  })
})

$(function() {
  $('table').on('click', '#Seleccionar3', function(e){
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
  $('table').on('click', '#Seleccionar4', function(e){
	  e.preventDefault(); 
 let row = $(this).closest('tr');
  let idEmpleadoModal = row.find("#idEmpleadoModal").text();
  let DNI_EModal = row.find("#DNI_EModal").text();
  let Nombres_EModal = row.find("#Nombres_EModal").text();
  let Apellidos_EModal = row.find("#Apellidos_EModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idEmpleadoM").val(idEmpleadoModal);
      $("#DNI_E").val(DNI_EModal);
      $("#Nombres_E").val(Nombres_EModal);
      $("#Apellidos_E").val(Apellidos_EModal);
    }
  })
  })
})

$(function() {
  $('table').on('click', '#Seleccionar5', function(e){
	  e.preventDefault(); 
 let row = $(this).closest('tr');
  let idPagosModal = row.find("#idPagosModal").text();
  let idAlumno_PModal = row.find("#idAlumno_PModal").text();
  let DNI_RModal = row.find("#DNI_RModal").text();
  let ConceptoModal = row.find("#ConceptoModal").text();
  let ImporteModal = row.find("#ImporteModal").text();
  let Fecha_PagoModal = row.find("#Fecha_PagoModal").text();
  
  $.ajax({
    success: function(response)
    {
      $("#idPagosM").val(idPagosModal);
      $("#idAlumnoM").val(idAlumno_PModal);
      $("#DNI_R").val(DNI_RModal);
      $("#Concepto").val(ConceptoModal);
      $("#Importe").val(ImporteModal);
      $("#Fecha_Pago").val(Fecha_PagoModal);
    }
  })
  })
})