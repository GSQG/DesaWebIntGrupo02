package DataAccessObject;

import java.sql.DriverManager;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.sql.Connection;

public class ConexionMySQL {
    private String conexionURL = "jdbc:mysql://root:TlNWjnqPJVHHkuUyCDWPavBbAoQaHhag@shortline.proxy.rlwy.net:54266/railway";
    private String usuario = "root";
    private String contrasena = "TlNWjnqPJVHHkuUyCDWPavBbAoQaHhag";
    private Connection conexion;

    public static void main(String[] args){
        new ConexionMySQL();
    }

    public ConexionMySQL(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            DriverManager.setLoginTimeout(300);
            conexion = DriverManager.getConnection(conexionURL, usuario, contrasena);

            if(conexion != null){
                DatabaseMetaData dm = conexion.getMetaData();
                System.out.println("Nombre del producto: " + dm.getDatabaseProductName());
                System.out.println("Versión: " + dm.getDatabaseProductVersion());
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexión: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public Connection getConexion(){
        return conexion;
    }
}