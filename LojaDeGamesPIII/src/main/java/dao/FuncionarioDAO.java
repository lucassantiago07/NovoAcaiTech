package dao;

import connection.ConnectionFactory;
import data.FuncionarioData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class FuncionarioDAO {

    public boolean cadastraFuncionario(FuncionarioData f) {
        boolean deuCerto = false;
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlFuncionario = "INSERT INTO `funcionario`(`nome`, `cpf`, `filial`, `cargo`, `endereco`, `cep`, `telefone`, `celular`,`usuario`,`senha`) VALUES (?,?,?,?,?,?,?,?,?,?)";
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
            pstmtFuncionario.setString(9, f.getCpf());
            pstmtFuncionario.setString(10, f.getCpf());
            int deuCertoSQL = pstmtFuncionario.executeUpdate();

            if (deuCertoSQL == 1) {
                deuCerto = true;
            } else {
                deuCerto = false;
            }
            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados cadastraFuncionario: " + ex);
        }
        return deuCerto;
    }

    public FuncionarioData verificaLogin(String nome, String senha) {
        FuncionarioData f = new FuncionarioData();
        try {

            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            String sql = "SELECT * FROM `Funcionario` WHERE USUARIO = '" + nome + "' AND SENHA = '" + senha + "'";
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println(sql);

            while (rs.next()) {
                f.setId(rs.getInt("ID"));
                f.setNome(rs.getString("NOME"));
                f.setCelular(rs.getString("CELULAR"));
                f.setCep(rs.getString("CEP"));
                f.setCpf(rs.getString("CPF"));
                f.setCargo(rs.getString("CARGO"));
                f.setFilial(Integer.parseInt(rs.getString("FILIAL")));
                f.setEndereco(rs.getString("ENDERECO"));
                f.setTelefone(rs.getString("TELEFONE"));
            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados verificaLogin:" + e);
        }

        return f;
    }

    public boolean alterarFuncionario(FuncionarioData f) {
        boolean deuCerto = false;
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
            int deuCertoSQL = pstmtFuncionario.executeUpdate();
            if (deuCertoSQL == 1) {
                deuCerto = true;
            } else {
                deuCerto = false;
            }
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados alterarFuncionario: " + ex);
        }
        return deuCerto;
    }

    public ArrayList<FuncionarioData> getFuncionarios() {
        ArrayList<FuncionarioData> listaFuncionario = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Funcionario` order by id desc");

            while (rs.next()) {
                FuncionarioData f = new FuncionarioData();
                f.setId(rs.getInt("ID"));
                f.setNome(rs.getString("NOME"));
                f.setCelular(rs.getString("CELULAR"));
                f.setCep(rs.getString("CEP"));
                f.setCpf(rs.getString("CPF"));
                f.setCargo(rs.getString("CARGO"));
                f.setFilial(Integer.parseInt(rs.getString("FILIAL")));
                f.setEndereco(rs.getString("ENDERECO"));
                f.setTelefone(rs.getString("TELEFONE"));
                listaFuncionario.add(f);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getFuncionarios:" + e);
        }

        return listaFuncionario;
    }

    public ArrayList<FuncionarioData> getFuncionarioByNome(String nome) {
        ArrayList<FuncionarioData> listaFuncionario = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Funcionario` WHERE NOME LIKE '%" + nome + "%'order by id desc");

            while (rs.next()) {
                FuncionarioData f = new FuncionarioData();
                f.setId(rs.getInt("ID"));
                f.setNome(rs.getString("NOME"));
                f.setCelular(rs.getString("CELULAR"));
                f.setCep(rs.getString("CEP"));
                f.setCpf(rs.getString("CPF"));
                f.setCargo(rs.getString("CARGO"));
                f.setFilial(Integer.parseInt(rs.getString("FILIAL")));
                f.setEndereco(rs.getString("ENDERECO"));
                f.setTelefone(rs.getString("TELEFONE"));
                listaFuncionario.add(f);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getFuncionarioByNome: " + e);
        }

        return listaFuncionario;
    }

    public FuncionarioData getFuncionarioById(Integer id) {
        FuncionarioData f = new FuncionarioData();
        try {

            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Funcionario` WHERE ID = " + id + "");

            while (rs.next()) {

                f.setId(rs.getInt("ID"));

                f.setNome(rs.getString("NOME"));
                f.setCelular(rs.getString("CELULAR"));
                f.setCep(rs.getString("CEP"));
                f.setCpf(rs.getString("CPF"));
                f.setCargo(rs.getString("CARGO"));
                f.setFilial(Integer.parseInt(rs.getString("FILIAL")));
                f.setEndereco(rs.getString("ENDERECO"));
                f.setTelefone(rs.getString("TELEFONE"));

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getFuncionarioById:" + e);
        }

        return f;
    }

    public boolean excluirFuncionario(int id) {
        boolean deuCerto = false;
        try {

            Connection connection = new ConnectionFactory().getConnection();
            String sqlFuncionario = "DELETE FROM Funcionario WHERE ID = " + id;
            PreparedStatement pstmtFuncionario = connection.prepareStatement(sqlFuncionario);
            int deuCertoSQL = pstmtFuncionario.executeUpdate();

            if (deuCertoSQL == 1) {
                deuCerto = true;
            } else {
                deuCerto = false;
            }
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados excluirFuncionario: " + ex);
        }
        return deuCerto;

    }

}
