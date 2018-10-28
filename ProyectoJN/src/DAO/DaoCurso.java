package DAO;

import java.util.ArrayList;

import Bean.BeanCurso;
import util.ToolLista;

public interface DaoCurso {
	
	public void ingresar (BeanCurso cu) throws Exception;
	public void modificar (BeanCurso cu) throws Exception;
	public void eliminar(BeanCurso cu) throws Exception;
	public ArrayList<BeanCurso> lista() throws Exception;
	public ToolLista listarUsuarios() throws Exception;

}
