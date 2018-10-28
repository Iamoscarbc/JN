package util;
import java.util.ArrayList;

import Bean.BeanCurso;

public class ToolLista
{
	protected ArrayList lista = new ArrayList();
	/*tamaño del 1 al numPagina*/
	private int numPagina;
	private int tamPagina;
	
	public int getTamanio() {
		return lista.size();
	}
	
	public void setElemento(Bean elemento) 
	{
		try 
		{lista.set(lista.size(), elemento);} 
		catch (Exception e) 
		{lista.add(elemento);}
	}
	
	public Bean getElemento(int index) 
	{
		Bean elemento = null;
		try {
			elemento = (Bean) lista.get(index + tamPagina * numPagina);
		} catch (Exception e) {
			System.out.println("getElemento" + e);
		}
		return elemento;
	}
	
	
}