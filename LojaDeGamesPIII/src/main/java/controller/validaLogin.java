package controller;

import dao.FuncionarioDAO;
import data.FuncionarioData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "validaLogin", urlPatterns = {"/validaLogin"})
public class validaLogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if ((request.getParameter("usuario") != null) || (request.getParameter("senha") != null)) {

            FuncionarioDAO fdao = new FuncionarioDAO();

            FuncionarioData f = fdao.verificaLogin(request.getParameter("usuario"), request.getParameter("senha"));

            if (f.getNome() != null) {
                HttpSession session = request.getSession();
                session.setAttribute("getCargo", f.getCargo());
                session.setAttribute("getCelular", f.getCelular());
                session.setAttribute("getCep", f.getCep());
                session.setAttribute("getCpf", f.getCpf());
                session.setAttribute("getEndereco", f.getEndereco());
                session.setAttribute("getFilial", f.getFilial());
                session.setAttribute("getId", f.getId());
                session.setAttribute("getNome", f.getNome());
                session.setAttribute("getNome", f.getTelefone());

            }

        }

    }

}
