/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ClienteDAO;
import data.ClienteData;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "cadastrarCliente", urlPatterns = {"/cadastrarCliente"})
public class cadastrarCliente extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClienteData p = new ClienteData();

        p.setNome(request.getParameter("nomeCliente"));

        p.setEmail(request.getParameter("emailCliente"));

        p.setCpf(Integer.parseInt(request.getParameter("cpfCliente")));
        
        p.setEndereco(request.getParameter("endereco"));

        p.setCep(Integer.parseInt(request.getParameter("cepCliente")));

        p.setTelefone(Integer.parseInt(request.getParameter("telefone")));
        
        p.setCelular(Integer.parseInt(request.getParameter("celular")));


        ClienteDAO dao = new ClienteDAO();

        dao.cadastraCliente(p);

        request.setAttribute("retorno", "OK");

        request.getRequestDispatcher("view/cadastrarCliente.jsp").forward(request, response);
    }
}
