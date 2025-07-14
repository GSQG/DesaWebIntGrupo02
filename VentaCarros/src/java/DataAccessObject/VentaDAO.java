package DataAccessObject;

import BusinessEntity.VentaBE;
import java.sql.*;
import java.util.ArrayList;

public class VentaDAO extends ConexionMySQL implements IBaseDAO<VentaBE> {

    @Override
    public boolean Create(VentaBE venta) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO VentasCarros (id_carro, nombre_cliente, direccion, telefono, medio_pago, fecha_vencimiento, cvv, fecha_venta, precio_venta, modelo_carro, ano_carro, color_carro, estado_carro, kilometraje_carro, tipo_combustible_carro, transmision_carro) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, venta.getIdCarro());
            pst.setString(2, venta.getNombreCliente());
            pst.setString(3, venta.getDireccion());
            pst.setString(4, venta.getTelefono());
            pst.setString(5, venta.getMedioPago());
            pst.setString(6, venta.getFechaVencimiento());
            pst.setString(7, venta.getCvv());
            pst.setTimestamp(8, venta.getFechaVenta());
            pst.setDouble(9, venta.getPrecioVenta());
            pst.setString(10, venta.getModeloCarro());
            pst.setInt(11, venta.getAnoCarro());
            pst.setString(12, venta.getColorCarro());
            pst.setString(13, venta.getEstadoCarro());
            pst.setInt(14, venta.getKilometrajeCarro());
            pst.setString(15, venta.getTipoCombustibleCarro());
            pst.setString(16, venta.getTransmisionCarro());

            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create de VentaDAO: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public VentaBE Read(String id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<VentaBE> ReadAll() {
        ArrayList<VentaBE> listaVentas = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM VentasCarros");
            while (rs.next()) {
                VentaBE venta = new VentaBE();
                venta.setIdVenta(rs.getInt("id_venta"));
                venta.setIdCarro(rs.getInt("id_carro"));
                venta.setNombreCliente(rs.getString("nombre_cliente"));
                venta.setDireccion(rs.getString("direccion"));
                venta.setTelefono(rs.getString("telefono"));
                venta.setMedioPago(rs.getString("medio_pago"));
                venta.setFechaVencimiento(rs.getString("fecha_vencimiento"));
                venta.setCvv(rs.getString("cvv"));
                venta.setFechaVenta(rs.getTimestamp("fecha_venta"));
                venta.setPrecioVenta(rs.getDouble("precio_venta"));
                venta.setModeloCarro(rs.getString("modelo_carro"));
                venta.setAnoCarro(rs.getInt("ano_carro"));
                venta.setColorCarro(rs.getString("color_carro"));
                venta.setEstadoCarro(rs.getString("estado_carro"));
                venta.setKilometrajeCarro(rs.getInt("kilometraje_carro"));
                venta.setTipoCombustibleCarro(rs.getString("tipo_combustible_carro"));
                venta.setTransmisionCarro(rs.getString("transmision_carro"));
                listaVentas.add(venta);
            }
        } catch (SQLException e) {
            System.out.println("Error en ReadAll de VentaDAO: " + e.getMessage());
        }
        return listaVentas;
    }

    @Override
    public boolean Update(VentaBE t) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean Delete(String id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}