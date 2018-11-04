package controller;

import data.ClienteData;
import dao.ClienteDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listaCliente", urlPatterns = {"/listaCliente"})
public class listaCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClienteDAO Clientes = new ClienteDAO();

        List<ClienteData> lista = Clientes.getClientes();

        request.setAttribute("lista", lista);

    }

}
