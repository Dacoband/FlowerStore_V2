/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author hendrix
 */
public class DBConnection {

    public static Connection makeConnection() throws Exception {
        Connection cn = null;

        String IP = "localhost";
        String instanceName = "";

        String port = "1433";
        String uid = "sa";
        String pwd = "12345";
        String db = "flower_shop";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;
    }
}
