package controller;

import controller.*;
import data.ProdutoData;
import dao.ProdutoDAO;
import dao.ProdutoDAO;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
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

        String descricaoProduto = request.getParameter("descricaoProduto");
        
        if (descricaoProduto == null) {     
            
             List<ProdutoData> lista = produtos.getProdutos();
            request.setAttribute("lista", lista);
             
        } else {
            
            List<ProdutoData> lista = produtos.getProdutos();
            lista = produtos.getProdutoByDescricao(descricaoProduto);
            request.setAttribute("lista", lista);
          
        }
  
    }
}


