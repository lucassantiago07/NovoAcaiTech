package controller;

import dao.ProdutoDAO;
import data.ProdutoData;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "removeDoCarrinho", urlPatterns = {"/removeDoCarrinho"})
public class removeDoCarrinho extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("idProduto") != null) {

            ProdutoDAO dao = new ProdutoDAO();
            ProdutoData p = new ProdutoData();

            //Recupera todas informações do produto
            p = dao.getProdutoById(Integer.parseInt(request.getParameter("idProduto")));

            if (p.getId() > 0) {

                // Recupera variaveis da sessão.
                HttpSession session = request.getSession();

                // Recupera lista salva na sessão.
                ArrayList<ProdutoData> listaProdutos = (ArrayList<ProdutoData>) session.getAttribute("listaProdutos");

                // Recupera o id do produto enviado a servlet
                int idProdutoParaAddNaLista = p.getId();

                boolean produtoExisteNaLista = false;

                int posicaoArray = 0;

                // Percorre a lista para verificar se o produto já existe
                for (ProdutoData produtosDaLista : listaProdutos) {

                    // Verifica se o produto já existe na lista
                    if (listaProdutos.get(posicaoArray).getId() == p.getId()) {
                        produtoExisteNaLista = true;
                    }

                    if (produtoExisteNaLista) {
                        // Se já existe sai da lista
                        break;
                    } else {
                        // Se não existe ele continua passando a lista
                        posicaoArray++;
                    }

                }
                
                if (produtoExisteNaLista == true) {
                   
                    listaProdutos.remove(posicaoArray);
                    
                }

                // Salva as alterações
                session.setAttribute("listaProdutos", listaProdutos);

                response.sendRedirect("./view/carrinho.jsp");

            } else {
                System.out.println("ADICIONAR AO CARRINHO: O ID ESPECIFICADO NÃO EXISTE NO BANCO DE DADOS.");
            }
        }

    }

}
