package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import data.ClienteData;
import dao.ClienteDAO;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "alterarCliente", urlPatterns = {"/alterarCliente"})
public class alterarCliente extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClienteDAO dao = new ClienteDAO();
        ClienteData c = new ClienteData();

        c.setId(Integer.parseInt(request.getParameter("id")));
        c.setNome(request.getParameter("nomeCliente"));
        c.setEmail(request.getParameter("emailCliente"));
        c.setCpf(request.getParameter("cpfCliente"));
        c.setEndereco(request.getParameter("enderecoCliente"));
        c.setCep(request.getParameter("cepCliente"));
        c.setTelefone(request.getParameter("telefoneCliente"));
        c.setCelular(request.getParameter("celularCliente"));

        dao.alterarCliente(c);
        request.setAttribute("retornoAlteracao", "ok");

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/alterarCliente.jsp");
        requestDispatcher.forward(request, response);

    }

}
