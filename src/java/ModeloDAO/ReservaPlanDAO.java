/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

/**
 *
 * @author Oscar
 */
import BaseDatos.Conexion;
import Modelo.ReservaPlan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservaPlanDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List listar(String dest, String user) {
        ArrayList<ReservaPlan> lista = new ArrayList<>();
        String sql = "SELECT r.id_reservaplan, r.id_plan_fk, r.id_usuario_fk, r.n_adultos, r.n_ninos, r.total, p.nombre, p.descripcion \n"
                + "from planes_turisticos p, reservas_planes_turisticos r \n"
                + "WHERE r.id_plan_fk = p.id_plan \n"
                + "and p.ciudad = ?\n"
                + "and r.id_usuario_fk = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dest);
            ps.setString(2, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                ReservaPlan pt = new ReservaPlan();
                pt.setId(rs.getInt("id_reservaplan"));
                pt.setIdPlan(rs.getInt("id_plan_fk"));
                pt.setIdUsuario(rs.getInt("id_usuario_fk"));
                pt.setnAdultos(rs.getInt("n_adultos"));
                pt.setnNinos(rs.getInt("n_ninos"));
                pt.setTotal(rs.getDouble("total"));
                pt.setNombre(rs.getString("nombre"));
                pt.setDescripcion(rs.getString("descripcion"));
                lista.add(pt);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public List listar(String user) {
        ArrayList<ReservaPlan> lista = new ArrayList<>();
        String sql = "SELECT r.id_reservaplan, r.id_plan_fk, r.id_usuario_fk, r.n_adultos, r.n_ninos, r.total, p.nombre, p.descripcion \n"
                + "from planes_turisticos p, reservas_planes_turisticos r \n"
                + "WHERE r.id_plan_fk = p.id_plan \n"
                + "and r.id_usuario_fk = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                ReservaPlan pt = new ReservaPlan();
                pt.setId(rs.getInt("id_reservaplan"));
                pt.setIdPlan(rs.getInt("id_plan_fk"));
                pt.setIdUsuario(rs.getInt("id_usuario_fk"));
                pt.setnAdultos(rs.getInt("n_adultos"));
                pt.setnNinos(rs.getInt("n_ninos"));
                pt.setTotal(rs.getDouble("total"));
                pt.setNombre(rs.getString("nombre"));
                pt.setDescripcion(rs.getString("descripcion"));
                lista.add(pt);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public List listarReservas() {
        ArrayList<ReservaPlan> lista = new ArrayList<>();
        String sql = "SELECT r.id_plan_fk, p.nombre, p.descripcion, COUNT(*) as 'reservas', sum(r.n_adultos) as 'adultos', sum(r.n_ninos) as 'ninos', sum(r.total) as 'total'\n"
                + "FROM reservas_planes_turisticos r, planes_turisticos p \n"
                + "WHERE r.id_plan_fk = p.id_plan\n"
                + "GROUP BY id_plan_fk;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ReservaPlan pt = new ReservaPlan();
                pt.setIdPlan(rs.getInt("id_plan_fk"));
                pt.setnAdultos(rs.getInt("adultos"));
                pt.setnNinos(rs.getInt("ninos"));
                pt.setTotal(rs.getDouble("total"));
                pt.setNombre(rs.getString("nombre"));
                pt.setDescripcion(rs.getString("descripcion"));
                pt.setReservas(rs.getInt("reservas"));
                lista.add(pt);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean eliminar(String id) {
        String sql = "DELETE FROM RESERVAS_PLANES_TURISTICOS WHERE id_reservaplan = ?";

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

    public boolean eliminarReservas(String id) {
        String sql = "DELETE FROM RESERVAS_PLANES_TURISTICOS WHERE id_plan_fk = ?";

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
}
