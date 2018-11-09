package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.BeanMatricula;
import util.SqlDBConn;
import util.ToolLista;
import DAO.DaoMatricula;


public class Sql_Matricula implements DaoMatricula{

	private final  SqlDBConn mysql;
	String SQL="";
	int i=0;
	public Sql_Matricula()
	{
		this.mysql = new SqlDBConn();
	}
	
	@Override	
	public void ingresar(BeanMatricula ma) throws Exception {
		
		SQL="INSERT INTO matricula (idEmpleado, idAlumno, idPagos, Fecha_Matricula) VALUES(?,?,?,?)";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, ma.getIdEmpleado());
			pst.setString(2, ma.getIdAlumno());
			pst.setString(3, ma.getIdPagos());
			pst.setString(4, ma.getFecha_Matricula());
			pst.executeUpdate();
		} catch (Exception e)
		{
			e.printStackTrace();
		}finally
		{
			mysql.cerrarConexion();
		}
		
	}
	
	@Override
	public void modificar(BeanMatricula ma) throws Exception {
		
		SQL="UPDATE matricula SET idEmpleado=?, idAlumno=?, idPagos=?, Fecha_Matricula=?  where idMatricula=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, ma.getIdEmpleado());
			pst.setString(2, ma.getIdAlumno());
			pst.setString(3, ma.getIdPagos());
			pst.setString(4, ma.getFecha_Matricula());
			pst.setString(5, ma.getIdMatricula());
			pst.executeUpdate();
		} catch (Exception e)
		{
			e.printStackTrace();
		}finally
		{
			mysql.cerrarConexion();
		}
		
	}
	
	@Override
	public void eliminar(BeanMatricula ma) throws Exception {
		
		SQL="DELETE FROM matricula where idMatricula=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, ma.getIdMatricula());
			pst.executeUpdate();
		} catch (Exception e)
		{
			e.printStackTrace();
		}finally
		{
			mysql.cerrarConexion();
		}
		
	}
	
	@Override
	public ArrayList<BeanMatricula> lista() throws Exception {
		ArrayList<BeanMatricula> lista = new ArrayList<BeanMatricula>();
		SQL="SELECT * FROM matricula";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		BeanMatricula ma= new BeanMatricula();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			ResultSet rst = pst.executeQuery();

			while(rst.next())
			{
				ma.setIdMatricula(rst.getString("idMatricula"));
				ma.setIdEmpleado(rst.getString("idEmpleado"));
				ma.setIdAlumno(rst.getString("idAlumno"));
				ma.setIdPagos(rst.getString("idPagos"));
				ma.setFecha_Matricula(rst.getString("Fecha_Matricula"));
				lista.add(ma);

				System.out.println(lista.get(i).getIdMatricula()+" / "+lista.get(i).getIdEmpleado()+"/"+lista.get(i).getIdAlumno()
						+"/"+lista.get(i).getIdPagos()+"/"+lista.get(i).getFecha_Matricula());
				i++;
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return lista;
	}
	
	@Override
	public ToolLista listarUsuarios() throws Exception 
	{
		ToolLista lis_usu=new ToolLista();
		BeanMatricula bean=null;
		String sql="SELECT * FROM matricula";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		ResultSet rst;
		PreparedStatement stm=conectado.prepareStatement(sql);
		rst=stm.executeQuery(sql);

		while(rst.next())
		{	bean=new BeanMatricula();

			bean.setIdMatricula(rst.getString(1));
			bean.setIdEmpleado(rst.getString(2));
			bean.setIdAlumno(rst.getString(3));
			bean.setIdPagos(rst.getString(4));
			bean.setFecha_Matricula(rst.getString(5));

			lis_usu.setElemento(bean);
		}

		rst.close();
		stm.close();
		conectado.close();

		return lis_usu;
	}
}
