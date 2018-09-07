package Connection;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    
    public Connection obterConexao() throws ClassNotFoundException, SQLException {
        
        Connection conn = null;

        // Passo 1 : Registrar driver JBDC
        Class.forName("com.mysql.jdbc.Driver");

        //Passo 2 : Obter a conexão
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/produtobd", "root", "");
        return conn;

    }
    
   
   
}
