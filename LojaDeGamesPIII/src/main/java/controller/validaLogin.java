package controller;

import dao.ClienteDAO;
import dao.FuncionarioDAO;
import data.ClienteData;
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

        if ((request.getParameter("email") != null) || (request.getParameter("senha") != null)) {

            
            
            
            
            ClienteDAO novadaodocliente = new ClienteDAO();
            //FuncionarioDAO fdao = new FuncionarioDAO();

            
            ClienteData novocliente = novadaodocliente.verificaLogin(request.getParameter("email"), request.getParameter("senha"));
            //FuncionarioData f = fdao.verificaLogin(request.getParameter("usuario"), request.getParameter("senha"));
            
            
            
            
            
            
            //-- Já estava aqui -- System.out.println(f.getNome());

            if (novocliente.getNome() != null) {
                retorno = "/view/login.jsp";
                HttpSession session = request.getSession();
                session.setAttribute("getId", novocliente.getId());
                session.setAttribute("getNome", novocliente.getNome());
                session.setAttribute("getCpf", novocliente.getCpf());
                session.setAttribute("getEmail", novocliente.getEmail());
                session.setAttribute("getEndereco", novocliente.getEndereco());
                session.setAttribute("getCep", novocliente.getCep());
                session.setAttribute("getnumerodoendereco", novocliente.getNumerodoendereco());
                session.setAttribute("getComplemento", novocliente.getComplemento());
                session.setAttribute("getCidade", novocliente.getCidade());
                session.setAttribute("getEstado", novocliente.getEstado());
                session.setAttribute("getTelefone", novocliente.getTelefone());
                session.setAttribute("getCelular", novocliente.getCelular());
                session.setAttribute("getSenha", novocliente.getSenha());
                session.setAttribute("getData", dataAtual);
 
                nome = novocliente.getNome();
                deuCerto = true;
                
            }
        }

        request.setAttribute("retorno", "ok");

        if (deuCerto == true) {
            MensagemDeRetorno = "Seja bem vindo(a) " + nome + "! " + dataAtual + "";
        } else {
            retorno = "/view/login.jsp";
            MensagemDeRetorno = "Não foi possível efetuar o login.";
        }
        request.setAttribute("retornoMensagem", MensagemDeRetorno);

        request.getServletContext().getRequestDispatcher(retorno).forward(request, response);

    }

}
