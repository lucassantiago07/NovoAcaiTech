package controller;

import data.ProdutoData;
import dao.ProdutoDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "alterarProduto", urlPatterns = {"/alterarProduto"})
public class alterarProduto extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdutoDAO dao = new ProdutoDAO();
        ProdutoData p = new ProdutoData();

        p.setId(Integer.parseInt(request.getParameter("id")));
        p.setNome(request.getParameter("nomeProduto"));
        p.setDescricao(request.getParameter("descricao"));
        p.setPrecoDeCusto(Integer.parseInt(request.getParameter("precoCusto")));
        p.setPrecoDeVenda(Integer.parseInt(request.getParameter("precoVenda")));
        p.setEstoque(Integer.parseInt(request.getParameter("estoque")));
        p.setPlataforma(request.getParameter("plataforma"));
        p.setAnoLancamento(Integer.parseInt(request.getParameter("anolancamento")));
        p.setEstoque(Integer.parseInt(request.getParameter("estoque")));
        p.setFornecedor(request.getParameter("fornecedor"));
        p.setCategoria(Integer.parseInt(request.getParameter("categoria")));

        dao.alterarProduto(p);
        request.setAttribute("retornoAlteracao", "OK");

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/alterarProduto.jsp");
        requestDispatcher.forward(request, response);
    }

}
