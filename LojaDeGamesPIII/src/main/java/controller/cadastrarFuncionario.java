package controller;

import dao.FuncionarioDAO;
import data.FuncionarioData;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cadastrarFuncionario", urlPatterns = {"/cadastrarFuncionario"})
public class cadastrarFuncionario extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        FuncionarioData r = new FuncionarioData();
        
        r.setNome(request.getParameter("nomeFuncionario"));
        
        r.setCpf(request.getParameter("cpfFuncionario"));
        
        r.setEndereco(request.getParameter("endereco"));
        
        r.setCep(request.getParameter("cepFuncionario"));
        
        r.setTelefone(request.getParameter("telefone"));
        
        r.setCelular(request.getParameter("celular"));
        
        r.setCargo(request.getParameter("cargo"));
        
        r.setFilial(request.getParameter("filial"));
        
        r.setUsuario(request.getParameter("usuario"));
        
        r.setSenha(request.getParameter("senha"));
        
        FuncionarioDAO dao = new FuncionarioDAO();
        
        boolean deuCerto = dao.cadastraFuncionario(r);
        
        request.setAttribute("retorno", "ok");
        String MensagemDeRetorno = null;
        
        if (deuCerto == true) {
            MensagemDeRetorno = "Funcionario: '" + request.getParameter("nomeFuncionario") + "' cadastrado com sucesso!";
        } else {
            MensagemDeRetorno = "Houve um erro ao cadastrar o funcionario: '" + request.getParameter("nomeFuncionario") + "'.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);
        request.getRequestDispatcher("view/cadastrarFuncionario.jsp").forward(request, response);
    }
}
