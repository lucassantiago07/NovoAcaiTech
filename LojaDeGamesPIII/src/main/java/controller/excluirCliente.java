package controller;

import dao.ClienteDAO;
import dao.ProdutoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "excluirProduto", urlPatterns = {"/excluirProduto"})
public class excluirCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));

        ClienteDAO cliente = new ClienteDAO();

        boolean deuCerto = cliente.excluirCliente(idCliente);

        request.setAttribute("retorno", "ok");
        String MensagemDeRetorno = null;

        if (deuCerto == true) {
            MensagemDeRetorno = "Produto: '" + request.getParameter("nomeProduto") + "' alterado com sucesso!";
        } else {
            MensagemDeRetorno = "Houve um erro ao alterar o produto: '" + request.getParameter("nomeProduto") + "'.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);
        request.getRequestDispatcher("view/listaCliente.jsp").forward(request, response);
    }

}
