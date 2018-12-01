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

@WebServlet(name = "preparaPagamento", urlPatterns = {"/preparaPagamento"})
public class preparaPagamento extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        VendaData venda = new VendaData();

        // Identificação do vendedor
        int IdVendedor = (Integer) session.getAttribute("getId");
        venda.setIdVendedor(String.valueOf(IdVendedor));

        // Data hora atual da venda
        Timestamp DataDaVenda = new Timestamp(System.currentTimeMillis());
        venda.setDataDaVenda(DataDaVenda);

        // Recupera o array aonde foram salvos os produtos;
        venda.setListaDeProtudosDaVenda((ArrayList<ProdutoData>) session.getAttribute("listaProdutos"));

        String valorTotal = request.getParameter("valorTotal");
        venda.setValorTotal(valorTotal);

        String subTotal = request.getParameter("subTotal");
        venda.setSubTotal(subTotal);

        String Desconto = request.getParameter("Desconto");
        venda.setDesconto(Desconto);

        int idCliente = (Integer) session.getAttribute("idCliente");
        venda.setIdCliente(String.valueOf(idCliente));

        venda.setFilial((String) session.getAttribute("getFilial"));

        /*
        System.out.println(valortotal);
        
        System.out.println(desconto);
        System.out.println(tIdVendedor);
        System.out.println(venda.getListaDeProtudosDaVenda());
        System.out.println(idCliente);
         */
        VendaDAO daoVenda = new VendaDAO();
        boolean retorno = daoVenda.cadastraVenda(venda);

        /*
        
        session.setAttribute("getCargo", "");

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/pagamento.jsp");
        requestDispatcher.forward(request, response);
         */
    }

}
