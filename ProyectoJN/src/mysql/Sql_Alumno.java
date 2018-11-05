package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.BeanAlumno;
import DAO.DaoAlumno;
import util.SqlDBConn;
import util.ToolLista;


public class Sql_Alumno implements DaoAlumno {

	
	private final  SqlDBConn mysql;
	String SQL="";
	int i=0;
	public Sql_Alumno() 
	{
		this.mysql = new SqlDBConn();
	}
	
	public void ingresar(BeanAlumno al) throws Exception 
	{
		
		SQL="INSERT INTO alumno (DNI, Nombres, Apellidos, Direccion, Telefono, Edad, Grado, Sexo) VALUES(?,?,?,?,?,?,?,?)";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, al.getDNI());
			pst.setString(2, al.getNombres());
			pst.setString(3, al.getApellidos());
			pst.setString(4, al.getDireccion());
			pst.setString(5, al.getTelefono());
			pst.setString(6, al.getEdad());
			pst.setString(7, al.getGrado());
			pst.setString(8, al.getSexo());
			pst.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
	}

	public void modificar(BeanAlumno al) throws Exception 
	{
		SQL="UPDATE alumno SET DNI=?, Nombres=?, Apellidos=?, Direccion=?, Telefono=?, Edad=?, Grado=?, Sexo=? where idAlumno=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, al.getDNI());
			pst.setString(2, al.getNombres());
			pst.setString(3, al.getApellidos());
			pst.setString(4, al.getDireccion());
			pst.setString(5, al.getTelefono());
			pst.setString(6, al.getEdad());
			pst.setString(7, al.getGrado());
			pst.setString(8, al.getSexo());
			pst.setString(9, al.getIdAlumno());
			pst.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
		// TODO Auto-generated method stub
		
	}

	public void eliminar(BeanAlumno al) throws Exception 
	{
		SQL="DELETE FROM alumno where idAlumno=?";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			pst.setString(1, al.getIdAlumno());
			pst.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			mysql.cerrarConexion();
		}
		
	}

	public ArrayList<BeanAlumno> lista() throws Exception 
	{
		ArrayList<BeanAlumno> lista = new ArrayList<BeanAlumno>();
		SQL="SELECT * FROM alumno";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		BeanAlumno al= new BeanAlumno();
		
		try 
		{
			PreparedStatement pst = conectado.prepareStatement(SQL);
			ResultSet rst = pst.executeQuery();
			
			while(rst.next()) 
			{
				al.setIdAlumno(rst.getString("idAlumno"));
				al.setDNI(rst.getString("DNI"));
				al.setNombres(rst.getString("Nombres"));
				al.setApellidos(rst.getString("Apellidos"));
				al.setDireccion(rst.getString("Direccion"));
				al.setTelefono(rst.getString("Telefono"));
				al.setEdad(rst.getString("Edad"));
				al.setGrado(rst.getString("Grado"));
				al.setSexo(rst.getString("Sexo"));
				lista.add(al);
				
				System.out.println(lista.get(i).getIdAlumno()+" / "+lista.get(i).getDNI()+" / "+lista.get(i).getNombres()
						+" /  "+lista.get(i).getApellidos()+" /  "+lista.get(i).getDireccion()
						+" /  "+lista.get(i).getTelefono()+" /  "+lista.get(i).getEdad()
						+" /  "+lista.get(i).getGrado()+ " / "+lista.get(i).getSexo());
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
		BeanAlumno bean=null;
		String sql="SELECT * FROM alumno";
		mysql.establecerConexion();
		Connection conectado = mysql.getConnection();
		ResultSet rst;
		PreparedStatement stm=conectado.prepareStatement(sql);
		rst=stm.executeQuery(sql);
		
		while(rst.next())
		{	bean=new BeanAlumno();
			
			bean.setIdAlumno(rst.getString(1));
			bean.setDNI(rst.getString(2));
			bean.setNombres(rst.getString(3));
			bean.setApellidos(rst.getString(4));
			bean.setDireccion(rst.getString(5));
			bean.setTelefono(rst.getString(6));
			bean.setEdad(rst.getString(7));
			bean.setGrado(rst.getString(8));
			bean.setSexo(rst.getString(9));
			
			lis_usu.setElemento(bean);
		}
		
		rst.close();
		stm.close();
		conectado.close();
		
		return lis_usu;
	}
	
	
	

}
