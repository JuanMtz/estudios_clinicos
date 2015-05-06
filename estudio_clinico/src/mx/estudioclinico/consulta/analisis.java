/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.estudioclinico.consulta;

/**
 *
 * @author Jan Jan
 */
public class analisis {

    public String Nombre;
    public String Apellido;
    public String Fecha_I;

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getFecha_I() {
        return Fecha_I;
    }

    public void setFecha_I(String Fecha_I) {
        this.Fecha_I = Fecha_I;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

     @Override
    public String toString() {
        return "El paciente{" + "con un nivel de glucosa fuera del rango es=" + Nombre + "," + Apellido + "," +"su análisis fue realizado el"+ Fecha_I+ '}';
    }

}
