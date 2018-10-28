package Bean;

import java.sql.*;

import util.SqlDBConn;


public class Acceso 
{
	SqlDBConn db = new SqlDBConn();
	String sql="";
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	
	public Acceso() {
		
	}
	
	public int validar(String usuario, String contra) 
	{ int tipo=0;
		try {
			Class.forName(db.getDriver());
			con=DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
			sql=" select idTipo from usuario where Usuario='"+usuario+"' and Password='"+contra+"'";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				tipo=rs.getInt(1);
			}
			con.close();
			rs.close();
			return tipo;
					
		} catch (SQLException | ClassNotFoundException e) {
			return tipo;
		}		
	}
	
}
