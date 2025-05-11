package DataAccessObject;

import BusinessEntity.PagoBE;
import java.sql.*;
import java.util.ArrayList;

public class PagoDAO extends ConexionMySQL implements IBaseDAO<PagoBE> {

    @Override
    public boolean Create(PagoBE pago) {
        boolean result = false;
        try {
            String SQL = "INSERT INTO Pagos (id_venta, id_metodo, monto, referencia_pago, fecha_pago, estado) VALUES (?,?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, pago.getIdVenta());
            pst.setInt(2, pago.getIdMetodo());
            pst.setDouble(3, pago.getMonto());
            pst.setString(4, pago.getReferenciaPago());
            pst.setTimestamp(5, pago.getFechaPago());
            pst.setString(6, pago.getEstado());
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Create Pago: " + e.getMessage());
        }
        return result;
    }

    @Override
    public PagoBE Read(String id) {
        PagoBE pago = new PagoBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Pagos WHERE id_pago=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                pago.setIdPago(rs.getInt("id_pago"));
                pago.setIdVenta(rs.getInt("id_venta"));
                pago.setIdMetodo(rs.getInt("id_metodo"));
                pago.setMonto(rs.getDouble("monto"));
                pago.setReferenciaPago(rs.getString("referencia_pago"));
                pago.setFechaPago(rs.getTimestamp("fecha_pago"));
                pago.setEstado(rs.getString("estado"));
            }
        } catch(SQLException e) {
            System.out.println("Error en Read Pago: " + e.getMessage());
        }
        return pago;
    }

    @Override
    public ArrayList<PagoBE> ReadAll() {
        ArrayList<PagoBE> lista = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Pagos");
            while(rs.next()){
                PagoBE pago = new PagoBE();
                pago.setIdPago(rs.getInt("id_pago"));
                pago.setIdVenta(rs.getInt("id_venta"));
                pago.setIdMetodo(rs.getInt("id_metodo"));
                pago.setMonto(rs.getDouble("monto"));
                pago.setReferenciaPago(rs.getString("referencia_pago"));
                pago.setFechaPago(rs.getTimestamp("fecha_pago"));
                pago.setEstado(rs.getString("estado"));
                lista.add(pago);
            }
        } catch(SQLException e) {
            System.out.println("Error en ReadAll Pago: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean Update(PagoBE pago) {
        boolean result = false;
        try {
            String SQL = "UPDATE Pagos SET id_venta=?, id_metodo=?, monto=?, referencia_pago=?, fecha_pago=?, estado=? WHERE id_pago=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, pago.getIdVenta());
            pst.setInt(2, pago.getIdMetodo());
            pst.setDouble(3, pago.getMonto());
            pst.setString(4, pago.getReferenciaPago());
            pst.setTimestamp(5, pago.getFechaPago());
            pst.setString(6, pago.getEstado());
            pst.setInt(7, pago.getIdPago());
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Update Pago: " + e.getMessage());
        }
        return result;
    }

    @Override
    public boolean Delete(String id) {
        boolean result = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Pagos WHERE id_pago=?");
            pst.setInt(1, Integer.parseInt(id));
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Delete Pago: " + e.getMessage());
        }
        return result;
    }
}