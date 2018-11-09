package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DAO.DaoNotas;
import util.SqlDBConn;
import util.ToolLista;
import Bean.BeanNotas;

public class Sql_Notas implements DaoNotas {

	private final  SqlDBConn mysql;
	String SQL="";
	int i=0;
	public Sql_Notas()
	{
		this.mysql = new SqlDBConn();
	}

	@Override
	public void ingresar(BeanNotas no) throws Exception
	{
		SQL="INSERT INTO notas (idCurso, idAlumno, Bim_1, Bim_2, Bim_3, Bim_4) VALUES(?,?,?,?,?,?)";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, no.getIdCurso());
			pst.setString(2, no.getIdAlumno());
			pst.setString(3, no.getBim_1());
			pst.setString(4, no.getBim_2());
			pst.setString(5, no.getBim_3());
			pst.setString(6, no.getBim_4());
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
	public void modificar(BeanNotas no) throws Exception
	{
		SQL="UPDATE notas SET idCurso=?, idAlumno=?, Bim_1=?, Bim_2=?, Bim_3=?, Bim_4=?  where idNotas=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, no.getIdCurso());
			pst.setString(2, no.getIdAlumno());
			pst.setString(3, no.getBim_1());
			pst.setString(4, no.getBim_2());
			pst.setString(5, no.getBim_3());
			pst.setString(6, no.getBim_4());
			pst.setString(7, no.getIdNotas());
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
	public void eliminar(BeanNotas no) throws Exception
	{
		SQL="DELETE FROM notas where idNotas=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, no.getIdNotas());
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
	public ArrayList<BeanNotas> lista() throws Exception
	{
		ArrayList<BeanNotas> lista = new ArrayList<BeanNotas>();
		SQL="SELECT * FROM notas";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		BeanNotas no= new BeanNotas();

		try
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			ResultSet rst = pst.executeQuery();

			while(rst.next())
			{
				no.setIdNotas(rst.getString("idNotas"));
				no.setIdCurso(rst.getString("idCurso"));
				no.setIdAlumno(rst.getString("idAlumno"));
				no.setBim_1(rst.getString("Bim_1"));
				no.setBim_2(rst.getString("Bim_2"));
				no.setBim_3(rst.getString("Bim_3"));
				no.setBim_4(rst.getString("Bim_4"));
				lista.add(no);

				System.out.println(lista.get(i).getIdNotas()+" / "+lista.get(i).getIdCurso()+"/"+lista.get(i).getIdAlumno()
						+"/"+lista.get(i).getBim_1()+"/"+lista.get(i).getBim_2()+"/"+lista.get(i).getBim_3()+"/"+lista.get(i).getBim_4());
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
		BeanNotas bean=null;
		String sql="SELECT * FROM notas";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		ResultSet rst;
		PreparedStatement stm=conectado.prepareStatement(sql);
		rst=stm.executeQuery(sql);

		while(rst.next())
		{	bean=new BeanNotas();

			bean.setIdNotas(rst.getString(1));
			bean.setIdCurso(rst.getString(2));
			bean.setIdAlumno(rst.getString(3));
			bean.setBim_1(rst.getString(4));
			bean.setBim_2(rst.getString(5));
			bean.setBim_3(rst.getString(6));
			bean.setBim_4(rst.getString(7));

			lis_usu.setElemento(bean);
		}

		rst.close();
		stm.close();
		conectado.close();

		return lis_usu;
	}
	
	/*public static void main (String [] args)
	 {
		 BeanNotas no = new BeanNotas();
		 Sql_Notas dni = new Sql_Notas();
		 
		 no.setIdNotas("2");
		 no.setIdCurso("1");
		 no.setIdAlumno("1");
		 no.setBim_1("13");
		 no.setBim_2("14");
		 no.setBim_3("15");
		 no.setBim_4("16");
		 
		 try {
			dni.eliminar(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	 }*/
}
