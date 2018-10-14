package dao;

import connection.ConnectionFactory;
import data.ProdutoData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


// ----------------------------------------------------------
//
//
//
//
//                AJUSTAR!!!!!!!
//         APENAS EXEMPLO. PARA AJUDAR
//
//
//
//
//
// ----------------------------------------------------------



public class ProdutoDAO {
    
    public void cadastraProduto(ProdutoData p, int IdCategoria) {
        try {            
            Connection connection = new ConnectionFactory().getConnection();
            
            //Produto
            String sqlProduto = "INSERT INTO `produto`(`NOME`, `DESCRICAO`, `PRECO_COMPRA`, `PRECO_VENDA`, `QUANTIDADE`, `DT_CADASTRO`) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstmtProduto = connection.prepareStatement(sqlProduto);
            pstmtProduto.setString(1, p.getNome());
            pstmtProduto.setString(2, p.getDescricao());
            pstmtProduto.setFloat(3, p.getPrecoDeCusto());
            pstmtProduto.setFloat(4, p.getPrecoDeVenda());
            pstmtProduto.setInt(5, p.getEstoque());
            pstmtProduto.setTimestamp(6, p.getDataCadastro());           
            pstmtProduto.executeUpdate();
            
            //Associa categoria X produto
            int IdProduto = getMaxId();            
            String sqlCategoria  = "INSERT INTO `produto_categoria`(`ID_PRODUTO`, `ID_CATEGORIA`) VALUES (?,?)";
            PreparedStatement pstmtCategoria = connection.prepareStatement(sqlCategoria);
            pstmtCategoria.setInt(1, IdProduto);
            pstmtCategoria.setInt(2, IdCategoria);
            pstmtCategoria.executeUpdate();

            //Fecha o banco
            connection.close();
        } catch (SQLException ex) {
            System.out.println("Erro no banco de dados" + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }
      
    }
    
 
    public ArrayList<ProdutoData> getProdutos() {
        ArrayList<ProdutoData> listaProdutos = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `produto`");
            while (rs.next()) {
                ProdutoData p = new ProdutoData();
                
                p.setId(rs.getInt("ID"));                
                p.setNome(rs.getString("NOME"));
                p.setDescricao(rs.getString("DESCRICAO"));
                p.setPrecoDeCusto(rs.getFloat("PRECO_COMPRA"));
                p.setPrecoDeVenda(rs.getFloat("PRECO_VENDA"));
                p.setEstoque(rs.getInt("QUANTIDADE"));
                p.setDataCadastro(rs.getTimestamp("DT_CADASTRO"));
                System.out.println(rs.getString("ID"));
                listaProdutos.add(p);
                
                System.out.println(rs.getInt("ID"));
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


}
