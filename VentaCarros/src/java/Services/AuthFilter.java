package Services;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

@WebFilter("/*")
public class AuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException { }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String ctx = req.getContextPath();

        boolean loginPage    = uri.equals(ctx + "/login.jsp");
        boolean loginAction  = uri.equals(ctx + "/LoginServlet");
        boolean logoutAction = uri.equals(ctx + "/LogoutServlet");
        boolean cssResource  = uri.startsWith(ctx + "/css/");
        boolean jsResource   = uri.startsWith(ctx + "/js/");
        boolean imgResource  = uri.startsWith(ctx + "/img/");

        if (loginPage || loginAction || logoutAction
                || cssResource || jsResource || imgResource) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        boolean loggedIn = session != null
                && session.getAttribute("usuarioLogueado") != null;

        if (loggedIn) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(ctx + "/login.jsp");
        }
    }

    @Override
    public void destroy() { }
}