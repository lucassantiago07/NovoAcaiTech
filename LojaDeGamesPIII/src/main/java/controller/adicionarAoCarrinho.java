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

@WebServlet(name = "adicionarAoCarrinho", urlPatterns = {"/adicionarAoCarrinho"})
public class adicionarAoCarrinho extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("idProduto") != null) {

            //Recupera todas informações do produto
            ProdutoDAO dao = new ProdutoDAO();
            ProdutoData p = new ProdutoData();
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

                    System.out.println("Existe?: " + produtoExisteNaLista);

                    if (produtoExisteNaLista) {
                        // Se já existe sai da lista
                        break;
                    } else {
                        // Se não existe ele continua passando a lista
                        posicaoArray++;
                    }

                }

                if (produtoExisteNaLista == false) {

                    // Se o produto não existe, ele vai adicionar.
                    p.setQtdCarrinho(1);
                    listaProdutos.add(p);

                } else {
                    // Caso já exista nós acresentamos mais um de quantidade 

                    // Recupera qual o produto
                    ProdutoData produto = listaProdutos.get(posicaoArray);

                    // Recupera a quantidade que esta salvo no carrinho
                    int QtdCarrinho = produto.getQtdCarrinho();

                    if (QtdCarrinho <= produto.getEstoque()-1) {
                        // Aumentando a quantidade
                        produto.setQtdCarrinho(QtdCarrinho + 1);
                    }

                }

                // Salva as alterações
                session.setAttribute("listaProdutos", listaProdutos);

                // Indica qual pagina deve voltar
                // String retorno = "/view/carrinho.jsp";
                // Retorna para pagina indica sem perder dados.
                //request.getServletContext().getRequestDispatcher(retorno).forward(request, response);
                response.sendRedirect("./view/carrinho.jsp");

                //Impressao temporaria
                int index = 0;
                for (ProdutoData pImpressao : listaProdutos) {

                    String Nome = listaProdutos.get(index).getNome();
                    int Id = listaProdutos.get(index).getId();
                    int Estoque = listaProdutos.get(index).getQtdCarrinho();

                    System.out.println("ID: " + Id + " Nome: " + Nome + " Carrinho: " + Estoque);

                    index++;

                }
            } else {
                System.out.println("ADICIONAR AO CARRINHO: O ID ESPECIFICADO NÃO EXISTE NO BANCO DE DADOS.");
            }
        }

    }

}
