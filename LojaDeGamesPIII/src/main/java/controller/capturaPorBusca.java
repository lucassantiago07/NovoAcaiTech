package controller;

import data.FuncionarioData;
import dao.FuncionarioDAO;
import dao.ProdutoDAO;
import data.ProdutoData;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "capturaPorBusca", urlPatterns = {"/capturaPorBusca"})
public class capturaPorBusca extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jogo = request.getParameter("jogo");

        ProdutoDAO produtos = new ProdutoDAO();

        List<ProdutoData> lista = produtos.getProdutoByDescricao(jogo);

        request.setAttribute("filtro", "ok");

        request.setAttribute("lista", lista);

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/destaques.jsp");
        requestDispatcher.forward(request, response);
    }

}
