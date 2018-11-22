package controller;

import dao.VendaDAO;
import data.ProdutosDaVendaData;
import data.VendaData;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cadastrarVenda", urlPatterns = {"/cadastrarVenda"})
public class cadastrarVenda extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Cria uma lista para adicionar todos os produtos de uma venda
        ArrayList<ProdutosDaVendaData> listaDeProdutosDaVenda = new ArrayList<>();

        // Cria um item de venda
        VendaData vendaCompleta = new VendaData();

        // A pagina web manda um array para o servlet, abaixo é feito a captura e salvo no array
        String nomeProdutos[] = request.getParameterValues("nomeProdutos");
        String quantidade[] = request.getParameterValues("quantidade");
        String precoUnitario[] = request.getParameterValues("precoUnitario");

        // Agora é feito um laço para capturar cada item enviado pela pagina web
        // A cada laço eu monto um item para ser adiciona na llsta de produtos
        int index = 0;
        for (String p : nomeProdutos) {
            // Cria um item produto para ser adicionado a cada posição da lista dos produtos da venda
            ProdutosDaVendaData produtoDaVenda = new ProdutosDaVendaData();
            produtoDaVenda.setNomeProduto(nomeProdutos[index]);
            produtoDaVenda.setQuantidade(Integer.parseInt(quantidade[index]));
            produtoDaVenda.setPrecoUnitario(Integer.parseInt(precoUnitario[index]));
            listaDeProdutosDaVenda.add(produtoDaVenda);
            index++;
        }

        vendaCompleta.setListaDeProtudosDaVenda(listaDeProdutosDaVenda);

        VendaDAO dao = new VendaDAO();

        boolean deuCerto = dao.cadastraVenda(vendaCompleta);

        request.setAttribute("retorno", "ok");
        String MensagemDeRetorno = null;

        if (deuCerto == true) {
            MensagemDeRetorno = "Venda realizada sucesso!";
        } else {
            MensagemDeRetorno = "Houve um erro no registro da venda.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);
        request.getRequestDispatcher("view/index.jsp").forward(request, response);
    }
}
