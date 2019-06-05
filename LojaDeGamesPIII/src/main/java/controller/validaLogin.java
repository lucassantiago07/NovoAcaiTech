package controller;

import dao.FuncionarioDAO;
import data.FuncionarioData;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "validaLogin", urlPatterns = {"/validaLogin"})
public class validaLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String retorno = "/view/destaques.jsp";

        boolean deuCerto = false;
        String nome = null;
        String MensagemDeRetorno = null;

        Date data = new Date();
        SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String dataAtual = formatador.format(data);
        
        //System.out.println(request.getParameter("usuario"));
        //System.out.println(request.getParameter("senha"));

        if ((request.getParameter("usuario") != null) || (request.getParameter("senha") != null)) {

            FuncionarioDAO fdao = new FuncionarioDAO();

            FuncionarioData f = fdao.verificaLogin(request.getParameter("usuario"), request.getParameter("senha"));
            
            //System.out.println(f.getNome());

            if (f.getNome() != null) {
                retorno = "/view/login.jsp";
                HttpSession session = request.getSession();
                session.setAttribute("getCargo", f.getCargo());
                session.setAttribute("getCelular", f.getCelular());
                session.setAttribute("getCep", f.getCep());
                session.setAttribute("getCpf", f.getCpf());
                session.setAttribute("getEndereco", f.getEndereco());
                session.setAttribute("getFilial", f.getFilial());
                session.setAttribute("getId", f.getId());
                session.setAttribute("getNome", f.getNome());
                session.setAttribute("getTelefone", f.getTelefone());
                session.setAttribute("getData", dataAtual);
                
                nome = f.getNome();
                deuCerto = true;
                
            }
        }

        request.setAttribute("retorno", "ok");

        if (deuCerto == true) {
            MensagemDeRetorno = "Seja bem vindo(a) " + nome + "! " + dataAtual + "";
        } else {
            MensagemDeRetorno = "Não foi possível efetuar o login.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);

        request.getServletContext().getRequestDispatcher(retorno).forward(request, response);

    }

}
