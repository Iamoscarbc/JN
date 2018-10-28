package Bean;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import util.Bean;

public class BeanPago extends Bean
{
	String idPagos;
	String idAlumno; 
	String DNI_R;
	String Concepto;
	String Importe;
	String Fecha_Pago;
	public BeanPago() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BeanPago(String idPagos, String idAlumno, String dNI_R, String concepto, String importe, String fecha_Pago) {
		super();
		this.idPagos = idPagos;
		this.idAlumno = idAlumno;
		DNI_R = dNI_R;
		Concepto = concepto;
		Importe = importe;
		Fecha_Pago = fecha_Pago;
	}
	public String getIdPagos() {
		return idPagos;
	}
	public void setIdPagos(String idPagos) {
		this.idPagos = idPagos;
	}
	public String getIdAlumno() {
		return idAlumno;
	}
	public void setIdAlumno(String idAlumno) {
		this.idAlumno = idAlumno;
	}
	public String getDNI_R() {
		return DNI_R;
	}
	public void setDNI_R(String dNI_R) {
		DNI_R = dNI_R;
	}
	public String getConcepto() {
		return Concepto;
	}
	public void setConcepto(String concepto) {
		Concepto = concepto;
	}
	public String getImporte() {
		return Importe;
	}
	public void setImporte(String importe) {
		Importe = importe;
	}
	public String getFecha_Pago() {
		return Fecha_Pago;
	}
	public void setFecha_Pago(String fecha_Pago) {
		Fecha_Pago = fecha_Pago;
	}
}