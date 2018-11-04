package controller;

import data.ClienteData;
import dao.ClienteDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listaClienteComFiltro", urlPatterns = {"/listaClienteComFiltro"})
public class listaClienteComFiltro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");

        ClienteDAO Clientes = new ClienteDAO();

        List<ClienteData> listaComFiltro = Clientes.getClienteByNome(nome);

        request.setAttribute("listaComFiltro", listaComFiltro);

        //response.sendRedirect("./view/listaCliente.jsp");
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/listaCliente.jsp");
        requestDispatcher.forward(request, response);

        // request.getRequestDispatcher("./view/listaCliente.jsp").forward(request, response);
    }

}
