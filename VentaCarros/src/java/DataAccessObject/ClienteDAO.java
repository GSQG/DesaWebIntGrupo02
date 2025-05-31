package DataAccessObject;

import BusinessEntity.ClienteBE;
import java.sql.*;
import java.util.ArrayList;

public class ClienteDAO extends ConexionMySQL implements IBaseDAO<ClienteBE> {

    @Override
    public boolean Create(ClienteBE cliente) {
        boolean result = false;
        try {
            String SQL = "INSERT INTO Clientes (nombres, apellidos, email, celular, direccion, preferencia_contacto, observaciones, fecha_registro) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, cliente.getNombres());
            pst.setString(2, cliente.getApellidos());
            pst.setString(3, cliente.getEmail());
            pst.setString(4, cliente.getCelular());
            pst.setString(5, cliente.getDireccion());
            pst.setString(6, cliente.getPreferenciaContacto());
            pst.setString(7, cliente.getObservaciones());
            if(cliente.getFechaRegistro() != null){
                pst.setDate(8, new java.sql.Date(cliente.getFechaRegistro().getTime()));
            } else {
                pst.setDate(8, new java.sql.Date(new java.util.Date().getTime()));
            }
            result = pst.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println("Error en Create Cliente: " + ex.getMessage());
        }
        return result;
    }

    @Override
    public ClienteBE Read(String id) {
        ClienteBE cliente = new ClienteBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Clientes WHERE id_cliente=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                cliente.setIdCliente(rs.getInt("id_cliente"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setEmail(rs.getString("email"));
                cliente.setCelular(rs.getString("celular"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setPreferenciaContacto(rs.getString("preferencia_contacto"));
                cliente.setObservaciones(rs.getString("observaciones"));
                cliente.setFechaRegistro(rs.getDate("fecha_registro"));
            }
        } catch(SQLException ex){
            System.out.println("Error en Read Cliente: " + ex.getMessage());
        }
        return cliente;
    }

    @Override
    public ArrayList<ClienteBE> ReadAll() {
        ArrayList<ClienteBE> listaClientes = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Clientes");
            while(rs.next()){
                ClienteBE cliente = new ClienteBE();
                cliente.setIdCliente(rs.getInt("id_cliente"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setEmail(rs.getString("email"));
                cliente.setCelular(rs.getString("celular"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setPreferenciaContacto(rs.getString("preferencia_contacto"));
                cliente.setObservaciones(rs.getString("observaciones"));
                cliente.setFechaRegistro(rs.getDate("fecha_registro"));
                listaClientes.add(cliente);
            }
        } catch(SQLException ex){
            System.out.println("Error en ReadAll Cliente: " + ex.getMessage());
        }
        return listaClientes;
    }

    @Override
    public boolean Update(ClienteBE cliente) {
        boolean result = false;
        try {
            String SQL = "UPDATE Clientes SET nombres=?, apellidos=?, email=?, celular=?, direccion=?, preferencia_contacto=?, observaciones=?, fecha_registro=? WHERE id_cliente=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, cliente.getNombres());
            pst.setString(2, cliente.getApellidos());
            pst.setString(3, cliente.getEmail());
            pst.setString(4, cliente.getCelular());
            pst.setString(5, cliente.getDireccion());
            pst.setString(6, cliente.getPreferenciaContacto());
            pst.setString(7, cliente.getObservaciones());
            if(cliente.getFechaRegistro() != null){
                pst.setDate(8, new java.sql.Date(cliente.getFechaRegistro().getTime()));
            } else {
                pst.setDate(8, new java.sql.Date(new java.util.Date().getTime()));
            }
            pst.setInt(9, cliente.getIdCliente());
            result = pst.executeUpdate() > 0;
        } catch(SQLException ex){
            System.out.println("Error en Update Cliente: " + ex.getMessage());
        }
        return result;
    }

    @Override
    public boolean Delete(String id) {
        boolean result = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Clientes WHERE id_cliente=?");
            pst.setInt(1, Integer.parseInt(id));
            result = pst.executeUpdate() > 0;
        } catch(SQLException ex){
            System.out.println("Error en Delete Cliente: " + ex.getMessage());
        }
        return result;
    }
}