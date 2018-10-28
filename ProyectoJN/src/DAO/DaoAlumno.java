package DAO;
import java.util.ArrayList;
import Bean.BeanAlumno;
import util.ToolLista;

public interface DaoAlumno 
{
	public void ingresar (BeanAlumno al) throws Exception;
	public void modificar (BeanAlumno al) throws Exception;
	public void eliminar(BeanAlumno al) throws Exception;
	public ArrayList<BeanAlumno> lista() throws Exception;
	public ToolLista listarUsuarios() throws Exception;
}
