package Factory;

import DAO.DaoAlumno;
import DAO.DaoCurso;
import DAO.DaoEmpleado;
import DAO.DaoNotas;
import DAO.DaoPago;
import DAO.DaoMatricula;

public abstract class FactoryDao {
	
	public abstract DaoAlumno getDao_Alumno();
	public abstract DaoCurso getDao_Curso();
	public abstract DaoEmpleado getDao_Empleado();
	public abstract DaoNotas getDao_Notas();
	public abstract DaoPago getDao_Pago();
	public abstract DaoMatricula getDao_Matricula();
}
