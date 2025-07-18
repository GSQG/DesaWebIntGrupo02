package Services;

import BusinessEntity.UsuarioBE;
import BusinessLogic.UsuarioBL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/Usuario.do"})
public class UsuarioServlet extends HttpServlet {

    private JSONObject parseJson(HttpServletRequest req) throws IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = req.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        return new JSONObject(sb.toString());
    }

    private void writeJson(HttpServletResponse resp, JSONObject json, int status) throws IOException {
        resp.setStatus(status);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            out.print(json.toString());
            out.flush();
        }
    }

    private JSONObject convertirUsuarioAJson(UsuarioBE usuario) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timestampFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        JSONObject usuarioJson = new JSONObject();
        usuarioJson.put("idUsuario", usuario.getIdUsuario());
        usuarioJson.put("nombres", usuario.getNombres());
        usuarioJson.put("apellidos", usuario.getApellidos());
        usuarioJson.put("email", usuario.getEmail());
        usuarioJson.put("celular", usuario.getCelular());
        usuarioJson.put("rol", usuario.getRol());
        usuarioJson.put("direccion", usuario.getDireccion());
        usuarioJson.put("comentarios", usuario.getComentarios());

        if (usuario.getFechaNacimiento() != null) {
            usuarioJson.put("fechaNacimiento", dateFormat.format(usuario.getFechaNacimiento()));
        } else {
            usuarioJson.put("fechaNacimiento", JSONObject.NULL);
        }

        if (usuario.getFechaCreacion() != null) {
            usuarioJson.put("fechaCreacion", timestampFormat.format(usuario.getFechaCreacion()));
        } else {
            usuarioJson.put("fechaCreacion", JSONObject.NULL);
        }

        return usuarioJson;
    }

    private UsuarioBE convertirJsonAUsuario(JSONObject json) {
        UsuarioBE usuario = new UsuarioBE();
        if (json.has("idUsuario")) {
            usuario.setIdUsuario(json.getInt("idUsuario"));
        }
        usuario.setNombres(json.getString("nombres"));
        usuario.setApellidos(json.getString("apellidos"));
        usuario.setEmail(json.getString("email"));
        usuario.setContrasena(json.optString("contrasena", ""));
        usuario.setCelular(json.optString("celular", ""));
        usuario.setRol(json.optString("rol", "usuario"));
        usuario.setDireccion(json.optString("direccion", ""));
        usuario.setComentarios(json.optString("comentarios", ""));

        if (!json.isNull("fechaNacimiento")) {
            try {
                usuario.setFechaNacimiento(new java.sql.Date(
                        new SimpleDateFormat("yyyy-MM-dd").parse(json.getString("fechaNacimiento")).getTime()));
            } catch (Exception e) {
                System.out.println("Error al parsear fecha: " + e.getMessage());
            }
        }

        return usuario;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        String email = req.getParameter("email");
        String accion = req.getParameter("accion");
        UsuarioBL usuarioBL = new UsuarioBL();
        JSONObject jsonResponse = new JSONObject();

        try {
            if (id != null) {
                // Obtener usuario por ID
                UsuarioBE usuario = usuarioBL.obtenerPorId(id);
                if (usuario != null && usuario.getIdUsuario() > 0) {
                    jsonResponse.put("success", true)
                            .put("data", convertirUsuarioAJson(usuario))
                            .put("message", "Usuario encontrado");
                    writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
                } else {
                    jsonResponse.put("success", false)
                            .put("message", "Usuario no encontrado");
                    writeJson(resp, jsonResponse, HttpServletResponse.SC_NOT_FOUND);
                }
            }
            else if (email != null) {
                // Buscar usuario por email
                List<UsuarioBE> usuarios = usuarioBL.listar();
                UsuarioBE usuarioEncontrado = null;
                for (UsuarioBE usuario : usuarios) {
                    if (usuario.getEmail().equalsIgnoreCase(email)) {
                        usuarioEncontrado = usuario;
                        break;
                    }
                }

                if (usuarioEncontrado != null) {
                    jsonResponse.put("success", true)
                            .put("data", convertirUsuarioAJson(usuarioEncontrado))
                            .put("message", "Usuario encontrado");
                    writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
                } else {
                    jsonResponse.put("success", false)
                            .put("message", "Usuario no encontrado");
                    writeJson(resp, jsonResponse, HttpServletResponse.SC_NOT_FOUND);
                }
            }
            else if (accion != null && accion.equalsIgnoreCase("edit")) {
                // Modo edición (compatibilidad con frontend tradicional)
                if (req.getHeader("Accept").contains("application/json")) {
                    jsonResponse.put("success", true)
                            .put("message", "Modo edición activado")
                            .put("redirect", "usuarioedit.jsp");
                    writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
                } else {
                    req.getRequestDispatcher("/usuarioedit.jsp").forward(req, resp);
                }
            }
            else {
                List<UsuarioBE> usuarios = usuarioBL.listar();
                JSONArray usuariosJson = new JSONArray();
                for (UsuarioBE usuario : usuarios) {
                    usuariosJson.put(convertirUsuarioAJson(usuario));
                }

                if (req.getHeader("Accept").contains("application/json")) {
                    jsonResponse.put("success", true)
                            .put("data", usuariosJson)
                            .put("message", usuarios.size() + " usuarios encontrados");
                    writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
                } else {
                    req.setAttribute("usuarios", usuarios);
                    req.getRequestDispatcher("/usuariolist.jsp").forward(req, resp);
                }
            }
        } catch (Exception e) {
            jsonResponse.put("success", false)
                    .put("message", "Error en el servidor: " + e.getMessage());
            writeJson(resp, jsonResponse, HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        procesarUsuarioRequest(req, resp, false);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        procesarUsuarioRequest(req, resp, true);
    }

    private void procesarUsuarioRequest(HttpServletRequest req, HttpServletResponse resp, boolean esActualizacion)
            throws IOException {
        String contentType = req.getContentType();
        UsuarioBL usuarioBL = new UsuarioBL();
        JSONObject jsonResponse = new JSONObject();

        try {
            if (contentType != null && contentType.contains("application/json")) {
                JSONObject body = parseJson(req);
                UsuarioBE usuario = convertirJsonAUsuario(body);

                if (usuario.getNombres() == null || usuario.getNombres().trim().isEmpty() ||
                        usuario.getEmail() == null || usuario.getEmail().trim().isEmpty()) {
                    jsonResponse.put("success", false)
                            .put("message", "Nombre y email son campos requeridos");
                    writeJson(resp, jsonResponse, HttpServletResponse.SC_BAD_REQUEST);
                    return;
                }

                boolean resultado;
                if (esActualizacion) {
                    resultado = usuarioBL.actualizar(usuario);
                    jsonResponse.put("message", resultado ? "Usuario actualizado exitosamente" : "Error al actualizar usuario");
                } else {
                    if (usuarioBL.existeEmail(usuario.getEmail())) {
                        jsonResponse.put("success", false)
                                .put("message", "El email ya está registrado");
                        writeJson(resp, jsonResponse, HttpServletResponse.SC_CONFLICT);
                        return;
                    }
                    resultado = usuarioBL.crear(usuario);
                    jsonResponse.put("message", resultado ? "Usuario creado exitosamente" : "Error al crear usuario");
                }

                jsonResponse.put("success", resultado);
                writeJson(resp, jsonResponse, resultado ?
                        (esActualizacion ? HttpServletResponse.SC_OK : HttpServletResponse.SC_CREATED) :
                        HttpServletResponse.SC_BAD_REQUEST);
            } else {
                resp.sendRedirect("Usuario.do");
            }
        } catch (Exception e) {
            jsonResponse.put("success", false)
                    .put("message", "Error en el servidor: " + e.getMessage());
            writeJson(resp, jsonResponse, HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        UsuarioBL usuarioBL = new UsuarioBL();
        JSONObject jsonResponse = new JSONObject();

        try {
            JSONObject body = parseJson(req);
            String id = body.getString("id");

            boolean resultado = usuarioBL.eliminar(id);
            jsonResponse.put("success", resultado)
                    .put("message", resultado ? "Usuario eliminado exitosamente" : "Error al eliminar usuario");
            writeJson(resp, jsonResponse, resultado ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST);
        } catch (Exception e) {
            jsonResponse.put("success", false)
                    .put("message", "Error en el servidor: " + e.getMessage());
            writeJson(resp, jsonResponse, HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}