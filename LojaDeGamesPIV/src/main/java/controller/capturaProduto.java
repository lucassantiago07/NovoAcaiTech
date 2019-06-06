package controller;

import data.ProdutoData;
import dao.ProdutoDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "capturaProduto", urlPatterns = {"/capturaProduto"})
public class capturaProduto extends HttpServlet {

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

        String idProduto = request.getParameter("idProduto");

        ProdutoDAO produtos = new ProdutoDAO();

        ProdutoData p = produtos.getProdutoById(Integer.parseInt(idProduto));

        request.setAttribute("produto", p);

        //request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

}
