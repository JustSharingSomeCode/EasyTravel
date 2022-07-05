/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import BaseDatos.Conexion;
import Modelo.PlanesTuristicos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Oscar
 */
public class PlanesTuristicosDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List listar(String dest, String user) {
        ArrayList<PlanesTuristicos> lista = new ArrayList<>();
        String sql = "SELECT * FROM PLANES_TURISTICOS WHERE id_plan NOT IN (SELECT id_plan_fk FROM reservas_planes_turisticos WHERE id_usuario_fk = ?) AND ciudad = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(2, user);
            ps.setString(1, dest);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlanesTuristicos pt = new PlanesTuristicos();
                pt.setId(rs.getInt("id_plan"));
                pt.setNombre(rs.getString("nombre"));
                pt.setDescripcion(rs.getString("descripcion"));
                pt.setCiudad(rs.getInt("ciudad"));
                pt.setPrecioAdulto(rs.getDouble("precio_adulto"));
                pt.setPrecioNino(rs.getDouble("precio_nino"));
                pt.setImagenURL(rs.getString("imagen_url"));
                lista.add(pt);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public List listar(String user) {
        ArrayList<PlanesTuristicos> lista = new ArrayList<>();
        String sql = "SELECT * FROM PLANES_TURISTICOS WHERE id_plan NOT IN (SELECT id_plan_fk FROM reservas_planes_turisticos WHERE id_usuario_fk = ?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlanesTuristicos pt = new PlanesTuristicos();
                pt.setId(rs.getInt("id_plan"));
                pt.setNombre(rs.getString("nombre"));
                pt.setDescripcion(rs.getString("descripcion"));
                pt.setCiudad(rs.getInt("ciudad"));
                pt.setPrecioAdulto(rs.getDouble("precio_adulto"));
                pt.setPrecioNino(rs.getDouble("precio_nino"));
                pt.setImagenURL(rs.getString("imagen_url"));
                lista.add(pt);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public List listarId(String id) {
        ArrayList<PlanesTuristicos> lista = new ArrayList<>();
        String sql = "SELECT*FROM PLANES_TURISTICOS WHERE id_plan = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlanesTuristicos pt = new PlanesTuristicos();
                pt.setId(rs.getInt("id_plan"));
                pt.setNombre(rs.getString("nombre"));
                pt.setDescripcion(rs.getString("descripcion"));
                pt.setCiudad(rs.getInt("ciudad"));
                pt.setPrecioAdulto(rs.getDouble("precio_adulto"));
                pt.setPrecioNino(rs.getDouble("precio_nino"));
                pt.setImagenURL(rs.getString("imagen_url"));
                lista.add(pt);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public List listar() {
        ArrayList<PlanesTuristicos> lista = new ArrayList<>();
        String sql = "SELECT*FROM PLANES_TURISTICOS";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlanesTuristicos pt = new PlanesTuristicos();
                pt.setId(rs.getInt("id_plan"));
                pt.setNombre(rs.getString("nombre"));
                pt.setDescripcion(rs.getString("descripcion"));
                pt.setCiudad(rs.getInt("ciudad"));
                pt.setPrecioAdulto(rs.getDouble("precio_adulto"));
                pt.setPrecioNino(rs.getDouble("precio_nino"));
                pt.setImagenURL(rs.getString("imagen_url"));
                lista.add(pt);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean agregarPlan(String nombre, String descripcion, String ciudad, double precioA, double precioN, String imagenURL) {
        String sql = "INSERT INTO PLANES_TURISTICOS VALUES (DEFAULT,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setString(3, ciudad);
            ps.setDouble(4, precioA);
            ps.setDouble(5, precioN);
            ps.setString(6, imagenURL);
            ps.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean eliminarPlan(String id) {
        ReservaPlanDAO reservas = new ReservaPlanDAO();
        if (reservas.eliminarReservas(id)) {

            String sql = "DELETE FROM PLANES_TURISTICOS WHERE id_plan = ?;";
            try {
                con = cn.getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();
                return true;
            } catch (Exception ex) {
                return false;
            }
        }

        return false;
    }

    public boolean agregarReserva(String userId, String planId, String adultos, String ninos, double total) {
        String sql = "INSERT INTO RESERVAS_PLANES_TURISTICOS VALUES (DEFAULT,?,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, planId);
            ps.setString(2, userId);
            ps.setString(3, adultos);
            ps.setString(4, ninos);
            ps.setDouble(5, total);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean modificarPlan(String id, String nombre, String descripcion, String origen, double precioA, double precioN, String imagen) {

        String sql = "UPDATE PLANES_TURISTICOS SET nombre = ?, descripcion = ?, ciudad = ?, precio_adulto = ?, precio_nino = ?, imagen_url = ? where id_plan = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setString(3, origen);
            ps.setDouble(4, precioA);
            ps.setDouble(5, precioN);
            ps.setString(6, imagen);
            ps.setString(7, id);
            ps.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
        
    }
}
