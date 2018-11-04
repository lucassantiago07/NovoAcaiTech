package dao;

import connection.ConnectionFactory;
import data.ClienteData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

    public ArrayList<ClienteData> getClientes() {
        ArrayList<ClienteData> listaCliente = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `cliente` order by id desc");

            while (rs.next()) {
                ClienteData c = new ClienteData();
                c.setId(rs.getInt("ID"));
                c.setNome(rs.getString("NOME"));
                c.setCelular(Integer.parseInt(rs.getString("CELULAR")));
                c.setCep(Integer.parseInt(rs.getString("CEP")));
                c.setCpf(Integer.parseInt(rs.getString("CPF")));
                c.setEmail(rs.getString("EMAIL"));
                c.setEndereco(rs.getString("ENDERECO"));
                c.setTelefone(Integer.parseInt(rs.getString("TELEFONE")));
                listaCliente.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados " + e);
        }

        return listaCliente;
    }

    public ArrayList<ClienteData> getClienteByNome(String nome) {
        ArrayList<ClienteData> listaCliente = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `cliente` WHERE NOME LIKE '%" + nome + "%'order by id desc");

            while (rs.next()) {
                ClienteData c = new ClienteData();
                c.setId(rs.getInt("ID"));
                c.setNome(rs.getString("NOME"));
                c.setCelular(Integer.parseInt(rs.getString("CELULAR")));
                c.setCep(Integer.parseInt(rs.getString("CEP")));
                c.setCpf(Integer.parseInt(rs.getString("CPF")));
                c.setEmail(rs.getString("EMAIL"));
                c.setEndereco(rs.getString("ENDERECO"));
                c.setTelefone(Integer.parseInt(rs.getString("TELEFONE")));
                listaCliente.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados " + e);
        }

        return listaCliente;
    }

    public ClienteData getClienteById(Integer id) {
        ClienteData c = new ClienteData();
        try {

            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `cliente` WHERE ID = " + id + "");

            while (rs.next()) {

                c.setId(rs.getInt("ID"));

                c.setNome(rs.getString("NOME"));
                c.setCelular(Integer.parseInt(rs.getString("CELULAR")));
                c.setCep(Integer.parseInt(rs.getString("CEP")));
                c.setCpf(Integer.parseInt(rs.getString("CPF")));
                c.setEmail(rs.getString("EMAIL"));
                c.setEndereco(rs.getString("ENDERECO"));
                c.setTelefone(Integer.parseInt(rs.getString("TELEFONE")));

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados " + e);
        }

        return c;
    }

    public void excluirCliente(int id) {
        try {

            Connection connection = new ConnectionFactory().getConnection();
            String sqlCliente = "DELETE FROM CLIENTE WHERE ID = " + id;
            PreparedStatement pstmtCliente = connection.prepareStatement(sqlCliente);
            pstmtCliente.executeUpdate();
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados" + ex);
        }

    }

}
