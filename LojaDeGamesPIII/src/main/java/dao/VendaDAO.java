package dao;

import connection.ConnectionFactory;
import data.ProdutoData;
import data.ProdutosDaVendaData;
import data.VendaData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class VendaDAO {

    public boolean cadastraVenda(VendaData c) {
        boolean deuCerto = false;

        System.out.println(c.getDataDaVenda());
        System.out.println(c.getDesconto());
        //System.out.println(c.getId());
        System.out.println(c.getIdCliente());
        System.out.println(c.getIdVendedor());
        //System.out.println(c.getListaDeProtudosDaVenda());
        System.out.println(c.getSubTotal());
        System.out.println(c.getValorTotal());

        if (false) {
            System.out.println("entrou");
            try {

                Connection connection = new ConnectionFactory().getConnection();

                String sqlVenda = "INSERT INTO `venda`(`id_cliente`, `data_da_venda`, `valortotal`) VALUES (?,?,?,?)";
                PreparedStatement pstmtVenda = connection.prepareStatement(sqlVenda);
                pstmtVenda.setString(1, c.getIdCliente());
                pstmtVenda.setTimestamp(2, c.getDataDaVenda());
                pstmtVenda.setString(3, c.getValorTotal());
                int IdVenda = pstmtVenda.executeUpdate(sqlVenda, pstmtVenda.RETURN_GENERATED_KEYS);

                System.out.println("ID VENDA:" + IdVenda);

                for (ProdutoData p : c.getListaDeProtudosDaVenda()) {

                    String sqlVendaProdutos = "INSERT INTO `produtos_da_venda`(`nome_produto`,`quantidade`, `preco_unitario`,`id_venda`) VALUES (?,?,?,?)";
                    PreparedStatement pstmtVendaProdutos = connection.prepareStatement(sqlVendaProdutos);
                    pstmtVendaProdutos.setString(1, p.getNome());
                    pstmtVendaProdutos.setInt(2, p.getQtdCarrinho());
                    pstmtVendaProdutos.setInt(3, p.getPrecoDeVenda());
                    pstmtVendaProdutos.setInt(4, IdVenda);
                    pstmtVendaProdutos.executeUpdate();

                }

                connection.close();

            } catch (SQLException | ClassNotFoundException ex) {
                System.out.println("Erro no banco de dados cadastraVenda: " + ex);
                deuCerto = false;
            }
            return deuCerto;
        }
        return false;
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

            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Venda` WHERE ID = " + id + "");

            while (rs.next()) {

                c.setId(rs.getString("ID"));

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendaById:" + e);
        }

        return c;
    }

}
