package dao;

import connection.ConnectionFactory;
import data.FuncionarioData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FuncionarioDAO {

    public void cadastraFuncionario(FuncionarioData f) {
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlFuncionario = "INSERT INTO `funcionario`(`nome`, `cpf`, `filial`, `cargo`, `endereco`, `cep`, `telefone`, `celular`) VALUES (?,?,?,?,?,?,?,?)";
            System.out.println(sqlFuncionario);
            PreparedStatement pstmtFuncionario = connection.prepareStatement(sqlFuncionario);
            pstmtFuncionario.setString(1, f.getNome());
            pstmtFuncionario.setString(2, f.getCpf());
            pstmtFuncionario.setInt(3, f.getFilial());
            pstmtFuncionario.setString(4, f.getCargo());
            pstmtFuncionario.setString(5, f.getEndereco());
            pstmtFuncionario.setString(6, f.getCep());
            pstmtFuncionario.setString(7, f.getTelefone());
            pstmtFuncionario.setString(8, f.getCelular());
            pstmtFuncionario.executeUpdate();
            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }

    }

    public void alterarFuncionario(FuncionarioData f) {
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlFuncionario = "UPDATE `funcionario` SET `nome`=?,`cpf`=?,`filial`=?,`cargo`=?,`endereco`=?,`cep`=?,`telefone`=?,`celular`=? WHERE `id`=?";
            PreparedStatement pstmtFuncionario = connection.prepareStatement(sqlFuncionario);
            pstmtFuncionario.setString(1, f.getNome());
            pstmtFuncionario.setString(2, f.getCpf());
            pstmtFuncionario.setInt(3, f.getFilial());
            pstmtFuncionario.setString(4, f.getCargo());
            pstmtFuncionario.setString(5, f.getEndereco());
            pstmtFuncionario.setString(6, f.getCep());
            pstmtFuncionario.setString(7, f.getTelefone());
            pstmtFuncionario.setString(8, f.getCelular());
            pstmtFuncionario.setInt(9, f.getId());
            pstmtFuncionario.executeUpdate();
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }
    }

}
