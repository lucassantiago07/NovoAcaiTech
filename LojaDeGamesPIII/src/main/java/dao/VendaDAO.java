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

        if (true) {

            try {

                Connection connection = new ConnectionFactory().getConnection();

                String sqlVenda = "INSERT INTO `venda`(`bandeira`, `datadavenda`, `desconto`, `filial`, `idcliente`, `idvendedor`, `numerocomprovante`, `subtotal`, `valortotal`, `valoremespecie`, `vezescartao`) VALUES  (?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pstmtVenda = connection.prepareStatement(sqlVenda);
                pstmtVenda.setString(1, c.getBandeira());
                pstmtVenda.setTimestamp(2, c.getDataDaVenda());
                pstmtVenda.setString(3, c.getDesconto());
                pstmtVenda.setString(4, c.getFilial());
                pstmtVenda.setString(5, c.getIdCliente());
                pstmtVenda.setString(6, c.getIdVendedor());
                pstmtVenda.setString(7, c.getNumeroComprovante());
                pstmtVenda.setString(8, c.getSubTotal());
                pstmtVenda.setString(9, c.getValorTotal());
                pstmtVenda.setString(10, c.getValorEmEspecie());
                pstmtVenda.setString(11, c.getVezesCartao());
                int IdVenda = pstmtVenda.executeUpdate(sqlVenda, PreparedStatement.RETURN_GENERATED_KEYS);

                System.out.println("ID VENDA!!!!!!!!:" + IdVenda);

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
