package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.VendaDAO;
import data.VendaData;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "getRelatorio", urlPatterns = {"/getRelatorio"})
public class getRelatorio extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean deuCerto = false;

        String data = request.getParameter("dataDePesquisa");

        request.setAttribute("retorno", "ok");

        String MensagemDeRetorno = null;

        VendaDAO dao = new VendaDAO();

        ArrayList<VendaData> listaVenda = new ArrayList<>();

        listaVenda = dao.getVendaByData(data);

        if (deuCerto == true) {
            MensagemDeRetorno = "MENSAGEM DE RETORNO PARA SUCESSO";
        } else {
            MensagemDeRetorno = "MENSAGEM DE RETORNO PARA ERRO.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/relatorio.jsp");
        requestDispatcher.forward(request, response);

    }

}
