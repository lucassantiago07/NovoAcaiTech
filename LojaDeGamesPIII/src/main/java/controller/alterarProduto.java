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
        
        String idProduto = request.getParameter("idProduto");
        
        ProdutoDAO produtos = new ProdutoDAO();
        
        ProdutoData p = produtos.getProdutoById(Integer.parseInt(idProduto));
        
        request.setAttribute("produto", p);

        //request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProdutoDAO dao = new ProdutoDAO();
        ProdutoData p = new ProdutoData();
        
        p.setNome(request.getParameter("nomeProduto"));
        p.setPrecoDeVenda(Float.parseFloat(request.getParameter("precoVenda")));
        p.setPrecoDeCusto(Float.parseFloat(request.getParameter("precoCusto")));
        p.setFornecedor(request.getParameter("fornecedor"));
        p.setCategoria(Integer.parseInt(request.getParameter("categoria")));
        p.setEstoque(Integer.parseInt(request.getParameter("estoque")));
        p.setAnoLancamento(Integer.parseInt(request.getParameter("anolancamento")));
        p.setDescricao(request.getParameter("descricao"));        
        p.setPlataforma(request.getParameter("plataforma"));
        
        
        
        dao.alterarProduto(p);
        
        request.setAttribute("retorno", "Mensagem de retorno pode ser variavel");
        
        request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }
    
}
