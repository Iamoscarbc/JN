package Bean;
import util.Bean;

public class BeanAlumno extends Bean
{
	String idAlumno;
	String DNI; 
	String Nombres;
	String Apellidos;
	String Direccion;
	String Telefono;
    String Edad;
	String Grado;
	String Sexo;
	public BeanAlumno(String idAlumno, String dNI, String nombres, String apellidos, String direccion,
			String telefono, String edad, String grado, String sexo) {
		super();
		this.idAlumno = idAlumno;
		DNI = dNI;
		Nombres = nombres;
		Apellidos = apellidos;
		Direccion = direccion;
		Telefono = telefono;
		Grado = grado;
		Edad = edad;
		Sexo=sexo;
	}
	public BeanAlumno() {}
	public String getIdAlumno() {
		return idAlumno;
	}
	public void setIdAlumno(String idAlumno) {
		this.idAlumno = idAlumno;
	}
	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
	}
	public String getNombres() {
		return Nombres;
	}
	public void setNombres(String nombres) {
		Nombres = nombres;
	}
	public String getApellidos() {
		return Apellidos;
	}
	public void setApellidos(String apellidos) {
		Apellidos = apellidos;
	}
	public String getDireccion() {
		return Direccion;
	}
	public void setDireccion(String direccion) {
		Direccion = direccion;
	}
	public String getTelefono() {
		return Telefono;
	}
	public void setTelefono(String telefono) {
		Telefono = telefono;
	}
        public String getEdad() {
		return Edad;
	}
	public void setEdad(String Edad) {
		this.Edad = Edad;
	}
        public String getGrado() {
		return Grado;
	}
	public void setGrado(String grado) {
		Grado = grado;
	}
	public String getSexo() {
		return Sexo;
	}
	public void setSexo(String sexo) {
		Sexo = sexo;
	}
	
}