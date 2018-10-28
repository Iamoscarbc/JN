package Bean;
import util.Bean;

public class BeanCurso extends Bean {
	String idCurso;
	String Curso;
	public BeanCurso() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BeanCurso(String idCurso, String curso) {
		super();
		this.idCurso = idCurso;
		Curso = curso;
	}
	public String getIdCurso() {
		return idCurso;
	}
	public void setIdCurso(String idCurso) {
		this.idCurso = idCurso;
	}
	public String getCurso() {
		return Curso;
	}
	public void setCurso(String curso) {
		Curso = curso;
	}
	
	
	
}
