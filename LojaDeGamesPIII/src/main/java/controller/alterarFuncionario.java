package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import data.FuncionarioData;
import dao.FuncionarioDAO;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "alterarFuncionario", urlPatterns = {"/alterarFuncionario"})
public class alterarFuncionario extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FuncionarioDAO dao = new FuncionarioDAO();
        FuncionarioData c = new FuncionarioData();

        c.setId(Integer.parseInt(request.getParameter("id")));
        c.setNome(request.getParameter("nomeFuncionario"));
        c.setFilial(Integer.parseInt(request.getParameter("filial")));
        c.setCargo(request.getParameter("filial"));
        c.setCpf(request.getParameter("cpfFuncionario"));
        c.setEndereco(request.getParameter("enderecoFuncionario"));
        c.setCep(request.getParameter("cepFuncionario"));
        c.setTelefone(request.getParameter("telefoneFuncionario"));
        c.setCelular(request.getParameter("celularFuncionario"));

        boolean deuCerto = dao.alterarFuncionario(c);

        request.setAttribute("retorno", "ok");

        String MensagemDeRetorno = null;

        if (deuCerto == true) {
            MensagemDeRetorno = "Funcionario: '" + request.getParameter("nomeFuncionario") + "' alterado com sucesso!";
        } else {
            MensagemDeRetorno = "Houve um erro ao alterar o funcionario '" + request.getParameter("nomeFuncionario") + "'.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/alterarFuncionario.jsp");
        requestDispatcher.forward(request, response);

    }

}
