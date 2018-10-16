package controller;

import data.ProdutoData;
import dao.ProdutoDAO;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "cadastrarProduto", urlPatterns = {"/cadastrarProduto"})
public class cadastrarProduto extends HttpServlet {

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    
        
            ProdutoData p = new ProdutoData();            
            
            Timestamp dataDeHoje = new Timestamp(System.currentTimeMillis());
            //formatar: String date = new SimpleDateFormat("dd/MM/yyyy").format(timestamp.getTime());
            p.setDataCadastro(dataDeHoje);
            
            System.out.println("preco do produto: "+request.getParameter("precoCusto"));
            
            p.setNome(request.getParameter("nomeProduto"));
            p.setDescricao(request.getParameter("descricao"));
            p.setPrecoDeCusto(Float.parseFloat(request.getParameter("precoCusto")));
            p.setPrecoDeVenda(Float.parseFloat(request.getParameter("precoVenda")));
            p.setEstoque(Integer.parseInt(request.getParameter("quantidade")));   
            int IdCategoria = Integer.parseInt(request.getParameter("categoria"));
            
            ProdutoDAO dao = new ProdutoDAO();
            
            dao.cadastraProduto(p,IdCategoria);
  
            request.setAttribute("retorno", "Mensagem de retorno pode ser variavel");
            
            request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

 
}
