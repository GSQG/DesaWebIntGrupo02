package Services;

import java.io.BufferedReader;
import java.io.IOException;
import com.google.gson.Gson;
import BusinessEntity.UsuarioBE;
import DataAccessObject.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        boolean isJson = "application/json".equalsIgnoreCase(req.getContentType());
        String usuario;
        String contrasena;

        if (isJson) {
            BufferedReader reader = req.getReader();
            UsuarioBE loginData = new Gson().fromJson(reader, UsuarioBE.class);
            usuario    = loginData.getEmail();
            contrasena = loginData.getContrasena();
        } else {
            usuario    = req.getParameter("username");
            contrasena = req.getParameter("password");
        }

        UsuarioDAO dao = new UsuarioDAO();
        UsuarioBE user = dao.autenticar(usuario, contrasena);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setMaxInactiveInterval(30 * 60);
            String nombreCompleto = user.getNombres() + " " + user.getApellidos();
            session.setAttribute("usuarioLogueado", nombreCompleto);
            session.setAttribute("rol", user.getRol());

            if (isJson) {
                resp.setContentType("application/json");
                resp.getWriter().write(new Gson().toJson(user));
            } else {
                resp.sendRedirect(req.getContextPath() + "/index.jsp");
            }
        } else {
            if (isJson) {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                resp.setContentType("application/json");
                resp.getWriter().write("{\"error\":\"Usuario o contraseña incorrectos\"}");
            } else {
                req.setAttribute("error", "usuario o contraseña incorrectos");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}