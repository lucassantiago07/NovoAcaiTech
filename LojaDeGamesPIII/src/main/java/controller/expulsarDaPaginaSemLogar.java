package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "expulsarDaPaginaSemLogar", urlPatterns = {"/expulsarDaPaginaSemLogar"})
public class expulsarDaPaginaSemLogar extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

        request.setAttribute("retorno", "expulsar");

        String MensagemDeRetorno = "Seu acesso à página solicitada não foi permitido pois você não está logado no sistema.";

        request.setAttribute("retornoMensagem", MensagemDeRetorno);

        request.getServletContext().getRequestDispatcher("/view/login.jsp").forward(request, response);

    }

}
