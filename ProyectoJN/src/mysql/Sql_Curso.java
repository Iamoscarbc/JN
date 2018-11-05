package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.BeanCurso;
import util.SqlDBConn;
import util.ToolLista;

public class Sql_Curso {

	private final  SqlDBConn mysql;
	String SQL="";
	int i=0;
	public Sql_Curso() 
	{
		this.mysql = new SqlDBConn();
	}
	
	
	public void ingresar(BeanCurso cu) throws Exception {
		SQL="INSERT INTO curso (Nombre) VALUES(?)";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, cu.getCurso());
			
			pst.executeUpdate();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
		
	}

	public void modificar(BeanCurso cu) throws Exception {
		SQL="UPDATE curso SET Nombre=? where idCurso=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, cu.getCurso());
			pst.setString(2, cu.getIdCurso());
			
			pst.executeUpdate();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
	}

	public void eliminar(BeanCurso cu) throws Exception {
		SQL="DELETE FROM curso where idCurso=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, cu.getIdCurso());
			pst.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
		
	}

	public ArrayList<BeanCurso> lista() throws Exception {
		ArrayList<BeanCurso> lista = new ArrayList<BeanCurso>();
		SQL="SELECT * FROM curso";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		BeanCurso cu = new BeanCurso();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			ResultSet rst = pst.executeQuery();
			
			while(rst.next()) 
			{
				cu.setIdCurso(rst.getString("idCurso"));
				cu.setCurso(rst.getString("Curso"));
				lista.add(cu);
				
				System.out.println(lista.get(i).getIdCurso()+" / "+lista.get(i).getCurso());
				i++;
			}
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public ToolLista listarUsuarios() throws Exception {
		
		ToolLista lis_usu=new ToolLista();
		BeanCurso bean= null;
		String sql="SELECT * FROM curso";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		ResultSet rst;
		PreparedStatement stm=conectado.prepareStatement(sql);
		rst=stm.executeQuery(sql);
		
		while(rst.next())
		{	bean=new BeanCurso();
			
			bean.setIdCurso(rst.getString(1));
			bean.setCurso(rst.getString(2));
			
			lis_usu.setElemento(bean);
		}
		
		rst.close();
		stm.close();
		conectado.close();
		
		return lis_usu;
	}
	
}
