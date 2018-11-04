package controller;

import dao.ClienteDAO;
import data.ClienteData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cadastrarCliente", urlPatterns = {"/cadastrarCliente"})
public class cadastrarCliente extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClienteData p = new ClienteData();

        p.setNome(request.getParameter("nomeCliente"));

        p.setEmail(request.getParameter("emailCliente"));

        p.setCpf(request.getParameter("cpfCliente"));

        p.setEndereco(request.getParameter("endereco"));

        p.setCep(request.getParameter("cepCliente"));

        p.setTelefone(request.getParameter("telefone"));

        p.setCelular(request.getParameter("celular"));

        ClienteDAO dao = new ClienteDAO();

        dao.cadastraCliente(p);

        request.setAttribute("retorno", "OK");

        request.getRequestDispatcher("view/cadastrarCliente.jsp").forward(request, response);
    }
}
