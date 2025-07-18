package DataAccessObject;

import BusinessEntity.VentaRepuestoBE;
import java.sql.*;
import java.util.ArrayList;

public class VentaRepuestoDAO extends ConexionMySQL implements IBaseDAO<VentaRepuestoBE> {

    @Override
    public boolean Create(VentaRepuestoBE venta) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO VentasRepuestos (id_repuesto, nombre_cliente, direccion, telefono, medio_pago, "
                    + "fecha_vencimiento, cvv, fecha_venta, precio_venta, nombre_repuesto, marca_repuesto, cantidad, compatibilidad_repuesto) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, venta.getIdRepuesto());
            pst.setString(2, venta.getNombreCliente());
            pst.setString(3, venta.getDireccion());
            pst.setString(4, venta.getTelefono());
            pst.setString(5, venta.getMedioPago());
            pst.setString(6, venta.getFechaVencimiento());
            pst.setString(7, venta.getCvv());
            pst.setTimestamp(8, venta.getFechaVenta());
            pst.setDouble(9, venta.getPrecioVenta());
            pst.setString(10, venta.getNombreRepuesto());
            pst.setString(11, venta.getMarcaRepuesto());
            pst.setInt(12, venta.getCantidad());
            pst.setString(13, venta.getCompatibilidadRepuesto());

            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create de VentaRepuestoDAO: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public VentaRepuestoBE Read(String id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<VentaRepuestoBE> ReadAll() {
        ArrayList<VentaRepuestoBE> listaVentas = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM VentasRepuestos");
            while (rs.next()) {
                VentaRepuestoBE venta = new VentaRepuestoBE();
                venta.setIdVenta(rs.getInt("id_venta_repuesto"));
                venta.setIdRepuesto(rs.getInt("id_repuesto"));
                venta.setNombreCliente(rs.getString("nombre_cliente"));
                venta.setDireccion(rs.getString("direccion"));
                venta.setTelefono(rs.getString("telefono"));
                venta.setMedioPago(rs.getString("medio_pago"));
                venta.setFechaVencimiento(rs.getString("fecha_vencimiento"));
                venta.setCvv(rs.getString("cvv"));
                venta.setFechaVenta(rs.getTimestamp("fecha_venta"));
                venta.setPrecioVenta(rs.getDouble("precio_venta"));
                venta.setNombreRepuesto(rs.getString("nombre_repuesto"));
                venta.setMarcaRepuesto(rs.getString("marca_repuesto"));
                venta.setCantidad(rs.getInt("cantidad"));
                venta.setCompatibilidadRepuesto(rs.getString("compatibilidad_repuesto"));
                listaVentas.add(venta);
            }
        } catch (SQLException e) {
            System.out.println("Error en ReadAll de VentaRepuestoDAO: " + e.getMessage());
        }
        return listaVentas;
    }

    @Override
    public boolean Update(VentaRepuestoBE t) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean Delete(String id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}