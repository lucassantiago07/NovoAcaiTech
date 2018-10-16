package controller;

import controller.*;
import data.ProdutoData;
import dao.ProdutoDAO;
import dao.ProdutoDAO;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "alterarProduto", urlPatterns = {"/alterarProduto"})
public class alterarProduto extends HttpServlet {

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String idProduto = request.getParameter("ID");
        
            request.setAttribute("retorno", "Mensagem de retorno pode ser variavel");
            
            request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

 
}
