/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import BaseDatos.Conexion;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Oscar
 */
public class UsuarioDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String id;
    //Usuario user = new Usuario();

    public String getId() {
        return id;
    }
    
    public boolean login(String user, String contra)
    {
        String sql="SELECT id_usuario, COUNT(*) FROM USUARIOS WHERE usuario = ? and contrasena = ?";
        try
        {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, contra);
            rs = ps.executeQuery();                      
                        
            rs.next();
            String c = rs.getString(2);
            if(c.equals("1"))
            {
                id = rs.getString(1);
                return true;
            }
            else
            {
                return false;
            }
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());    
            //throw new UnsupportedOperationException(e.getMessage());
            return false;
        }
    }
    
    public boolean loginAdmin(String user, String contra)
    {
        String sql="SELECT id_usuario, COUNT(*) FROM ADMINS WHERE usuario = ? and contrasena = ?";
        try
        {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, contra);
            rs = ps.executeQuery();                      
                        
            rs.next();
            String c = rs.getString(2);
            if(c.equals("1"))
            {
                id = rs.getString(1);
                return true;
            }
            else
            {
                return false;
            }
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());    
            //throw new UnsupportedOperationException(e.getMessage());
            return false;
        }
    }
    
    public boolean add(Usuario user){
        //nombre, apellido, email, usuario, contrasena
        String sql="INSERT INTO USUARIOS VALUES (DEFAULT, '"+ user.getNombre() +"','"+ user.getApellido() +"','"+ user.getEmail() +"','"+ user.getUsuario() +"','"+ user.getContrasena()+"')";
        try{
            con= cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
            return true;
        }
        catch (Exception e){
            System.out.println("Error: " + e.getMessage());    
            //throw new UnsupportedOperationException(e.getMessage());
            return false;
        }        
    }
}
