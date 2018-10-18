package controller;

import data.ProdutoData;
import dao.ProdutoDAO;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cadastrarProduto", urlPatterns = {"/cadastrarProduto"})
public class cadastrarProduto extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdutoData p = new ProdutoData();

        Timestamp dataDeHoje = new Timestamp(System.currentTimeMillis());
        //tentei formatar, não testado String date = new SimpleDateFormat("dd/MM/yyyy").format(Timestamp.from(Instant.now()));
        p.setDataCadastro(dataDeHoje);

        p.setNome(request.getParameter("nomeProduto"));

        p.setDescricao(request.getParameter("descricao"));

        p.setPrecoDeCusto(Integer.parseInt(request.getParameter("precoCusto")));

        p.setPrecoDeVenda(Integer.parseInt(request.getParameter("precoVenda")));

        p.setEstoque(Integer.parseInt(request.getParameter("estoque")));

        p.setPlataforma(request.getParameter("plataforma"));

        p.setAnoLancamento(Integer.parseInt(request.getParameter("anolancamento")));

        p.setCategoria(Integer.parseInt(request.getParameter("categoria")));

        System.out.println("Categoria Servlet: " + request.getParameter("categoria"));

        p.setFornecedor(request.getParameter("fornecedor"));

        ProdutoDAO dao = new ProdutoDAO();

        dao.cadastraProduto(p);

        request.setAttribute("retorno", "OK");

        request.getRequestDispatcher("view/cadastrarProduto.jsp").forward(request, response);
    }

}
