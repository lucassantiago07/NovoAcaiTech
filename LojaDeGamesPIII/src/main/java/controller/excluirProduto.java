package controller;

import controller.*;
import data.ProdutoData;
import dao.ProdutoDAO;
import dao.ProdutoDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "excluirProduto", urlPatterns = {"/excluirProduto"})
public class excluirProduto extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idProduto = Integer.parseInt(request.getParameter("idProduto"));

        ProdutoDAO produtos = new ProdutoDAO();

        produtos.excluirProduto(idProduto);

        request.setAttribute("retornoExclusao", "ok");

        request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

}
