package DataAccessObject;

import BusinessEntity.VentaBE;
import java.sql.*;
import java.util.ArrayList;

public class VentaDAO extends ConexionMySQL implements IBaseDAO<VentaBE> {

    @Override
    public boolean Create(VentaBE venta) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO Ventas (id_cliente, id_usuario, total, estado, comentarios, medio_venta) VALUES (?,?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, venta.getIdCliente());
            pst.setInt(2, venta.getIdUsuario());
            pst.setDouble(3, venta.getTotal());
            pst.setString(4, venta.getEstado());
            pst.setString(5, venta.getComentarios());
            pst.setString(6, venta.getMedioVenta());
            resultado = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Create Venta: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public VentaBE Read(String id) {
        VentaBE venta = new VentaBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Ventas WHERE id_venta=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                venta.setIdVenta(rs.getInt("id_venta"));
                venta.setIdCliente(rs.getInt("id_cliente"));
                venta.setIdUsuario(rs.getInt("id_usuario"));
                venta.setFechaVenta(rs.getTimestamp("fecha_venta"));
                venta.setTotal(rs.getDouble("total"));
                venta.setEstado(rs.getString("estado"));
                venta.setComentarios(rs.getString("comentarios"));
                venta.setMedioVenta(rs.getString("medio_venta"));
            }
        } catch(SQLException e){
            System.out.println("Error en Read Venta: " + e.getMessage());
        }
        return venta;
    }

    @Override
    public ArrayList<VentaBE> ReadAll() {
        ArrayList<VentaBE> listaVentas = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Ventas");
            while(rs.next()){
                VentaBE venta = new VentaBE();
                venta.setIdVenta(rs.getInt("id_venta"));
                venta.setIdCliente(rs.getInt("id_cliente"));
                venta.setIdUsuario(rs.getInt("id_usuario"));
                venta.setFechaVenta(rs.getTimestamp("fecha_venta"));
                venta.setTotal(rs.getDouble("total"));
                venta.setEstado(rs.getString("estado"));
                venta.setComentarios(rs.getString("comentarios"));
                venta.setMedioVenta(rs.getString("medio_venta"));
                listaVentas.add(venta);
            }
        } catch(SQLException e) {
            System.out.println("Error en ReadAll Venta: " + e.getMessage());
        }
        return listaVentas;
    }

    @Override
    public boolean Update(VentaBE venta) {
        boolean resultado = false;
        try {
            String SQL = "UPDATE Ventas SET id_cliente=?, id_usuario=?, total=?, estado=?, comentarios=?, medio_venta=? WHERE id_venta=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, venta.getIdCliente());
            pst.setInt(2, venta.getIdUsuario());
            pst.setDouble(3, venta.getTotal());
            pst.setString(4, venta.getEstado());
            pst.setString(5, venta.getComentarios());
            pst.setString(6, venta.getMedioVenta());
            pst.setInt(7, venta.getIdVenta());
            resultado = pst.executeUpdate() > 0;
        } catch(SQLException e){
            System.out.println("Error en Update Venta: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public boolean Delete(String id) {
        boolean resultado = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Ventas WHERE id_venta=?");
            pst.setInt(1, Integer.parseInt(id));
            resultado = pst.executeUpdate()>0;
        } catch(SQLException e){
            System.out.println("Error en Delete Venta: " + e.getMessage());
        }
        return resultado;
    }
}