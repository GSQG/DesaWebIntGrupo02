package DataAccessObject;

import BusinessEntity.ModeloBE;
import java.sql.*;
import java.util.ArrayList;

public class ModeloDAO extends ConexionMySQL implements IBaseDAO<ModeloBE> {

    @Override
    public boolean Create(ModeloBE modelo) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO Modelos (id_marca, nombre, descripcion, año_lanzamiento, segmento) VALUES (?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, modelo.getIdMarca());
            pst.setString(2, modelo.getNombre());
            pst.setString(3, modelo.getDescripcion());
            pst.setInt(4, modelo.getAnoLanzamiento());
            pst.setString(5, modelo.getSegmento());
            resultado = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Create Modelo: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public ModeloBE Read(String id) {
        ModeloBE modelo = new ModeloBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Modelos WHERE id_modelo=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                modelo.setIdModelo(rs.getInt("id_modelo"));
                modelo.setIdMarca(rs.getInt("id_marca"));
                modelo.setNombre(rs.getString("nombre"));
                modelo.setDescripcion(rs.getString("descripcion"));
                modelo.setAnoLanzamiento(rs.getInt("año_lanzamiento"));
                modelo.setSegmento(rs.getString("segmento"));
            }
        } catch(SQLException e){
            System.out.println("Error en Read Modelo: " + e.getMessage());
        }
        return modelo;
    }

    @Override
    public ArrayList<ModeloBE> ReadAll() {
        ArrayList<ModeloBE> listaModelos = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Modelos");
            while(rs.next()){
                ModeloBE modelo = new ModeloBE();
                modelo.setIdModelo(rs.getInt("id_modelo"));
                modelo.setIdMarca(rs.getInt("id_marca"));
                modelo.setNombre(rs.getString("nombre"));
                modelo.setDescripcion(rs.getString("descripcion"));
                modelo.setAnoLanzamiento(rs.getInt("año_lanzamiento"));
                modelo.setSegmento(rs.getString("segmento"));
                listaModelos.add(modelo);
            }
        } catch(SQLException e){
            System.out.println("Error en ReadAll Modelo: " + e.getMessage());
        }
        return listaModelos;
    }

    @Override
    public boolean Update(ModeloBE modelo) {
        boolean resultado = false;
        try {
            String SQL = "UPDATE Modelos SET id_marca=?, nombre=?, descripcion=?, año_lanzamiento=?, segmento=? WHERE id_modelo=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, modelo.getIdMarca());
            pst.setString(2, modelo.getNombre());
            pst.setString(3, modelo.getDescripcion());
            pst.setInt(4, modelo.getAnoLanzamiento());
            pst.setString(5, modelo.getSegmento());
            pst.setInt(6, modelo.getIdModelo());
            resultado = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Update Modelo: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public boolean Delete(String id) {
        boolean resultado = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Modelos WHERE id_modelo=?");
            pst.setInt(1, Integer.parseInt(id));
            resultado = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Delete Modelo: " + e.getMessage());
        }
        return resultado;
    }
}