package Bean;

import util.Bean;

public class BeanMatricula extends Bean{
	String idMatricula;
	String idEmpleado;
	String idAlumno;
	String idPagos;
	String Fecha_Matricula;
	
	public BeanMatricula() {
		super();
	}

	public BeanMatricula(String idMatricula, String idEmpleado, String idAlumno, String idPagos,
			String fecha_Matricula) {
		super();
		this.idMatricula = idMatricula;
		this.idEmpleado = idEmpleado;
		this.idAlumno = idAlumno;
		this.idPagos = idPagos;
		Fecha_Matricula = fecha_Matricula;
	}

	public String getIdMatricula() {
		return idMatricula;
	}

	public void setIdMatricula(String idMatricula) {
		this.idMatricula = idMatricula;
	}

	public String getIdEmpleado() {
		return idEmpleado;
	}

	public void setIdEmpleado(String idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	public String getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(String idAlumno) {
		this.idAlumno = idAlumno;
	}

	public String getIdPagos() {
		return idPagos;
	}

	public void setIdPagos(String idPagos) {
		this.idPagos = idPagos;
	}

	public String getFecha_Matricula() {
		return Fecha_Matricula;
	}

	public void setFecha_Matricula(String fecha_Matricula) {
		Fecha_Matricula = fecha_Matricula;
	}
	
}
