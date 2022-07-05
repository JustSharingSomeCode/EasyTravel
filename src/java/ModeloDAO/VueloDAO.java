/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import BaseDatos.Conexion;
import Modelo.Vuelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Oscar
 */
public class VueloDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List listar() {
        ArrayList<Vuelo> lista = new ArrayList<>();
        String sql = "SELECT v.id_vuelo, v.ciudad_origen, v.ciudad_destino, v.precio, v.fecha_salida, v.hora_salida, v.hora_llegada, c1.nombre as 'origen', c2.nombre as 'destino', c2.imagenURL FROM VUELOS v, CIUDADES c1, CIUDADES c2 where v.ciudad_origen = c1.id_ciudad AND v.ciudad_destino = c2.id_ciudad;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vuelo cd = new Vuelo();
                cd.setId(rs.getInt("id_vuelo"));
                cd.setId_origen(rs.getInt("ciudad_origen"));
                cd.setId_destino(rs.getInt("ciudad_destino"));
                cd.setPrecio(rs.getDouble("precio"));
                cd.setCiudad_origen(rs.getString("origen"));
                cd.setCiudad_destino(rs.getString("destino"));
                cd.setImagenURL(rs.getString("imagenURL"));
                cd.setFecha_salida(rs.getString("fecha_salida"));
                cd.setHora_salida(rs.getString("hora_salida"));
                cd.setHora_llegada(rs.getString("hora_llegada"));
                lista.add(cd);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public List listar(String id) {
        ArrayList<Vuelo> lista = new ArrayList<>();
        String sql = "SELECT v.id_vuelo, v.ciudad_origen, v.ciudad_destino, v.precio, v.fecha_salida, v.hora_salida, v.hora_llegada, c1.nombre as 'origen', c2.nombre as 'destino', c2.imagenURL FROM VUELOS v, CIUDADES c1, CIUDADES c2 where v.ciudad_origen = c1.id_ciudad AND v.ciudad_destino = c2.id_ciudad AND v.id_vuelo = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vuelo cd = new Vuelo();
                cd.setId(rs.getInt("id_vuelo"));
                cd.setId_origen(rs.getInt("ciudad_origen"));
                cd.setId_destino(rs.getInt("ciudad_destino"));
                cd.setPrecio(rs.getDouble("precio"));
                cd.setCiudad_origen(rs.getString("origen"));
                cd.setCiudad_destino(rs.getString("destino"));
                cd.setImagenURL(rs.getString("imagenURL"));
                cd.setFecha_salida(rs.getString("fecha_salida"));
                cd.setHora_salida(rs.getString("hora_salida"));
                cd.setHora_llegada(rs.getString("hora_llegada"));
                lista.add(cd);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    public List listarPorCiudad(String origen, String destino) {
        ArrayList<Vuelo> lista = new ArrayList<>();
        String sql = "SELECT v.id_vuelo, v.ciudad_origen, v.ciudad_destino, v.precio, v.fecha_salida, v.hora_salida, v.hora_llegada, c1.nombre as 'origen', c2.nombre as 'destino', c2.imagenURL FROM VUELOS v, CIUDADES c1, CIUDADES c2 where v.ciudad_origen = c1.id_ciudad AND v.ciudad_destino = c2.id_ciudad and v.ciudad_origen = ? and v.ciudad_destino = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, origen);
            ps.setString(2, destino);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vuelo cd = new Vuelo();
                cd.setId(rs.getInt("id_vuelo"));
                cd.setId_origen(rs.getInt("ciudad_origen"));
                cd.setId_destino(rs.getInt("ciudad_destino"));
                cd.setPrecio(rs.getDouble("precio"));
                cd.setCiudad_origen(rs.getString("origen"));
                cd.setCiudad_destino(rs.getString("destino"));
                cd.setImagenURL(rs.getString("imagenURL"));
                cd.setFecha_salida(rs.getString("fecha_salida"));
                cd.setHora_salida(rs.getString("hora_salida"));
                cd.setHora_llegada(rs.getString("hora_llegada"));
                lista.add(cd);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    public List listarPorCiudadFecha(String origen, String destino, String fecha) {
        ArrayList<Vuelo> lista = new ArrayList<>();
        String sql = "SELECT v.id_vuelo, v.ciudad_origen, v.ciudad_destino, v.precio, v.fecha_salida, v.hora_salida, v.hora_llegada, c1.nombre as 'origen', c2.nombre as 'destino', c2.imagenURL FROM VUELOS v, CIUDADES c1, CIUDADES c2 where v.ciudad_origen = c1.id_ciudad AND v.ciudad_destino = c2.id_ciudad and v.ciudad_origen = ? and v.ciudad_destino = ? and v.fecha_salida = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, origen);
            ps.setString(2, destino);
            ps.setString(3, fecha);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vuelo cd = new Vuelo();
                cd.setId(rs.getInt("id_vuelo"));
                cd.setId_origen(rs.getInt("ciudad_origen"));
                cd.setId_destino(rs.getInt("ciudad_destino"));
                cd.setPrecio(rs.getDouble("precio"));
                cd.setCiudad_origen(rs.getString("origen"));
                cd.setCiudad_destino(rs.getString("destino"));
                cd.setImagenURL(rs.getString("imagenURL"));
                cd.setFecha_salida(rs.getString("fecha_salida"));
                cd.setHora_salida(rs.getString("hora_salida"));
                cd.setHora_llegada(rs.getString("hora_llegada"));
                lista.add(cd);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean agregarVuelo(String origen, String destino, double precio, String fecha, String hora_s, String hora_l) {
        String sql = "INSERT INTO VUELOS VALUES (DEFAULT,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, origen);
            ps.setString(2, destino);
            ps.setDouble(3, precio);
            ps.setString(4, fecha);
            ps.setString(5, hora_s);
            ps.setString(6, hora_l);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean eliminarVuelo(String id) {
        if (eliminarReservaPorVuelo(id)) {
            String sql = "DELETE FROM VUELOS WHERE id_vuelo = ?";
            try {
                con = cn.getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();

                return true;
            } catch (Exception e) {
                return false;
            }
        }

        return false;
    }

    private boolean eliminarReservaPorVuelo(String idVuelo) {
        String sql = "DELETE FROM RESERVA_VUELOS WHERE id_vuelo_fk = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, idVuelo);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean agregarReserva(String userId, String vueloId, String pasajeros, double total) {
        String sql = "INSERT INTO RESERVA_VUELOS VALUES (DEFAULT,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, vueloId);
            ps.setString(2, userId);
            ps.setString(3, pasajeros);
            ps.setDouble(4, total);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
