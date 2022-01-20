package ConnectJDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectJDBC {
    private String hostname = "localhost : 8085";
    private String dbname = "sakila";
    private String username = "root";
    private String password = "123";

    private String connectURL = "jdbc:mysql://" + hostname + "/" + dbname;

    public Connection connect(){
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(connectURL,username,password);
            System.out.println("Connect thành công");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }

}
