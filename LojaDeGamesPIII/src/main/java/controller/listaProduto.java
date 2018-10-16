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


@WebServlet(name = "listaProduto", urlPatterns = {"/listaProduto"})
public class listaProduto extends HttpServlet {

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String descricaoProduto = request.getParameter("descricaoProduto");
        
            request.setAttribute("retorno", "Mensagem de retorno pode ser variavel");
            
            request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

 
}
