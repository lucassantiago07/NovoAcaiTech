package controller;

import data.ProdutoData;
import dao.ProdutoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listaProdutoComFiltro", urlPatterns = {"/listaProdutoComFiltro"})
public class listaProdutoComFiltro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String descricaoProduto = request.getParameter("descricaoProduto");

        System.out.println("Descrição: " + descricaoProduto);

        ProdutoDAO produtos = new ProdutoDAO();

        List<ProdutoData> listaComFiltro = produtos.getProdutoByDescricao(descricaoProduto);

        request.setAttribute("listaComFiltro", listaComFiltro);

        //response.sendRedirect("./view/listaProduto.jsp");
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/listaProduto.jsp");
        requestDispatcher.forward(request, response);

        // request.getRequestDispatcher("./view/listaProduto.jsp").forward(request, response);
    }

}
