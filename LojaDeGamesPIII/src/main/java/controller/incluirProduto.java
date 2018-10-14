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



// ----------------------------------------------------------
//
//
//
//
//                AJUSTAR!!!!!!!
//         APENAS EXEMPLO. PARA AJUDAR
//
//
//
//
//
// ----------------------------------------------------------



@WebServlet(name = "incluirProduto", urlPatterns = {"/incluirProduto"})
public class incluirProduto extends HttpServlet {

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            ProdutoData p = new ProdutoData();
            
            
            Timestamp dataDeHoje = new Timestamp(System.currentTimeMillis());
            //formatar: String date = new SimpleDateFormat("dd/MM/yyyy").format(timestamp.getTime());
            p.setDataCadastro(dataDeHoje);
            
            p.setNome(request.getParameter(""));
            p.setDescricao(request.getParameter(""));
            p.setPrecoDeCusto(Float.parseFloat(request.getParameter("")));
            p.setPrecoDeVenda(Float.parseFloat(request.getParameter("")));
            p.setEstoque(Integer.parseInt(request.getParameter("")));   
            int IdCategoria = Integer.parseInt(request.getParameter(""));
            
            ProdutoDAO dao = new ProdutoDAO();
            
            dao.cadastraProduto(p,IdCategoria);
  
            request.setAttribute("retorno", "Mensagem de retorno pode ser variavel");
            
            request.getRequestDispatcher("view/produtos.jsp").forward(request, response);
    }

 
}
