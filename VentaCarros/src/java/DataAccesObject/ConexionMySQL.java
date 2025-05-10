package DataAccesObject;

import java.sql.DriverManager;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.sql.Connection;

public class ConexionMySQL {
    private String conexionURL = "jdbc:mysql://b8ro93vd0ut4z7efwbni-mysql.services.clever-cloud.com:3306/b8ro93vd0ut4z7efwbni";
    private String usuario = "ubuygsynfn4ovpdd";
    private String contrasena = "6UMdhS1xK1Md1aBZTEoB";
    private Connection conexion;

    public static void main(String[] args){
        ConexionMySQL cn = new ConexionMySQL();
    }

    public ConexionMySQL(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            DriverManager.setLoginTimeout(300);
            conexion = DriverManager.getConnection(conexionURL, usuario, contrasena);
            if(conexion != null){
                DatabaseMetaData dm = conexion.getMetaData();
                System.out.println("Nombre del producto: " + dm.getDatabaseProductName());
                System.out.println("Versión: " + dm.getDatabaseProductVersion());
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexión: " + e.getMessage());
        }
    }

    public Connection getConexion(){
        return conexion;
    }
}