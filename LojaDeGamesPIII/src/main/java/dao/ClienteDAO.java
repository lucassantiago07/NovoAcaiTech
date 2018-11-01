/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.ConnectionFactory;
import data.ClienteData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author murilo.aaraujo
 */
public class ClienteDAO {

    public void cadastraCliente(ClienteData c) {
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlCliente = "INSERT INTO `cliente`(`nome`, `cpf`, `email`, `endereco`, `cep`, `telefone`, `celular`) VALUES (?,?,?,?,?,?,?)";
            System.out.println(sqlCliente);
            PreparedStatement pstmtCliente = connection.prepareStatement(sqlCliente);
            pstmtCliente.setString(1, c.getNome());
            pstmtCliente.setInt(2, c.getCpf());
            pstmtCliente.setString(3, c.getEmail());
            pstmtCliente.setString(4, c.getEndereco());
            pstmtCliente.setInt(5, c.getCep());
            pstmtCliente.setInt(6, c.getTelefone());
            pstmtCliente.setInt(7, c.getCelular());
            pstmtCliente.executeUpdate();
            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }

    }

    public void alterarCliente(ClienteData c) {
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlCliente = "UPDATE `cliente` SET `nome`=?, `cpf`=?, `email`=?, `endereco`=?, `cep`=?, `telefone`=?, `celular`=?) WHERE `id`=?";
            PreparedStatement pstmtCliente = connection.prepareStatement(sqlCliente);
            pstmtCliente.setString(1, c.getNome());
            pstmtCliente.setInt(2, c.getCpf());
            pstmtCliente.setString(3, c.getEmail());
            pstmtCliente.setString(4, c.getEndereco());
            pstmtCliente.setInt(5, c.getCep());
            pstmtCliente.setInt(6, c.getTelefone());
            pstmtCliente.setInt(7, c.getCelular());
            pstmtCliente.setInt(8, c.getId());
            pstmtCliente.executeUpdate();
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }
    }

}
