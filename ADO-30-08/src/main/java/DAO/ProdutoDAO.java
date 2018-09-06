package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Connection.Conexao;
import DATA.ProdutoDATA;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {

    public void incluirProduto(ProdutoDATA p) throws ClassNotFoundException, SQLException {
        try {
            String querySql = "INSERT INTO PRODUTO (NOME,DESCRICAO,PRECO_COMPRA,PRECO_VENDA,QUANTIDADE) VALUES (?,?,?,?,?)";

            //Cria conexão com banco de dados
            Connection connection = new Conexao().obterConexao();

            //Prepara a query
            PreparedStatement pstmt = connection.prepareStatement(querySql);
            //Captura campos e seta na query
            pstmt.setString(1, p.getNome());
            pstmt.setString(2, p.getDescricao());
            pstmt.setFloat(3, p.getPrecoCompra());
            pstmt.setFloat(4, p.getPrecoVenda());
            pstmt.setInt(5, p.getQuantidade());
            //pstmt.setDate(6, p.getDataCadastro());

            pstmt.executeUpdate();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro ao cadastrar");
        }

    }

    public void consultarProduto() {
        try {
            /*
            
            PENDENTE
            
             */

            String querySql = "";

            //Cria conexão com banco de dados
            Connection connection = new Conexao().obterConexao();

            //Prepara a query
            PreparedStatement pstmt = connection.prepareStatement(querySql);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro ao consultar o produto");
        }
    }

    public void alterarProduto() {
        try {
            String querySql = "";

            //Cria conexão com banco de dados
            Connection connection = new Conexao().obterConexao();

            //Prepara a query
            PreparedStatement pstmt = connection.prepareStatement(querySql);

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro ao alterar o produto");
        }

    }

    public void excluirProduto(Integer id) throws ClassNotFoundException, SQLException {
        try {
            String querySql = "DELETE FROM PRODUTO WHERE ID = ?";

            //Cria conexão com banco de dados
            Connection connection = new Conexao().obterConexao();

            //Prepara a query
            PreparedStatement pstmt = connection.prepareStatement(querySql);

            //Captura campos e seta na query
            pstmt.setInt(1, id);

            pstmt.executeUpdate();

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro ao excluir");
        }

    }

    public List<ProdutoDATA> exibeProdutosDisponivelParaAlterar() throws SQLException, ClassNotFoundException {

        String querySql = "SELECT * FROM PRODUTO";

        //Cria conexão com banco de dados
        Connection connection = new Conexao().obterConexao();

        //Prepara a query
        PreparedStatement pstmt = connection.prepareStatement(querySql);

        // Cria uma lista de produtos
        List<ProdutoDATA> produtosList = new ArrayList<>();

        // Executa comando no banco e retorna em 'rs' o resultado
        ResultSet rs = pstmt.executeQuery(querySql);

        //para percorrer o resultset, faca:
        while (rs.next()) {

            ProdutoDATA p = new ProdutoDATA();
                        
            p.setId(rs.getInt("ID"));
            p.setNome(rs.getString("NOME"));
            p.setDescricao(rs.getString("DESCRICAO"));
            p.setPrecoCompra(rs.getFloat("PRECO_COMPRA"));
            p.setPrecoVenda(rs.getFloat("PRECO_VENDA"));
            p.setQuantidade(rs.getInt("QUANTIDADE"));
            p.setDataCadastro(rs.getTimestamp("DT_CADASTRO"));
            produtosList.add(p);
        }

        return produtosList;
    }

}
