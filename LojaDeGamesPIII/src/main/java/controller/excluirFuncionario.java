package controller;

import dao.FuncionarioDAO;
import data.FuncionarioData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "excluirFuncionario", urlPatterns = {"/excluirFuncionario"})
public class excluirFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));

        FuncionarioDAO Funcionario = new FuncionarioDAO();

        FuncionarioData FuncionarioSendoExcluido = Funcionario.getFuncionarioById(idFuncionario);

        boolean deuCerto = Funcionario.excluirFuncionario(idFuncionario);

        request.setAttribute("retorno", "ok");

        String MensagemDeRetorno = null;

        if (deuCerto == true) {
            MensagemDeRetorno = "Funcionario: '" + FuncionarioSendoExcluido.getNome() + "' excluido com sucesso!";
        } else {
            MensagemDeRetorno = "Houve um erro ao excluir o Funcionario: '" + FuncionarioSendoExcluido.getNome() + "'.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);
        request.getRequestDispatcher("view/listaFuncionario.jsp").forward(request, response);
    }

}
