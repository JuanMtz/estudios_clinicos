/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package estudio_clinico.consultasql;

/**
 *
 * @author Jan Jan
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mx.estudioclinico.consulta.analisis;
import mx.estudioclinico.utilidades.Conexion;

public class analisissql {
public static List<analisis> obteneranalisis() {
        List<analisis> lstanalisis = new ArrayList<analisis>();
        String query = "select p.Nombre, p.Apellido, f.Fecha_I from paciente p inner join noestudio f on p.idPaciente=f.No_Estudio inner join on p.idPaciente=g1.Idglucosa where Cantidad>=70 and Cantidad <=120;";
        Connection cn = Conexion.getConexion();
        try {
            PreparedStatement pst = cn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {

                String Nombre = rs.getString(1);
                String Apellido = rs.getString(2);
                String Fecha_I = rs.getString(3);

                analisis a = new analisis();
                a.setNombre(Nombre);
                a.setApellido(Apellido);
                a.setFecha_I(Fecha_I);
                lstanalisis.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lstanalisis;
    }

    public static void main(String[] args) {
        List<analisis> lstanalisis = obteneranalisis();
        for (analisis analisis : lstanalisis) {
            System.out.println(analisis);
        }
    }
}
