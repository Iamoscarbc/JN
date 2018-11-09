package DAO;
import java.util.ArrayList;
import Bean.BeanMatricula;
import util.ToolLista;

public interface DaoMatricula
{
	public void ingresar (BeanMatricula ma) throws Exception;
	public void modificar (BeanMatricula ma) throws Exception;
	public void eliminar(BeanMatricula ma) throws Exception;
	public ArrayList<BeanMatricula> lista() throws Exception;
	public ToolLista listarUsuarios() throws Exception;
}
