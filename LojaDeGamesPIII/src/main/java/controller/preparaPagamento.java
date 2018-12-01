package controller;

import dao.VendaDAO;
import data.ProdutoData;
import data.VendaData;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "preparaPagamento", urlPatterns = {"/preparaPagamento"})
public class preparaPagamento extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        // Captura algumas informaçoes definidas no carrinho.
        String valorTotal = request.getParameter("valorTotal");
        String subTotal = request.getParameter("subTotal");
        String Desconto = request.getParameter("Desconto");
        
        // Salva na sessão.
        session.setAttribute("valorTotal", valorTotal);
        session.setAttribute("subTotal", subTotal);
        session.setAttribute("Desconto", Desconto);   
        
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/pagamento.jsp");
        requestDispatcher.forward(request, response);

    }

}
