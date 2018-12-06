package controller;

import dao.VendaDAO;
import data.ProdutosDaVendaData;
import data.VendaData;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "capturaProdutosDaVenda", urlPatterns = {"/capturaProdutosDaVenda"})
public class capturaProdutosDaVenda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idVenda = Integer.parseInt(request.getParameter("idVenda"));

        VendaDAO daovenda = new VendaDAO();

        List<ProdutosDaVendaData> listaDeProdutosDaCompra = daovenda.getProdutosVendas(idVenda);

        request.setAttribute("abrirParaExibirProdutos", "ok");
        
        request.setAttribute("listaDeProdutosDaCompra", listaDeProdutosDaCompra);

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/relatorio.jsp");
        requestDispatcher.forward(request, response);
    }
}
