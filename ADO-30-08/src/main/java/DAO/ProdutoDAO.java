/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Connection.Conexao;
import Data.ProdutoData;
/**
 *
 * @author lucas.ssantos57
 */
public class ProdutoDAO {
    
   public void incluirProduto(ProdutoData p) throws ClassNotFoundException, SQLException{
       
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
       
   }
   
   public void consultarProduto(){
       
   }
   
   public void alterarProduto(){
       
   }
   
   public void excluirProduto(){
       
   }
    
}
