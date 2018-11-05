package mysql;

import util.SqlDBConn;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import util.ToolLista;

import Bean.BeanEmpleado;
import DAO.DaoEmpleado;

public class Sql_Empleado implements DaoEmpleado 
{
	
	private final  SqlDBConn mysql;
	String SQL="";
	String pass="";
	int i=0;
	
	public Sql_Empleado() 
	{
		this.mysql = new SqlDBConn();
	}
	//
	
	//Ingresar///////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void ingresar(BeanEmpleado ep) throws Exception 
	{
		SQL="INSERT INTO empleado (idUsuario, DNI, Nombres, Apellidos, Direccion, Telefono, Edad, Sexo) VALUES(?,?,?,?,?,?,?,?)";
		mysql.establecerConexion();
		Connection conectado = (Connection) mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = (PreparedStatement) conectado.prepareStatement(SQL);
			
			
			pst.setString(1, ep.getIdUsuario());
			pst.setString(2, ep.getDNI());
			pst.setString(3, ep.getNombres());
			pst.setString(4, ep.getApellidos());			
			pst.setString(5, ep.getDireccion());
			pst.setString(6, ep.getTelefono());
			pst.setString(7, ep.getEdad());
			pst.setString(8, ep.getSexo());		
			
			pst.executeUpdate();
			
			System.out.println("Se ha ingresado: "+ep.getIdUsuario()+" / "+ep.getDNI()+" / "+ep.getNombres()+" / "+ep.getApellidos()
			+" / "+ep.getDireccion()+" / "+ep.getTelefono()+" / "+ep.getEdad()+"/"+ep.getSexo());
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
	}

	
	//Actualizar o modificar////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public void modificar(BeanEmpleado ep) throws Exception 
	{
		SQL="UPDATE empleado SET idUsuario=?, DNI=?, Nombres=?, Apellidos=?, Direccion=?, Telefono=?, Edad=?, Sexo=? where idEmpleado=?";
		mysql.establecerConexion();
		Connection conectado = (Connection) mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = (PreparedStatement) conectado.prepareStatement(SQL);
			
			pst.setString(1, ep.getIdUsuario());
			pst.setString(2, ep.getDNI());
			pst.setString(3, ep.getNombres());
			pst.setString(4, ep.getApellidos());
			pst.setString(5, ep.getDireccion());
			pst.setString(6, ep.getTelefono());
			pst.setString(7, ep.getEdad());
			pst.setString(8, ep.getSexo());
			pst.setString(9, ep.getIdEmpleado());
			
			pst.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
	}
	
	//Eliminar//////////////////////////////////
	public void eliminar(BeanEmpleado ep) throws Exception
	{
		SQL="DELETE FROM empleado where idEmpleado=?";
		mysql.establecerConexion();
		Connection conectado = (Connection) mysql.getConnection();
	
	try 
	{
		PreparedStatement pst = (PreparedStatement) conectado.prepareStatement(SQL);
		pst.setString(1, ep.getIdEmpleado());
		pst.executeUpdate();
	} catch (Exception e) 
	{
		e.printStackTrace();
	}finally 
	{
		mysql.cerrarConexion();
	}
	
	}
	//Listar//////////////////////////////////
	@Override
	public ArrayList<BeanEmpleado> lista() throws Exception
	{
		ArrayList<BeanEmpleado> lista = new ArrayList<BeanEmpleado>();
		SQL="SELECT * FROM empleado";
		mysql.establecerConexion();
		Connection conectado = (Connection) mysql.getConnection();
		BeanEmpleado ep= new BeanEmpleado();
		
		try 
		{
			PreparedStatement pst = (PreparedStatement) conectado.prepareStatement(SQL);
			ResultSet rst = pst.executeQuery();
			
			while(rst.next()) 
			{
				ep.setIdEmpleado(rst.getString("idEmpleado"));
				ep.setIdUsuario(rst.getString("idUsuario"));
				ep.setDNI(rst.getString("DNI"));
				ep.setNombres(rst.getString("Nombres"));
				ep.setApellidos(rst.getString("Apellidos"));
				ep.setDireccion(rst.getString("Direccion"));
				ep.setTelefono(rst.getString("Telefono"));
				ep.setEdad(rst.getString("Edad"));
				ep.setSexo(rst.getString("Sexo"));
				lista.add(ep);
				
				System.out.println(lista.get(i).getIdEmpleado()+" / "+lista.get(i).getIdUsuario()+" /  "+lista.get(i).getDNI()
						+" / "+lista.get(i).getNombres()+" / "+lista.get(i).getApellidos()+" / "+lista.get(i).getDireccion()
						+" / "+lista.get(i).getTelefono()+" / "+lista.get(i).getEdad()+" / "+lista.get(i).getSexo());
				i++;
			}
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return lista;
	}
	@Override
	public ToolLista listarEmpleados() throws Exception 
	{
		ToolLista lis_usu=new ToolLista();
		BeanEmpleado bean=null;
		String sql="SELECT * FROM empleado";
		mysql.establecerConexion();
		Connection conectado = (Connection) mysql.getConnection();
		ResultSet rst;
		PreparedStatement stm=(PreparedStatement) conectado.prepareStatement(sql);
		rst=stm.executeQuery(sql);
		
		while(rst.next())
		{	bean=new BeanEmpleado();
		
			bean.setIdEmpleado(rst.getString(1));
			bean.setIdUsuario(rst.getString(2));
			bean.setDNI(rst.getString(3));
			bean.setNombres(rst.getString(4));
			bean.setApellidos(rst.getString(5));			
			bean.setDireccion(rst.getString(6));
			bean.setTelefono(rst.getString(7));
			bean.setEdad(rst.getString(8));
			bean.setSexo(rst.getString(9));
			
			lis_usu.setElemento(bean);
		}
		
		rst.close();
		stm.close();
		conectado.close();
		
		return lis_usu;
	}
	
	/*public static void main(String [] arg) 
	{
		BeanEmpleado pr = new BeanEmpleado();
		Sql_Empleado dpi= new Sql_Empleado();
		
		pr.setIdEmpleado("1");
		pr.setIdUsuario("1");
		pr.setDNI("73260012");
		pr.setNombres("Oscar");
		pr.setApellidos("Bravo");
		pr.setDireccion("asdasd");
		pr.setTelefono("956562656");
		pr.setEdad("17");
		pr.setSexo("Mas");
		
		try
		{
			dpi.eliminar(pr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
		
		
	


