package controller;

import dao.VendaDAO;
import data.VendaData;
import java.io.IOException;
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
@WebServlet(name = "listaRelatorioPorId", urlPatterns = {"/RelatorioPorId"})
public class listaRelatorioPorId extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Integer idRelatorio = Integer.parseInt(request.getParameter("idRelatorio"));
        
        System.out.println("ID: " + idRelatorio);
        
        VendaDAO relatorio = new VendaDAO();
        
        VendaData listaComId = relatorio.getVendaById(idRelatorio);
        
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/relatorio.jsp");
        requestDispatcher.forward(request, response);
    }
}
