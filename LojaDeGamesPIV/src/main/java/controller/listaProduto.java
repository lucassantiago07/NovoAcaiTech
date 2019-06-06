package controller;

import data.ProdutoData;
import dao.ProdutoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listaProduto", urlPatterns = {"/listaProduto"})
public class listaProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdutoDAO produtos = new ProdutoDAO();

        List<ProdutoData> lista = produtos.getProdutos();

        request.setAttribute("lista", lista);

 

    }

}
