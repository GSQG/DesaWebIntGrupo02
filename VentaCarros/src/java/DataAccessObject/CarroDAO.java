package DataAccessObject;

import BusinessEntity.CarroBE;
import java.sql.*;
import java.util.ArrayList;

public class CarroDAO extends ConexionMySQL implements IBaseDAO<CarroBE> {

    @Override
    public boolean Create(CarroBE carro) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO Carros (id_modelo, ano, color, precio_lista, estado, descripcion, kilometraje, tipo_combustible, transmision, talla_ruedas, comentarios) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, carro.getIdModelo());
            pst.setInt(2, carro.getAno());
            pst.setString(3, carro.getColor());
            pst.setDouble(4, carro.getPrecioLista());
            pst.setString(5, carro.getEstado());
            pst.setString(6, carro.getDescripcion());
            pst.setInt(7, carro.getKilometraje());
            pst.setString(8, carro.getTipoCombustible());
            pst.setString(9, carro.getTransmision());
            pst.setString(10, carro.getTallaRuedas());
            pst.setString(11, carro.getComentarios());
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public CarroBE Read(String id) {
        CarroBE carro = new CarroBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Carros WHERE id_carro = ?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                carro.setIdCarro(rs.getInt("id_carro"));
                carro.setIdModelo(rs.getInt("id_modelo"));
                carro.setAno(rs.getInt("ano"));
                carro.setColor(rs.getString("color"));
                carro.setPrecioLista(rs.getDouble("precio_lista"));
                carro.setEstado(rs.getString("estado"));
                carro.setDescripcion(rs.getString("descripcion"));
                carro.setKilometraje(rs.getInt("kilometraje"));
                carro.setTipoCombustible(rs.getString("tipo_combustible"));
                carro.setTransmision(rs.getString("transmision"));
                carro.setTallaRuedas(rs.getString("talla_ruedas"));
                carro.setComentarios(rs.getString("comentarios"));
            }
        } catch (SQLException e) {
            System.out.println("Error en Read: " + e.getMessage());
        }
        return carro;
    }

    @Override
    public ArrayList<CarroBE> ReadAll() {
        ArrayList<CarroBE> listaCarros = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Carros");
            while (rs.next()) {
                CarroBE carro = new CarroBE();
                carro.setIdCarro(rs.getInt("id_carro"));
                carro.setIdModelo(rs.getInt("id_modelo"));
                carro.setAno(rs.getInt("ano"));
                carro.setColor(rs.getString("color"));
                carro.setPrecioLista(rs.getDouble("precio_lista"));
                carro.setEstado(rs.getString("estado"));
                carro.setDescripcion(rs.getString("descripcion"));
                carro.setKilometraje(rs.getInt("kilometraje"));
                carro.setTipoCombustible(rs.getString("tipo_combustible"));
                carro.setTransmision(rs.getString("transmision"));
                carro.setTallaRuedas(rs.getString("talla_ruedas"));
                carro.setComentarios(rs.getString("comentarios"));
                listaCarros.add(carro);
            }
        } catch (SQLException e) {
            System.out.println("Error en ReadAll: " + e.getMessage());
        }
        return listaCarros;
    }

    @Override
    public boolean Update(CarroBE carro) {
        boolean resultado = false;
        try {
            String SQL = "UPDATE Carros SET id_modelo=?, ano=?, color=?, precio_lista=?, estado=?, descripcion=?, kilometraje=?, tipo_combustible=?, transmision=?, talla_ruedas=?, comentarios=? WHERE id_carro=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, carro.getIdModelo());
            pst.setInt(2, carro.getAno());
            pst.setString(3, carro.getColor());
            pst.setDouble(4, carro.getPrecioLista());
            pst.setString(5, carro.getEstado());
            pst.setString(6, carro.getDescripcion());
            pst.setInt(7, carro.getKilometraje());
            pst.setString(8, carro.getTipoCombustible());
            pst.setString(9, carro.getTransmision());
            pst.setString(10, carro.getTallaRuedas());
            pst.setString(11, carro.getComentarios());
            pst.setInt(12, carro.getIdCarro());
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Update: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public boolean Delete(String id) {
        boolean resultado = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Carros WHERE id_carro=?");
            pst.setInt(1, Integer.parseInt(id));
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Delete: " + e.getMessage());
        }
        return resultado;
    }
}