package controller;

import controller.*;
import data.ProdutoData;
import dao.ProdutoDAO;
import dao.ProdutoDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "criaCarrinho", urlPatterns = {"/criaCarrinho"})
public class criaCarrinho extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         ArrayList<ProdutoData> listaProdutos = new ArrayList<>();
         HttpSession session = request.getSession();
         session.setAttribute("listaProdutos", listaProdutos);
         
         System.out.println("CRIADO:"+listaProdutos);

        
    }

}
