package Factory;

import DAO.DaoAlumno;
import DAO.DaoCurso;
import DAO.DaoEmpleado;
import DAO.DaoNotas;
import DAO.DaoPago;

public abstract class FactoryDao {
	
	public abstract DaoAlumno getDao_Alumno();
	public abstract DaoCurso getDao_Curso();
	public abstract DaoEmpleado getDao_Empleado();
	public abstract DaoNotas getDao_Notas();
	public abstract DaoPago getDao_Pago();

}
