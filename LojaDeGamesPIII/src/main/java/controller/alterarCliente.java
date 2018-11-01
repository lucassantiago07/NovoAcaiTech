/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import data.ClienteData;
import dao.ClienteDAO;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Fernando Lima Coutinho
 */
@WebServlet(name = "alterarCliente", urlPatterns = {"/alterarCliente"})
public class alterarCliente extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClienteDAO dao = new ClienteDAO();
        ClienteData c = new ClienteData();

        c.setId(Integer.parseInt(request.getParameter("id")));
        c.setNome(request.getParameter("nomeCliente"));
        c.setEmail(request.getParameter("emailCliente"));
        c.setCpf(Integer.parseInt(request.getParameter("cpfCliente")));
        c.setEndereco(request.getParameter("enderecoCliente"));
        c.setCep(Integer.parseInt(request.getParameter("cepCliente")));
        c.setTelefone(Integer.parseInt(request.getParameter("telefoneCliente")));
        c.setCelular(Integer.parseInt(request.getParameter("celularCliente")));

        dao.alterarCliente(c);
        request.setAttribute("retornoAlteracao", "ok");

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/alterarCliente.jsp");
        requestDispatcher.forward(request, response);

    }

}
