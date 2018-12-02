package dao;

import connection.ConnectionFactory;
import data.ProdutoData;
import data.VendaData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class VendaDAO {

    public boolean cadastraVenda(VendaData c) throws SQLException, ClassNotFoundException {

        boolean deuCerto = false;

        Connection connection = new ConnectionFactory().getConnection();

        String[] returnId = {"BATCHID"};

        String sqlVenda = "INSERT INTO\n"
                + "  `venda` (\n"
                + "    `bandeira`,\n"
                + "    `datadavenda`,\n"
                + "    `desconto`,\n"
                + "    `filial`,\n"
                + "    `idcliente`,\n"
                + "    `idvendedor`,\n"
                + "    `numerocomprovante`,\n"
                + "    `subtotal`,\n"
                + "    `valortotal`,\n"
                + "    `valoremespecie`,\n"
                + "    `vezescartao`\n"
                + "  )\n"
                + "VALUES\n"
                + "  ('" + c.getBandeira() + "',"
                + "'" + c.getDataDaVenda() + "', "
                + "'" + c.getDesconto() + "', "
                + "'" + c.getFilial() + "', "
                + "'" + c.getIdCliente() + "', "
                + "'" + c.getIdVendedor() + "', "
                + "'" + c.getNumeroComprovante() + "', "
                + "'" + c.getSubTotal() + "', "
                + "'" + c.getValorTotal() + "', "
                + "'" + c.getValorEmEspecie() + "', "
                + "'" + c.getVezesCartao() + "')";

        PreparedStatement statement = connection.prepareStatement(sqlVenda, returnId);

        int affectedRows = statement.executeUpdate();

        int IdVenda = 0;

        if (affectedRows == 0) {
            throw new SQLException("Fail");
        }

        try (ResultSet rs = statement.getGeneratedKeys()) {
            if (rs.next()) {
                System.out.println(rs.getInt(1));
                IdVenda = rs.getInt(1);
            }
            rs.close();

        }

        try {

            System.out.println("ID VENDA!!!!!!!!:" + IdVenda);

            for (ProdutoData p : c.getListaDeProtudosDaVenda()) {

                String sqlVendaProdutos = "INSERT INTO `produtos_da_venda`(`nome_produto`,`quantidade`, `preco_unitario`,`id_venda`) VALUES (?,?,?,?)";
                PreparedStatement pstmtVendaProdutos = connection.prepareStatement(sqlVendaProdutos);
                pstmtVendaProdutos.setString(1, p.getNome());
                pstmtVendaProdutos.setInt(2, p.getQtdCarrinho());
                pstmtVendaProdutos.setInt(3, p.getPrecoDeVenda());
                pstmtVendaProdutos.setInt(4, IdVenda);
                pstmtVendaProdutos.executeUpdate();
                deuCerto = true;

            }

            connection.close();

        } catch (SQLException ex) {
            System.out.println("Erro no banco de dados cadastraVenda: " + ex);
            deuCerto = false;
        }
        return deuCerto;
    }

    public ArrayList<VendaData> getVendas() {
        ArrayList<VendaData> listaVenda = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Venda` order by id desc");

            while (rs.next()) {
                VendaData c = new VendaData();
                c.setId(rs.getString("ID"));
                listaVenda.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendas:" + e);
        }

        return listaVenda;
    }

    public ArrayList<VendaData> getVendaByData(String nome) {
        ArrayList<VendaData> listaVenda = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Venda` WHERE NOME LIKE '%" + nome + "%'order by id desc");

            while (rs.next()) {
                VendaData c = new VendaData();
                c.setId(rs.getString("ID"));

                listaVenda.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendaByNome: " + e);
        }

        return listaVenda;
    }

    public VendaData getVendaById(Integer id) {
        VendaData c = new VendaData();
        try {

            try (Connection connection = new ConnectionFactory().getConnection()) {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM `Venda` WHERE ID = " + id + "");

                while (rs.next()) {

                    c.setId(rs.getString("ID"));

                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendaById:" + e);
        }

        return c;
    }

}
