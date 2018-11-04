package controller;

import data.FuncionarioData;
import dao.FuncionarioDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listaFuncionario", urlPatterns = {"/listaFuncionario"})
public class listaFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FuncionarioDAO Funcionarios = new FuncionarioDAO();

        List<FuncionarioData> lista = Funcionarios.getFuncionarios();

        request.setAttribute("lista", lista);

        

    }

}
