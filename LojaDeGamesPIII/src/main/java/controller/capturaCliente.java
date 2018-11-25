package controller;

import dao.ClienteDAO;
import data.ClienteData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "capturaCliente", urlPatterns = {"/capturaCliente"})
public class capturaCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idCliente = request.getParameter("idCliente");

        ClienteDAO clientes = new ClienteDAO();

        ClienteData c = clientes.getClienteById(Integer.parseInt(idCliente));

        request.setAttribute("cliente", c);

        //request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

}
