package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.BeanPago;
import DAO.DaoPago;
import util.SqlDBConn;
import util.ToolLista;


public class Sql_Pago implements DaoPago {

	
	private final  SqlDBConn mysql;
	String SQL="";
	int i=0;
	public Sql_Pago() 
	{
		this.mysql = new SqlDBConn();
	}
	
	public void ingresar(BeanPago pa) throws Exception 
	{		
		SQL="INSERT INTO pagos (idAlumno, DNI_R, Concepto, Importe, Fecha_Pago) VALUES(?,?,?,?,?)";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, pa.getIdAlumno());
			pst.setString(2, pa.getDNI_R());
			pst.setString(3, pa.getConcepto());
			pst.setString(4, pa.getImporte());
			pst.setString(5, pa.getFecha_Pago());
			
			pst.executeUpdate();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
	}

	public void modificar(BeanPago pa) throws Exception 
	{
		SQL="UPDATE pagos SET idAlumno=?, DNI_R=?, Concepto=?, Importe=?, Fecha_Pago=? where idPagos=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, pa.getIdAlumno());
			pst.setString(2, pa.getDNI_R());
			pst.setString(3, pa.getConcepto());
			pst.setString(4, pa.getImporte());
			pst.setString(5, pa.getFecha_Pago());
            pst.setString(6, pa.getIdPagos());
            
			pst.executeUpdate();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
		
	}

	public void eliminar(BeanPago pa) throws Exception 
	{
		SQL="DELETE FROM pagos where idPagos=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, pa.getIdPagos());
			pst.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
		
	}

	public ArrayList<BeanPago> lista() throws Exception 
	{
		ArrayList<BeanPago> lista = new ArrayList<BeanPago>();
		SQL="SELECT * FROM pagos";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		BeanPago pa= new BeanPago();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			ResultSet rst = pst.executeQuery();
			
			while(rst.next()) 
			{
				pa.setIdPagos(rst.getString("idPagos"));
				pa.setIdAlumno(rst.getString("idAlumno"));
				pa.setDNI_R(rst.getString("DNI_R"));
				pa.setConcepto(rst.getString("Concepto"));
				pa.setImporte(rst.getString("Importe"));
				pa.setFecha_Pago(rst.getString("Fecha_Pago"));
				lista.add(pa);				
				System.out.println(lista.get(i).getIdPagos()+" / "+lista.get(i).getIdAlumno()+" / "+lista.get(i).getDNI_R()
						+" /  "+lista.get(i).getConcepto()+" /  "+lista.get(i).getImporte()+" /  "+lista.get(i).getFecha_Pago());
				i++;
			}
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return lista;
	}

	public ToolLista listarUsuarios() throws Exception 
	{
		ToolLista lis_usu=new ToolLista();
		BeanPago bean=null;
		String sql="SELECT * FROM pagos";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		ResultSet rst;
		PreparedStatement stm=conectado.prepareStatement(sql);
		rst=stm.executeQuery(sql);
		
		while(rst.next())
		{	bean=new BeanPago();
			
			bean.setIdPagos(rst.getString(1));
			bean.setIdAlumno(rst.getString(2));
			bean.setDNI_R(rst.getString(3));
			bean.setConcepto(rst.getString(4));
			bean.setImporte(rst.getString(5));
			bean.setFecha_Pago(rst.getString(6));
			
			lis_usu.setElemento(bean);
		}
		
		rst.close();
		stm.close();
		conectado.close();
		
		return lis_usu;
	}
}
