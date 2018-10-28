package DAO;
import java.util.ArrayList;

import Bean.BeanNotas;
import util.ToolLista;

public interface DaoNotas 
{
	public void ingresar (BeanNotas al) throws Exception;
	public void modificar (BeanNotas al) throws Exception;
	public void eliminar(BeanNotas al) throws Exception;
	public ArrayList<BeanNotas> lista() throws Exception;
	public ToolLista listarUsuarios() throws Exception;
}
