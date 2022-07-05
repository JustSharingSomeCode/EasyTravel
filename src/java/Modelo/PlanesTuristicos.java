/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Oscar
 */
public class PlanesTuristicos {
    
    int id, ciudad;
    String nombre, descripcion, imagenURL;
    double precioAdulto, precioNino;

    public void setId(int id) {
        this.id = id;
    }    
    
    public int getId() {
        return id;
    }    

    public int getCiudad() {
        return ciudad;
    }

    public void setCiudad(int ciudad) {
        this.ciudad = ciudad;
    }       

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }    

    public String getImagenURL() {
        return imagenURL;
    }

    public void setImagenURL(String imagenURL) {
        this.imagenURL = imagenURL;
    }
    
    public double getPrecioAdulto() {
        return precioAdulto;
    }

    public void setPrecioAdulto(double precioAdulto) {
        this.precioAdulto = precioAdulto;
    }

    public double getPrecioNino() {
        return precioNino;
    }

    public void setPrecioNino(double precioNino) {
        this.precioNino = precioNino;
    }
    
    
}
