package DAO;

import java.util.ArrayList;
import util.ToolLista;
import Bean.BeanEmpleado;

public interface DaoEmpleado 
{
	public void ingresar (BeanEmpleado ep) throws Exception;
	public void modificar (BeanEmpleado ep) throws Exception;
	public void eliminar (BeanEmpleado ep) throws Exception;
	public ArrayList<BeanEmpleado> lista() throws Exception;
	public ToolLista listarEmpleados() throws Exception;
}
