/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import data.VendaData;
import connection.ConnectionFactory;
/**
 *
 * @author ADRIANA
 */
public class RelatorioDAO {
    public static void buscarRelatorio(VendaData vd) throws SQLException, ClassNotFoundException{
        Connection connection = new ConnectionFactory().getConnection();
        String sqlRelatorio = "SELECT * FROM venda WHERE (datavenda=?)";
        PreparedStatement prep = connection.prepareStatement(sqlRelatorio);
        prep.setTimestamp(1, vd.getDataDaVenda());
        prep.executeQuery();
    }
}
