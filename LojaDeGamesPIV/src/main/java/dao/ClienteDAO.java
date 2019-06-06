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

     public boolean cadastraCliente(ClienteData c) {
        boolean deuCerto = false;
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlCliente = "INSERT INTO `cliente`(`nome`, `cpf`, `email`, `endereco`, `cep`,`numeroend`, `complemento`,`cidade`, `estado`, `telefone`, `celular`,`senha` ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmtCliente = connection.prepareStatement(sqlCliente);
            pstmtCliente.setString(1, c.getNome());
            pstmtCliente.setString(2, c.getCpf());
            pstmtCliente.setString(3, c.getEmail());
            pstmtCliente.setString(4, c.getEndereco());
            pstmtCliente.setString(5, c.getCep());
            pstmtCliente.setString(6, c.getNumerodoendereco());
            pstmtCliente.setString(7, c.getComplemento());
            pstmtCliente.setString(8, c.getCidade());
            pstmtCliente.setString(9, c.getEstado());
            pstmtCliente.setString(10, c.getTelefone());
            pstmtCliente.setString(11, c.getCelular());
            pstmtCliente.setString(12, c.getSenha());
            int deuCertoSQL = pstmtCliente.executeUpdate();

            if (deuCertoSQL == 1) {
                deuCerto = true;
            } else {
                deuCerto = false;
            }

            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados cadastraCliente: " + ex);
            deuCerto = false;
        }
        return deuCerto;
    }

    public boolean alterarCliente(ClienteData c) {
        boolean deuCerto = false;
        try {
            Connection connection = new ConnectionFactory().getConnection();

            String sqlCliente = "UPDATE `cliente` SET `nome`=?, `cpf`=?, `email`=?, `endereco`=?, `cep`=?, `telefone`=?, `celular`=?, `senha`=? WHERE `id`=?";
            PreparedStatement pstmtCliente = connection.prepareStatement(sqlCliente);
            pstmtCliente.setString(1, c.getNome());
            pstmtCliente.setString(2, c.getCpf());
            pstmtCliente.setString(3, c.getEmail());
            pstmtCliente.setString(4, c.getEndereco());
            pstmtCliente.setString(5, c.getCep());
            pstmtCliente.setString(6, c.getTelefone());
            pstmtCliente.setString(7, c.getCelular());
            pstmtCliente.setString(8, c.getSenha());
            pstmtCliente.setInt(9, c.getId());
            int deuCertoSQL = pstmtCliente.executeUpdate();

            if (deuCertoSQL == 1) {
                deuCerto = true;
            } else {
                deuCerto = false;
            }

            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados alterarCliente:" + ex);
            deuCerto = false;
        }
        return deuCerto;
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
                c.setCelular(rs.getString("CELULAR"));
                c.setCep(rs.getString("CEP"));
                c.setCpf((rs.getString("CPF")));
                c.setEmail(rs.getString("EMAIL"));
                c.setEndereco(rs.getString("ENDERECO"));
                c.setTelefone(rs.getString("TELEFONE"));
                listaCliente.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getClientes:" + e);
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
                c.setCelular(rs.getString("CELULAR"));
                c.setCep(rs.getString("CEP"));
                c.setCpf(rs.getString("CPF"));
                c.setEmail(rs.getString("EMAIL"));
                c.setEndereco(rs.getString("ENDERECO"));
                c.setTelefone(rs.getString("TELEFONE"));
                listaCliente.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getClienteByNome: " + e);
        }

        return listaCliente;
    }

    public ClienteData getClienteByCpf(String cpf) {
        ClienteData c = new ClienteData();
        try {

            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `cliente` WHERE CPF = '" + cpf + "'");

            while (rs.next()) {
                c.setId(rs.getInt("ID"));
                c.setNome(rs.getString("NOME"));
                c.setCelular(rs.getString("CELULAR"));
                c.setCep(rs.getString("CEP"));
                c.setCpf(rs.getString("CPF"));
                c.setEmail(rs.getString("EMAIL"));
                c.setEndereco(rs.getString("ENDERECO"));
                c.setTelefone(rs.getString("TELEFONE"));

            }

            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getClienteByCpf:" + e);
        }
        System.out.println(c.getCpf());
        return c;
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
                c.setCelular(rs.getString("CELULAR"));
                c.setCep(rs.getString("CEP"));
                c.setCpf(rs.getString("CPF"));
                c.setEmail(rs.getString("EMAIL"));
                c.setEndereco(rs.getString("ENDERECO"));
                c.setTelefone(rs.getString("TELEFONE"));
                c.setSenha(rs.getString("SENHA"));

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getClienteById:" + e);
        }

        return c;
    }

    public boolean excluirCliente(int id) {
        boolean deuCerto = false;
        try {

            Connection connection = new ConnectionFactory().getConnection();
            String sqlCliente = "DELETE FROM CLIENTE WHERE ID = " + id;
            PreparedStatement pstmtCliente = connection.prepareStatement(sqlCliente);
            int deuCertoSQL = pstmtCliente.executeUpdate();

            if (deuCertoSQL == 1) {
                deuCerto = true;
            } else {
                deuCerto = false;
            }
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro no banco de dados excluirCliente: " + ex);
        }
        return deuCerto;

    }
    
    
    public ClienteData verificaLogin(String email, String senha) {
        ClienteData novocliente  = new ClienteData();
        /// F novocliente 
        try {

            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            String sql = "SELECT * FROM `cliente` WHERE email = '" + email + "' AND SENHA = '" + senha + "'";
            ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                novocliente.setId(rs.getInt("ID"));
                novocliente.setNome(rs.getString("NOME"));
                novocliente.setCpf(rs.getString("CPF"));
                novocliente.setEmail(rs.getString("EMAIL"));
                novocliente.setEndereco(rs.getString("ENDERECO"));
                novocliente.setCep(rs.getString("CEP"));
                novocliente.setNumerodoendereco(rs.getString("NUMEROEND"));
                novocliente.setComplemento(rs.getString("COMPLEMENTO"));
                novocliente.setCidade(rs.getString("CIDADE"));
                novocliente.setEstado(rs.getString("ESTADO"));
                novocliente.setTelefone(rs.getString("TELEFONE"));
                novocliente.setCelular(rs.getString("CELULAR"));
                novocliente.setSenha(rs.getString("SENHA"));
                
                
                
              
            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados verificaLogin:" + e);
        }

        return novocliente;
    }
    
    
    
    
    
    
    

}
