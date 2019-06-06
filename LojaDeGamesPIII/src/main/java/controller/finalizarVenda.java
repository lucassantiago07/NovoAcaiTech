package controller;

import dao.VendaDAO;
import data.ProdutoData;
import data.VendaData;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "finalizarVenda", urlPatterns = {"/finalizarVenda"})
public class finalizarVenda extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();

            // Informações recebidas pela página
            String vezesCartao = request.getParameter("vezesCartao");
            String bandeira = request.getParameter("bandeira");
            String valorParcela = request.getParameter("valorParcela");
            String valorEmEspecie = request.getParameter("valorTotalBoleto");

            // Infomações definidas no carrinho
            String valorTotal = (String) session.getAttribute("valorTotal");
            String subTotal = (String) session.getAttribute("subTotal");
            
            //Cliente
            String idCliente = request.getParameter("idCliente");

            // Lista de produtos
            ArrayList<ProdutoData> listaProdutos = (ArrayList<ProdutoData>) session.getAttribute("listaProdutos");

            // Data hora atual
            Timestamp DataDaVenda = new Timestamp(System.currentTimeMillis());

            VendaData v = new VendaData();
            v.setBandeira(bandeira);
            v.setDataDaVenda(DataDaVenda);
            v.setIdCliente(idCliente);
            v.setListaDeProtudosDaVenda(listaProdutos);
            v.setSubTotal(subTotal);
            v.setValorTotal(valorTotal);
            v.setVezesCartao(vezesCartao);
            v.setValorEmEspecie(valorEmEspecie);

            /*
            System.out.println(v.getBandeira());
            System.out.println(v.getDataDaVenda());
            System.out.println(v.getDesconto());
            System.out.println(v.getFilial());
            System.out.println(v.getIdCliente());
            System.out.println(v.getIdVendedor());
            System.out.println(v.getListaDeProtudosDaVenda());
            System.out.println(v.getNumeroComprovante());
            System.out.println(v.getSubTotal());
            System.out.println(v.getValorEmEspecie());
            System.out.println(v.getValorTotal());
            System.out.println(v.getVezesCartao());
             */
            VendaDAO dao = new VendaDAO();
            boolean cadastraVenda = dao.cadastraVenda(v);

            request.setAttribute("retorno", "ok");
            String MensagemDeRetorno = null;

            if (cadastraVenda == true) {
                MensagemDeRetorno = "Parabéns Sr(a) " + session.getAttribute("getNome") + ", sua venda foi realizada com sucesso!";
                ArrayList<ProdutoData> listaProdutosNova = new ArrayList<>();
                session.setAttribute("listaProdutos", listaProdutosNova);
            } else {
                MensagemDeRetorno = "Houve um erro ao realizar a venda.";
            }
            request.setAttribute("retornoMensagem", MensagemDeRetorno);
            request.getServletContext().getRequestDispatcher("/view/carrinho.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro Servlet finalizarVEnda");
        }

    }
}
