package controller;

import dao.ProdutoDAO;
import data.ProdutoData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "excluirProduto", urlPatterns = {"/excluirProduto"})
public class excluirProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idProduto = Integer.parseInt(request.getParameter("idProduto"));

        ProdutoDAO produtos = new ProdutoDAO();

        ProdutoData produtoSendoExcluido = produtos.getProdutoById(idProduto);

        boolean deuCerto = produtos.excluirProduto(idProduto);

        String MensagemDeRetorno = null;

        if (deuCerto == true) {
            MensagemDeRetorno = "Produto: '" + produtoSendoExcluido.getNome() + "' alterado com sucesso!";
        } else {
            MensagemDeRetorno = "Houve um erro ao alterar o produto: '" + produtoSendoExcluido.getNome() + "'.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);

        request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

}
