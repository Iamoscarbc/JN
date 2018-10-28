package DAO;
import java.util.ArrayList;
import Bean.BeanPago;
import util.ToolLista;

public interface DaoPago 
{
	public void ingresar (BeanPago pa) throws Exception;
	public void modificar (BeanPago pa) throws Exception;
	public void eliminar(BeanPago pa) throws Exception;
	public ArrayList<BeanPago> lista() throws Exception;
	public ToolLista listarUsuarios() throws Exception;
}
