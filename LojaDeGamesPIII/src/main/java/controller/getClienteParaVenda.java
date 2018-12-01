package controller;

import data.ClienteData;
import dao.ClienteDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "getClienteParaVenda", urlPatterns = {"/getClienteParaVenda"})
public class getClienteParaVenda extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cpfCliente = request.getParameter("cpfCliente");

        ClienteDAO Clientes = new ClienteDAO();

        ClienteData cliente = Clientes.getClienteByCpf(cpfCliente);

        if (cliente.getCpf() == null) {
            request.setAttribute("retorno", "clientenaocadastrado");
            request.setAttribute("retornoMensagem", "Não existe cliente para o CPF informado!");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("nomeCliente", cliente.getNome());
            session.setAttribute("cpfCliente", cliente.getCpf());
            session.setAttribute("celularCliente", cliente.getCelular());
        }

        //response.sendRedirect("./view/listaCliente.jsp");
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/carrinho.jsp");
        requestDispatcher.forward(request, response);

        // request.getRequestDispatcher("./view/listaCliente.jsp").forward(request, response);
    }

}
