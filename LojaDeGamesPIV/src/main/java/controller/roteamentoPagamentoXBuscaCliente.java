package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "roteamentoPagamentoXBuscaCliente", urlPatterns = {"/roteamentoPagamentoXBuscaCliente"})
public class roteamentoPagamentoXBuscaCliente extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Roteamento 'ganbearra' para trabalhar com form dentro de form
        String controledeChamadas = request.getParameter("controledeChamadas");

        if (controledeChamadas.equals("buscarCliente")) {
              
            // Se o botão que foi clicado, foi o de buscar cliente então ele direciona para servlet de cliente 
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/getClienteParaVenda");
            requestDispatcher.forward(request, response);

        } else if (controledeChamadas.equals("irPagaPagamento")) {
            
              // Se o botão que foi pagamento, foi o de buscar cliente então ele direciona para servlet de pagamento 
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/preparaPagamento");
            requestDispatcher.forward(request, response);
        }
        /*
        HttpSession session = request.getSession();
        session.setAttribute("getCargo", "");

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/pagamento.jsp");
        requestDispatcher.forward(request, response);
         */
    }

}
