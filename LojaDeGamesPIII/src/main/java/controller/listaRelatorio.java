package controller;

import dao.VendaDAO;
import data.VendaData;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Coutinho's
 */
@WebServlet(name = "listaRelatorio", urlPatterns = {"/Relatorio"})
public class listaRelatorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        VendaDAO relatorio = new VendaDAO();

        List<VendaData> lista = relatorio.getVendas();

        request.setAttribute("relatorio", lista);
    }

}
