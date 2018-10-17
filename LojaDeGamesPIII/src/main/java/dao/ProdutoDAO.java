package dao;

import connection.ConnectionFactory;
import data.ProdutoData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProdutoDAO {

    public void cadastraProduto(ProdutoData p, int IdCategoria) {
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlProduto = "INSERT INTO `produto`(`NOME`, `DESCRICAO`, `PRECO_COMPRA`, `PRECO_VENDA`, `QUANTIDADE`, `DT_CADASTRO`,`CATEGORIA`,`PLATAFORMA`,`ANO_LANCAMENTO`,`FORNECEDOR`) VALUES (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmtProduto = connection.prepareStatement(sqlProduto);
            pstmtProduto.setString(1, p.getNome());
            pstmtProduto.setString(2, p.getDescricao());
            pstmtProduto.setFloat(3, p.getPrecoDeCusto());
            pstmtProduto.setFloat(4, p.getPrecoDeVenda());
            pstmtProduto.setInt(5, p.getEstoque());
            pstmtProduto.setTimestamp(6, p.getDataCadastro());
            pstmtProduto.setInt(7, p.getCategoria());
            pstmtProduto.setString(8, p.getPlataforma());
            pstmtProduto.setInt(9, p.getAnoLancamento());
            pstmtProduto.setString(10, p.getFornecedor());
            pstmtProduto.executeUpdate();

            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }

    }

    public ArrayList<ProdutoData> getProdutos() {
        ArrayList<ProdutoData> listaProdutos = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `produto` order by id desc");

            while (rs.next()) {
                ProdutoData p = new ProdutoData();

                p.setId(rs.getInt("ID"));
                p.setNome(rs.getString("NOME"));
                p.setDescricao(rs.getString("DESCRICAO"));
                p.setPrecoDeCusto(rs.getFloat("PRECO_COMPRA"));
                p.setPrecoDeVenda(rs.getFloat("PRECO_VENDA"));
                p.setEstoque(rs.getInt("QUANTIDADE"));
                p.setDataCadastro(rs.getTimestamp("DT_CADASTRO"));
                p.setCategoria(rs.getInt("CATEGORIA"));
                p.setAnoLancamento(rs.getInt("ANO_LANCAMENTO"));
                p.setFornecedor(rs.getString("FORNECEDOR"));
                listaProdutos.add(p);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados " + e);
        }

        return listaProdutos;
    }

    public ArrayList<ProdutoData> getProdutoByDescricao(String descricaoProduto) {
        ArrayList<ProdutoData> listaProdutos = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM `produto` WHERE  NOME LIKE '%" + descricaoProduto + "%' OR DESCRICAO LIKE '%" + descricaoProduto + "%' OR PLATAFORMA LIKE '%" + descricaoProduto + "%'");

            System.out.println("SELECT * FROM `produto` WHERE  NOME LIKE '%" + descricaoProduto + "%' OR DESCRICAO LIKE '%" + descricaoProduto + "%'");

            while (rs.next()) {
                ProdutoData p = new ProdutoData();
                p.setId(rs.getInt("ID"));
                p.setNome(rs.getString("NOME"));
                p.setDescricao(rs.getString("DESCRICAO"));
                p.setPrecoDeCusto(rs.getFloat("PRECO_COMPRA"));
                p.setPrecoDeVenda(rs.getFloat("PRECO_VENDA"));
                p.setEstoque(rs.getInt("QUANTIDADE"));
                p.setDataCadastro(rs.getTimestamp("DT_CADASTRO"));
                p.setCategoria(rs.getInt("CATEGORIA"));
                p.setAnoLancamento(rs.getInt("ANO_LANCAMENTO"));
                p.setFornecedor(rs.getString("FORNECEDOR"));
                listaProdutos.add(p);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados " + e);
        }

        return listaProdutos;
    }

    public int getMaxId() {
        ProdutoData p = new ProdutoData();
        int id = 0;
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT MAX(ID) AS ID FROM `produto`");
            while (rs.next()) {
                id = rs.getInt("ID");
            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados " + e);
        }
        return id;
    }

    public void alterarProduto(ProdutoData p) {

        try {
            Connection connection = new ConnectionFactory().getConnection();

            String altProduto = "UPDATE `produto` SET `nome`=?,`categoria`=?,`plataforma`=[value-4],`fornecedor`=[value-5],`descricao`=[value-6],`preco_compra`=[value-7],`preco_venda`=[value-8],`ano_lancamento`=[value-9],`quantidade`=[value-10],`dt_cadastro`=[value-11] WHERE `id`= ?";
            PreparedStatement pstmtProduto = connection.prepareStatement(altProduto);
            pstmtProduto.setString(1, p.getNome());
            pstmtProduto.setInt(2, p.getCategoria());
            pstmtProduto.setString(3, p.getPlataforma());
            pstmtProduto.setString(4, p.getFornecedor());
            pstmtProduto.setString(5, p.getDescricao());
            pstmtProduto.setFloat(6, p.getPrecoDeCusto());
            pstmtProduto.setFloat(7, p.getPrecoDeVenda());
            pstmtProduto.setInt(8, p.getAnoLancamento());
            pstmtProduto.setInt(9, p.getEstoque());
            pstmtProduto.setTimestamp(10, p.getDataCadastro());
            pstmtProduto.setInt(11, p.getId());

            pstmtProduto.executeUpdate();

            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }
    }

}
