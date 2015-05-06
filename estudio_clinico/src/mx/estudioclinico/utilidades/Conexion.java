/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.estudioclinico.utilidades;

/**
 *
 * @author Jan Jan
 */

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

       private static final String URL = "jdbc:mysql://localhost/analisis_clinico";
    private static final String USER = "root";
    private static final String PASS = "root";

    public static Connection getConexion() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void main(String[] args) {
    }
}
