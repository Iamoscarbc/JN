package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SqlDBConn 
{       
        private Connection connection;
	private String url;
	private String user;
	private String contra;
	private String driver;
	
	public SqlDBConn() {
		this.url="jdbc:mysql://localhost:3306/jn";
		this.user="root";
		this.contra="";
		this.driver="com.mysql.jdbc.Driver";
	}

	public String getUrl() {
		return url;
	}

	public String getUser() {
		return user;
	}

	public String getContra() {
		return contra;
	}

	public String getDriver() {
		return driver;
	}	
	
        public Connection getConnection(){
        return connection;
        }

        public void setConnection(Connection connection){
            this.connection = connection;
        }

        public void establecerConexion(){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection =  (Connection) DriverManager.getConnection(url, user, contra);
                System.out.println("Conexion Exitosa");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(SqlDBConn.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
            } catch (SQLException ex) {
                Logger.getLogger(SqlDBConn.class.getName()).log(Level.SEVERE, null, ex);
            }
            catch (RuntimeException e) 
            {
                    e.printStackTrace();
            }
        }

        public void cerrarConexion(){
            try {
                connection.close();
                System.out.println("Conexion cerrada");
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }
}
