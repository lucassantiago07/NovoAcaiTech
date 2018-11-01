/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.ConnectionFactory;
import data.ClienteData;
import data.ProdutoData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author murilo.aaraujo
 */
public class ClienteDAO {
    
    public void cadastraCliente(ClienteData p) {
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlCliente = "INSERT INTO `produto`(`nome`, `cpf`, `email`, `endereco`, `cep`, `telefone`, `celular`) VALUES (?,?,?,?,?,?,?)";
            System.out.println(sqlCliente);
            PreparedStatement pstmtProduto = connection.prepareStatement(sqlCliente);
            pstmtProduto.setString(1, p.getNome());
            pstmtProduto.setInt(2, p.getCpf());
            pstmtProduto.setString(3, p.getEmail());
            pstmtProduto.setString(4, p.getEndereco());
            pstmtProduto.setInt(5, p.getCep());
            pstmtProduto.setInt(6, p.getTelefone());
            pstmtProduto.setInt(7, p.getCelular());
            pstmtProduto.executeUpdate();
            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }

    }
    
    
    
}
