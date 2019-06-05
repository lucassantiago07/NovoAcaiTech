package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "sairLogin", urlPatterns = {"/sairLogin"})
public class sairLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("getCargo", null);
        session.setAttribute("getCelular", null);
        session.setAttribute("getCep", null);
        session.setAttribute("getCpf", null);
        session.setAttribute("getEndereco", null);
        session.setAttribute("getFilial", null);
        session.setAttribute("getId", null);
        session.setAttribute("getNome", null);
        session.setAttribute("getTelefone", null);
        session.setAttribute("getData", null);
        session.setAttribute("listaProdutos", null);
        session.setAttribute("cpfCliente", null);
        session.setAttribute("nomeCliente", null);
        session.setAttribute("celularCliente", null);
        session.setAttribute("getUsuario", null);
        request.setAttribute("sairLogin", "sairLogin");
        request.getServletContext().getRequestDispatcher("/view/login.jsp").forward(request, response);

    }

}
