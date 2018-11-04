package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "validaLogin", urlPatterns = {"/validaLogin"})
public class validaLogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if ((request.getParameter("usuario") != null) || (request.getParameter("senha") != null)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", request.getParameter("usuario"));
        }

    }

}
