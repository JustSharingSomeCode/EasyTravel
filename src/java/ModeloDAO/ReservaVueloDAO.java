/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;


import BaseDatos.Conexion;
import Modelo.ReservaVuelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Oscar
 */
public class ReservaVueloDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public List listar(String user)
    {
        ArrayList<ReservaVuelo> lista = new ArrayList<>();
        String sql = "SELECT r.id_reservavuelo, r.id_vuelo_fk, r.id_usuario_fk, r.n_pasajeros, r.total, c1.nombre as 'origen', c2.id_ciudad, c2.nombre as 'destino', v.hora_salida, v.hora_llegada\n" +
        "FROM RESERVA_VUELOS r, VUELOS v, CIUDADES c1, CIUDADES c2 \n" +
        "WHERE v.id_vuelo = r.id_vuelo_fk and c1.id_ciudad = v.ciudad_origen and c2.id_ciudad = v.ciudad_destino AND id_usuario_fk = ?;";
        try
        {
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while(rs.next())
            {
                ReservaVuelo pt = new ReservaVuelo();
                pt.setId(rs.getInt("id_reservavuelo"));                
                pt.setIdVuelo(rs.getInt("id_vuelo_fk"));
                pt.setIdUsuario(rs.getInt("id_usuario_fk"));
                pt.setnPasajeros(rs.getInt("n_pasajeros"));
                pt.setTotal(rs.getDouble("total"));
                pt.setOrigen(rs.getString("origen"));
                pt.setDestino(rs.getString("destino"));
                pt.setIdDestino(rs.getInt("id_ciudad"));
                pt.setHora_salida(rs.getString("hora_salida"));
                pt.setHora_llegada(rs.getString("hora_llegada"));
                lista.add(pt);
            }
            return lista;
        }
        catch(Exception e)
        {
            return null;
        }
    }
    
    public boolean eliminar(String id)
    {
        String sql = "DELETE FROM RESERVA_VUELOS WHERE id_reservavuelo = ?";
        
        try
        {
            con = cn.getConnection();
            ps=con.prepareStatement(sql);           
            ps.setString(1, id);            
            ps.executeUpdate();
            
            return true;
        }
        catch(Exception e)
        {
            return false;
        }
    }
}
