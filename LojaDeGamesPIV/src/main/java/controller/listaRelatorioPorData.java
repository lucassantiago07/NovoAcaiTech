package controller;

import dao.VendaDAO;
import data.VendaData;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Coutinho's
 */
@WebServlet(name = "listaRelatorioPorData", urlPatterns = {"/RelatorioPorData"})
public class listaRelatorioPorData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dataRelatorio = request.getParameter("dataRelatorio");
        
        System.out.println("Data: " + dataRelatorio);
        
        VendaDAO relatorio = new VendaDAO();
        
        List<VendaData> listaComData = relatorio.getVendaByData(dataRelatorio);
        
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/relatorio.jsp");
        requestDispatcher.forward(request, response);
    }
}
