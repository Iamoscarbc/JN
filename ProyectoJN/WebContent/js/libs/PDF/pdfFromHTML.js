let descargarPDF = document.querySelector('#descargarPDF');


descargarPDF.addEventListener('click', () => {
	const tabla = document.querySelector('#tablaMatricula2')
		tabla.style.display = 'block'

		let doc = new jsPDF('p','pt','a4');
		doc.addHTML(tabla, function() {
			doc.save('Matricula.pdf');
		});

	setTimeout( () => {
		tabla.style.display = 'none'

	}, 500 )
} )
