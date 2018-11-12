let descargarPDF = document.querySelector('#descargarPDF');


descargarPDF.addEventListener('click', () => {
	const tabla = document.querySelector('#tablaAlumnos2')
		tabla.style.display = 'block'
	const loadingPDF = document.querySelector('#loadingPDF')
			loadingPDF.style.display = 'block'
		setTimeout( function () {
			let doc = new jsPDF('p','pt','a4');
			doc.addHTML(tabla, function() {
				doc.save('Alumnos.pdf');
			});

			setTimeout( () => {
				tabla.style.display = 'none'
				loadingPDF.style.display = 'none'
			}, 500 )
		}, 1500)


} )
