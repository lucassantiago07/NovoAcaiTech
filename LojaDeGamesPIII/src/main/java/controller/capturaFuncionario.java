package controller;

import dao.FuncionarioDAO;
import data.ProdutoData;
import dao.ProdutoDAO;
import data.FuncionarioData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "capturaFuncionario", urlPatterns = {"/capturaFuncionario"})
public class capturaFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idFuncionario = request.getParameter("idFuncionario");

        FuncionarioDAO Funcionarios = new FuncionarioDAO();

        FuncionarioData f = Funcionarios.getFuncionarioById(Integer.parseInt(idFuncionario));

        request.setAttribute("funcionario", f);

        //request.getRequestDispatcher("view/listaProduto.jsp").forward(request, response);
    }

}
