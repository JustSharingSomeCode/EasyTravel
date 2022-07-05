/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import BaseDatos.Conexion;
import Modelo.Ciudad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Oscar
 */
public class CiudadDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public List listar()
    {
        ArrayList<Ciudad> lista = new ArrayList<>();
        String sql = "SELECT*FROM CIUDADES";
        try
        {
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next())
            {
                Ciudad cd = new Ciudad();
                cd.setId(rs.getInt("id_ciudad"));
                cd.setCiudad(rs.getString("nombre"));
                cd.setPais(rs.getString("pais"));
                cd.setDescripcion(rs.getString("descripcion"));
                cd.setImagenURL(rs.getString("imagenURL"));
                lista.add(cd);
            }
            return lista;
        }
        catch(Exception e)
        {
            return null;
        }
    }
    
    public List listar(String id)
    {
        ArrayList<Ciudad> lista = new ArrayList<>();
        String sql = "SELECT*FROM CIUDADES WHERE id_ciudad = ?";
        try
        {
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next())
            {
                Ciudad cd = new Ciudad();
                cd.setId(rs.getInt("id_ciudad"));
                cd.setCiudad(rs.getString("nombre"));
                cd.setPais(rs.getString("pais"));
                cd.setDescripcion(rs.getString("descripcion"));
                cd.setImagenURL(rs.getString("imagenURL"));
                lista.add(cd);
            }
            return lista;
        }
        catch(Exception e)
        {
            return null;
        }
    }
    
    public boolean agregar(String nombre, String descripcion, String pais, String imagenURL)
    {
        String sql = "INSERT INTO CIUDADES VALUES (DEFAULT,?,?,?,?)";
        try
        {
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, pais);
            ps.setString(3, imagenURL);
            ps.setString(4, descripcion);
            ps.executeUpdate();
            
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }
    
    public boolean eliminar(String id)
    {
        String sql = "DELETE FROM CIUDADES WHERE id_ciudad = ?";
        try
        {
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, id);            
            ps.executeUpdate();
            
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }
    
    public boolean modificar(String id, String nombre, String descripcion, String pais, String imagenURL)
    {
        String sql = "UPDATE CIUDADES SET nombre = ?, pais = ?, imagenUrl = ?, descripcion = ? WHERE id_ciudad = ?";
        try
        {
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, nombre);            
            ps.setString(2, pais);            
            ps.setString(3, imagenURL);            
            ps.setString(4, descripcion);            
            ps.setString(5, id);            
            ps.executeUpdate();
            
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }
}
