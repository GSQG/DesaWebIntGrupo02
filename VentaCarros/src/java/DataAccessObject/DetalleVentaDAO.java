package DataAccessObject;

import BusinessEntity.DetalleVentaBE;
import java.sql.*;
import java.util.ArrayList;

public class DetalleVentaDAO extends ConexionMySQL implements IBaseDAO<DetalleVentaBE> {

    @Override
    public boolean Create(DetalleVentaBE detalle) {
        boolean result = false;
        try {
            String SQL = "INSERT INTO DetallesVenta (id_venta, id_carro, precio_unitario, cantidad, comentario_linea, talla) VALUES (?,?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, detalle.getIdVenta());
            pst.setInt(2, detalle.getIdCarro());
            pst.setDouble(3, detalle.getPrecioUnitario());
            pst.setInt(4, detalle.getCantidad());
            pst.setString(5, detalle.getComentarioLinea());
            pst.setString(6, detalle.getTalla());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create DetalleVenta: " + e.getMessage());
        }
        return result;
    }

    @Override
    public DetalleVentaBE Read(String id) {
        DetalleVentaBE detalle = new DetalleVentaBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM DetallesVenta WHERE id_detalle=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                detalle.setIdDetalle(rs.getInt("id_detalle"));
                detalle.setIdVenta(rs.getInt("id_venta"));
                detalle.setIdCarro(rs.getInt("id_carro"));
                detalle.setPrecioUnitario(rs.getDouble("precio_unitario"));
                detalle.setCantidad(rs.getInt("cantidad"));
                detalle.setSubtotal(rs.getDouble("subtotal"));
                detalle.setComentarioLinea(rs.getString("comentario_linea"));
                detalle.setTalla(rs.getString("talla"));
            }
        } catch(SQLException e) {
            System.out.println("Error en Read DetalleVenta: " + e.getMessage());
        }
        return detalle;
    }

    @Override
    public ArrayList<DetalleVentaBE> ReadAll() {
        ArrayList<DetalleVentaBE> lista = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM DetallesVenta");
            while (rs.next()) {
                DetalleVentaBE detalle = new DetalleVentaBE();
                detalle.setIdDetalle(rs.getInt("id_detalle"));
                detalle.setIdVenta(rs.getInt("id_venta"));
                detalle.setIdCarro(rs.getInt("id_carro"));
                detalle.setPrecioUnitario(rs.getDouble("precio_unitario"));
                detalle.setCantidad(rs.getInt("cantidad"));
                detalle.setSubtotal(rs.getDouble("subtotal"));
                detalle.setComentarioLinea(rs.getString("comentario_linea"));
                detalle.setTalla(rs.getString("talla"));
                lista.add(detalle);
            }
        } catch(SQLException e) {
            System.out.println("Error en ReadAll DetalleVenta: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean Update(DetalleVentaBE detalle) {
        boolean result = false;
        try {
            String SQL = "UPDATE DetallesVenta SET id_venta=?, id_carro=?, precio_unitario=?, cantidad=?, comentario_linea=?, talla=? WHERE id_detalle=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, detalle.getIdVenta());
            pst.setInt(2, detalle.getIdCarro());
            pst.setDouble(3, detalle.getPrecioUnitario());
            pst.setInt(4, detalle.getCantidad());
            pst.setString(5, detalle.getComentarioLinea());
            pst.setString(6, detalle.getTalla());
            pst.setInt(7, detalle.getIdDetalle());
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Update DetalleVenta: " + e.getMessage());
        }
        return result;
    }

    @Override
    public boolean Delete(String id) {
        boolean result = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM DetallesVenta WHERE id_detalle=?");
            pst.setInt(1, Integer.parseInt(id));
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Delete DetalleVenta: " + e.getMessage());
        }
        return result;
    }
}