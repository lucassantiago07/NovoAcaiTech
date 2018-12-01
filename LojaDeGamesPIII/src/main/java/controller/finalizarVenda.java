package controller;

import dao.VendaDAO;
import data.ProdutoData;
import data.VendaData;
import java.io.IOException;
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

        HttpSession session = request.getSession();

        // Informações recebidas pela página
        String vezesCartao = request.getParameter("vezesCartao");
        String numeroComprovante = request.getParameter("numeroComprovante");
        String bandeira = request.getParameter("bandeira");
        String valorEmEspecie = request.getParameter("valorEmEspecie");

        // Infomações definidas no carrinho
        String valorTotal = (String) session.getAttribute("valorTotal");
        String subTotal = (String) session.getAttribute("subTotal");
        String Desconto = (String) session.getAttribute("Desconto");

        // Id Funcionario
        String IdFuncionario = (String) session.getAttribute("getId");

        // Id Filial 
        String getFilial = (String) session.getAttribute("getFilial");

        // Id Cliente
        String idCliente = (String) session.getAttribute("idCliente");
        
        // Lista de produtos
        ArrayList<ProdutoData> listaProdutos = (ArrayList<ProdutoData>) session.getAttribute("listaProdutos");

        // Data hora atual
        Timestamp DataDaVenda = new Timestamp(System.currentTimeMillis());

        VendaData v = new VendaData();
        v.setBandeira(bandeira);
        v.setDataDaVenda(DataDaVenda);
        v.setDesconto(Desconto);
        v.setFilial(getFilial);
        v.setIdCliente(idCliente);
        v.setIdVendedor(IdFuncionario);
        v.setListaDeProtudosDaVenda(listaProdutos);
        v.setNumeroComprovante(numeroComprovante);
        v.setSubTotal(subTotal);
        v.setValorEmEspecie(valorEmEspecie);
        v.setValorTotal(valorTotal);
        v.setVezesCartao(vezesCartao);
        
        VendaDAO dao = new VendaDAO();
        dao.cadastraVenda(v);

    }
}
