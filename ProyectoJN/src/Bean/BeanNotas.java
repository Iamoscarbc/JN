package Bean;

import util.Bean;

public class BeanNotas extends Bean
{
	String idNotas;
	String idCurso;
	String idAlumno;
	String Bim_1;
	String Bim_2;
	String Bim_3;
	String Bim_4;

	public BeanNotas() {
		super();
	}

	public BeanNotas(String idNotas, String idCurso, String idAlumno, String Bim_1, String Bim_2, String Bim_3, String Bim_4) {
		super();
		this.idNotas = idNotas;
		this.idCurso = idCurso;
		this.idAlumno = idAlumno;
		Bim_1= Bim_1;
		Bim_2= Bim_2;
		Bim_3= Bim_3;
		Bim_4= Bim_4;
	}

	public String getIdNotas() {
		return idNotas;
	}

	public void setIdNotas(String idNotas) {
		this.idNotas = idNotas;
	}

	public String getIdCurso() {
		return idCurso;
	}

	public void setIdCurso(String idCurso) {
		this.idCurso = idCurso;
	}

	public String getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(String idAlumno) {
		this.idAlumno = idAlumno;
	}

	public String getBim_1() {
		return Bim_1;
	}

	public void setBim_1(String bim_1) {
		Bim_1 = bim_1;
	}

	public String getBim_2() {
		return Bim_2;
	}

	public void setBim_2(String bim_2) {
		Bim_2 = bim_2;
	}

	public String getBim_3() {
		return Bim_3;
	}

	public void setBim_3(String bim_3) {
		Bim_3 = bim_3;
	}

	public String getBim_4() {
		return Bim_4;
	}

	public void setBim_4(String bim_4) {
		Bim_4 = bim_4;
	}	
}
