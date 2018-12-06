package dao;

import connection.ConnectionFactory;
import data.ClienteData;
import data.FuncionarioData;
import data.ProdutoData;
import data.ProdutosDaVendaData;
import data.VendaData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

public class VendaDAO {

    public boolean cadastraVenda(VendaData c) throws SQLException, ClassNotFoundException {

        boolean deuCerto = false;

        Connection connection = new ConnectionFactory().getConnection();

        String sqlVenda = "INSERT INTO `venda`(`bandeira`, `datadavenda`, `desconto`, `filial`, `idcliente`, `idvendedor`, `numerocomprovante`, `subtotal`, `valortotal`, `valoremespecie`, `vezescartao`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

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
        int deuCertoSQL = pstmtVenda.executeUpdate();

        if (deuCertoSQL == 1) {
            deuCerto = true;
        } else {
            deuCerto = false;
        }

        int IdVenda = 0;

        try (ResultSet rs = pstmtVenda.getGeneratedKeys()) {
            if (rs.next()) {
                //System.out.println(rs.getInt(1));
                IdVenda = rs.getInt(1);
            }
            rs.close();

        }

        try {

            //System.out.println("ID VENDA!!!!!!!!:" + IdVenda);
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

                c.setDataDaVenda(Timestamp.valueOf(rs.getString("DATADAVENDA")));
                c.setDesconto(rs.getString("DESCONTO"));
                c.setFilial(rs.getString("FILIAL"));

                ClienteDAO daoCliente = new ClienteDAO();
                ClienteData cliente = daoCliente.getClienteById(Integer.parseInt(rs.getString("IDCLIENTE")));
                c.setIdCliente(cliente.getNome());

                FuncionarioDAO daoFuncionario = new FuncionarioDAO();
                FuncionarioData funcionario = daoFuncionario.getFuncionarioById(Integer.parseInt(rs.getString("IDVENDEDOR")));
                c.setIdVendedor(funcionario.getNome());

                c.setNumeroComprovante(rs.getString("NUMEROCOMPROVANTE"));
                c.setSubTotal(rs.getString("SUBTOTAL"));
                c.setValorTotal(rs.getString("VALORTOTAL"));
                c.setValorEmEspecie(rs.getString("VALOREMESPECIE"));
                c.setVezesCartao(rs.getString("VEZESCARTAO"));
                listaVenda.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendas:" + e);
        }

        return listaVenda;
    }

    public ArrayList<VendaData> getVendaByData(String data) {
        ArrayList<VendaData> listaVenda = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Venda` WHERE DATADAVENDA LIKE '%" + data + "%'order by id desc");

            while (rs.next()) {
                VendaData c = new VendaData();
                c.setId(rs.getString("ID"));
                c.setBandeira(rs.getString("BANDEIRA"));
                c.setDataDaVenda(Timestamp.valueOf(rs.getString("DATADAVENDA")));
                c.setDesconto(rs.getString("DESCONTO"));
                c.setFilial(rs.getString("FILIAL"));
                c.setIdCliente(rs.getString("IDCLIENTE"));
                c.setIdVendedor(rs.getString("IDVENDEDOR"));
                c.setNumeroComprovante(rs.getString("NUMEROCOMPROVANTE"));
                c.setSubTotal(rs.getString("SUBTOTAL"));
                c.setValorTotal(rs.getString("VALORTOTAL"));
                c.setValorEmEspecie(rs.getString("VALOREMESPECIE"));
                c.setVezesCartao(rs.getString("VEZESCARTAO"));

                listaVenda.add(c);

            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendaByData: " + e);
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
                    c.setBandeira(rs.getString("BANDEIRA"));
                    c.setDataDaVenda(Timestamp.valueOf(rs.getString("DATADAVENDA")));
                    c.setDesconto(rs.getString("DESCONTO"));
                    c.setFilial(rs.getString("FILIAL"));
                    c.setIdCliente(rs.getString("IDCLIENTE"));
                    c.setIdVendedor(rs.getString("IDVENDEDOR"));
                    c.setNumeroComprovante(rs.getString("NUMEROCOMPROVANTE"));
                    c.setSubTotal(rs.getString("SUBTOTAL"));
                    c.setValorTotal(rs.getString("VALORTOTAL"));
                    c.setValorEmEspecie(rs.getString("VALOREMESPECIE"));
                    c.setVezesCartao(rs.getString("VEZESCARTAO"));

                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendaById:" + e);
        }

        return c;
    }

    public ArrayList<ProdutosDaVendaData> getProdutosVendas(int idVenda) {
        ArrayList<ProdutosDaVendaData> listaVenda = new ArrayList<>();
        try {
            Connection connection = new ConnectionFactory().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `produtos_da_venda` where id_venda = '" + idVenda + "' order by id desc");

            while (rs.next()) {
                ProdutosDaVendaData p = new ProdutosDaVendaData();
                p.setId(rs.getString("ID"));
                p.setNomeProduto(rs.getString("NOME_PRODUTO"));
                p.setPrecoUnitario(rs.getString("PRECO_UNITARIO"));
                p.setQuantidade(rs.getString("QUANTIDADE"));
                listaVenda.add(p);
            }
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro no banco de dados getVendas:" + e);
        }

        return listaVenda;
    }

}
