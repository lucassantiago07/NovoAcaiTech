package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "cadastrarVenda", urlPatterns = {"/cadastrarVenda"})
public class finalizarVenda extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Informações recebidas pela página
        request.getParameter("vezesCartao");
        request.getParameter("numeroComprovante");
        request.getParameter("bandeira");
        request.getParameter("valorEmEspecie");
      
        // Infomações definidas no carrinho
        session.getAttribute("valorTotal");
        session.getAttribute("subTotal");
        session.getAttribute("Desconto");
        
        // Id Funcionario
        session.getAttribute("getId");
        
        // Id Filial 
        session.getAttribute("getFilial");
        
        // Id Cliente
        session.getAttribute("idCliente");

    }
}
