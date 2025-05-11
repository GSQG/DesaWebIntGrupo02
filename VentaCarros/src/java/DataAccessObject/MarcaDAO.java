package DataAccessObject;

import BusinessEntity.MarcaBE;
import java.sql.*;
import java.util.ArrayList;

public class MarcaDAO extends ConexionMySQL implements IBaseDAO<MarcaBE> {

    @Override
    public boolean Create(MarcaBE marca) {
        boolean result = false;
        try {
            String SQL = "INSERT INTO Marcas (nombre, pais_origen, sitio_web) VALUES (?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, marca.getNombre());
            pst.setString(2, marca.getPaisOrigen());
            pst.setString(3, marca.getSitioWeb());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create Marca: " + e.getMessage());
        }
        return result;
    }

    @Override
    public MarcaBE Read(String id) {
        MarcaBE marca = new MarcaBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Marcas WHERE id_marca=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                marca.setIdMarca(rs.getInt("id_marca"));
                marca.setNombre(rs.getString("nombre"));
                marca.setPaisOrigen(rs.getString("pais_origen"));
                marca.setSitioWeb(rs.getString("sitio_web"));
            }
        } catch (SQLException e) {
            System.out.println("Error en Read Marca: " + e.getMessage());
        }
        return marca;
    }

    @Override
    public ArrayList<MarcaBE> ReadAll() {
        ArrayList<MarcaBE> lista = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Marcas");
            while (rs.next()) {
                MarcaBE marca = new MarcaBE();
                marca.setIdMarca(rs.getInt("id_marca"));
                marca.setNombre(rs.getString("nombre"));
                marca.setPaisOrigen(rs.getString("pais_origen"));
                marca.setSitioWeb(rs.getString("sitio_web"));
                lista.add(marca);
            }
        } catch (SQLException e) {
            System.out.println("Error en ReadAll Marca: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean Update(MarcaBE marca) {
        boolean result = false;
        try {
            String SQL = "UPDATE Marcas SET nombre=?, pais_origen=?, sitio_web=? WHERE id_marca=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, marca.getNombre());
            pst.setString(2, marca.getPaisOrigen());
            pst.setString(3, marca.getSitioWeb());
            pst.setInt(4, marca.getIdMarca());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Update Marca: " + e.getMessage());
        }
        return result;
    }

    @Override
    public boolean Delete(String id) {
        boolean result = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Marcas WHERE id_marca=?");
            pst.setInt(1, Integer.parseInt(id));
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Delete Marca: " + e.getMessage());
        }
        return result;
    }
}