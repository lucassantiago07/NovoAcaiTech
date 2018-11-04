package controller;

import data.FuncionarioData;
import dao.FuncionarioDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listaFuncionarioComFiltro", urlPatterns = {"/listaFuncionarioComFiltro"})
public class listaFuncionarioComFiltro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");

        FuncionarioDAO Funcionarios = new FuncionarioDAO();

        List<FuncionarioData> listaComFiltro = Funcionarios.getFuncionarioByNome(nome);

        request.setAttribute("listaComFiltro", listaComFiltro);

        //response.sendRedirect("./view/listaFuncionario.jsp");
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/listaFuncionario.jsp");
        requestDispatcher.forward(request, response);

        // request.getRequestDispatcher("./view/listaFuncionario.jsp").forward(request, response);
    }

}
