package DataAccessObject;

import BusinessEntity.UsuarioBE;
import java.sql.*;
import java.util.ArrayList;

public class UsuarioDAO extends ConexionMySQL implements IBaseDAO<UsuarioBE> {

    @Override
    public boolean Create(UsuarioBE usuario) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO Usuarios (nombres, apellidos, email, contraseña, celular, rol, fecha_nacimiento, direccion, comentarios) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, usuario.getNombres());
            pst.setString(2, usuario.getApellidos());
            pst.setString(3, usuario.getEmail());
            pst.setString(4, usuario.getContrasena());
            pst.setString(5, usuario.getCelular());
            pst.setString(6, usuario.getRol());
            if(usuario.getFechaNacimiento() != null) {
                pst.setDate(7, new java.sql.Date(usuario.getFechaNacimiento().getTime()));
            } else {
                pst.setNull(7, java.sql.Types.DATE);
            }
            pst.setString(8, usuario.getDireccion());
            pst.setString(9, usuario.getComentarios());
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create Usuario: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public UsuarioBE Read(String id) {
        UsuarioBE usuario = new UsuarioBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Usuarios WHERE id_usuario = ?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setEmail(rs.getString("email"));
                usuario.setContrasena(rs.getString("contraseña"));
                usuario.setCelular(rs.getString("celular"));
                usuario.setRol(rs.getString("rol"));
                usuario.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setComentarios(rs.getString("comentarios"));
                usuario.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
            }
        } catch(SQLException e){
            System.out.println("Error en Read Usuario: " + e.getMessage());
        }
        return usuario;
    }

    @Override
    public ArrayList<UsuarioBE> ReadAll() {
        ArrayList<UsuarioBE> listaUsuarios = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Usuarios");
            while(rs.next()){
                UsuarioBE usuario = new UsuarioBE();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setEmail(rs.getString("email"));
                usuario.setContrasena(rs.getString("contraseña"));
                usuario.setCelular(rs.getString("celular"));
                usuario.setRol(rs.getString("rol"));
                usuario.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setComentarios(rs.getString("comentarios"));
                usuario.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                listaUsuarios.add(usuario);
            }
        } catch(SQLException e){
            System.out.println("Error en ReadAll Usuario: " + e.getMessage());
        }
        return listaUsuarios;
    }

    @Override
    public boolean Update(UsuarioBE usuario) {
        boolean resultado = false;
        try {
            String SQL = "UPDATE Usuarios SET nombres=?, apellidos=?, email=?, contraseña=?, celular=?, rol=?, fecha_nacimiento=?, direccion=?, comentarios=? WHERE id_usuario=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, usuario.getNombres());
            pst.setString(2, usuario.getApellidos());
            pst.setString(3, usuario.getEmail());
            pst.setString(4, usuario.getContrasena());
            pst.setString(5, usuario.getCelular());
            pst.setString(6, usuario.getRol());
            if(usuario.getFechaNacimiento() != null) {
                pst.setDate(7, new java.sql.Date(usuario.getFechaNacimiento().getTime()));
            } else {
                pst.setNull(7, java.sql.Types.DATE);
            }
            pst.setString(8, usuario.getDireccion());
            pst.setString(9, usuario.getComentarios());
            pst.setInt(10, usuario.getIdUsuario());
            resultado = pst.executeUpdate() > 0;
        } catch(SQLException e){
            System.out.println("Error en Update Usuario: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public boolean Delete(String id) {
        boolean resultado = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Usuarios WHERE id_usuario=?");
            pst.setInt(1, Integer.parseInt(id));
            resultado = pst.executeUpdate() > 0;
        } catch(SQLException e){
            System.out.println("Error en Delete Usuario: " + e.getMessage());
        }
        return resultado;
    }

    public UsuarioBE autenticar(String email, String contrasena) {
        UsuarioBE usuario = null;
        try {
            String SQL = "SELECT * FROM Usuarios WHERE email = ? AND contraseña = ?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, email);
            pst.setString(2, contrasena);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                usuario = new UsuarioBE();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setEmail(rs.getString("email"));
                usuario.setContrasena(rs.getString("contraseña"));
                usuario.setCelular(rs.getString("celular"));
                usuario.setRol(rs.getString("rol"));
                usuario.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setComentarios(rs.getString("comentarios"));
                usuario.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
            }
        } catch (SQLException e) {
            System.out.println("Error en autenticar Usuario: " + e.getMessage());
        }
        return usuario;
    }
}