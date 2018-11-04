package controller;

import dao.ClienteDAO;
import dao.ProdutoDAO;
import data.ClienteData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "excluirCliente", urlPatterns = {"/excluirCliente"})
public class excluirCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));

        ClienteDAO cliente = new ClienteDAO();

        ClienteData clienteSendoExcluido = cliente.getClienteById(idCliente);

        boolean deuCerto = cliente.excluirCliente(idCliente);

        request.setAttribute("retorno", "ok");

        String MensagemDeRetorno = null;

        if (deuCerto == true) {
            MensagemDeRetorno = "Cliente: '" + clienteSendoExcluido.getNome() + "' excluido com sucesso!";
        } else {
            MensagemDeRetorno = "Houve um erro ao excluir o cliente: '" + clienteSendoExcluido.getNome() + "'.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);
        request.getRequestDispatcher("view/listaCliente.jsp").forward(request, response);
    }

}
