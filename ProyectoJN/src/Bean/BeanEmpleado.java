package Bean;

import util.Bean;

public class BeanEmpleado extends Bean
{
	String idEmpleado; 
	String idUsuario;
	String DNI;
	String Nombres;
	String Apellidos;
	String Direccion;
	String Telefono;
	String Edad;
	String Sexo;
	public BeanEmpleado(String idEmpleado, String idUsuario, String dNI, String nombres, String apellidos,
			String direccion, String telefono, String edad, String sexo) {
		super();
		this.idEmpleado = idEmpleado;
		this.idUsuario=idUsuario;
		DNI = dNI;
		Nombres = nombres;
		Apellidos = apellidos;
		Direccion = direccion;
		Telefono = telefono;
		Edad = edad;
		Sexo = sexo;
	}
	public BeanEmpleado() {}
	public String getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(String idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public String getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
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
	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
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
	public void setEdad(String edad) {
		Edad = edad;
	}
	public String getSexo() {
		return Sexo;
	}
	public void setSexo(String sexo) {
		Sexo = sexo;
	}
		
}
