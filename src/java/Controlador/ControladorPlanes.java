/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import ModeloDAO.PlanesTuristicosDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Oscar
 */
public class ControladorPlanes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorPlanes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPlanes at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso = "";
        String action = request.getParameter("accion");
        
        if (action.equalsIgnoreCase("Agregar")) {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("desc");
            String ciudad = request.getParameter("ciudad");
            String precioA = request.getParameter("precioA");
            String precioN = request.getParameter("precioN");
            String imagenURL = request.getParameter("img");
            
            PlanesTuristicosDAO dao = new PlanesTuristicosDAO();
            if(dao.agregarPlan(nombre, descripcion, ciudad, Double.parseDouble(precioA), Double.parseDouble(precioN), imagenURL))
            {
                acceso = "/adminPlanes.jsp";
            }            
        } 
        
        if (action.equalsIgnoreCase("Eliminar")) {
            String id = request.getParameter("id");
            
            PlanesTuristicosDAO dao = new PlanesTuristicosDAO();
            if(dao.eliminarPlan(id))
            {
                acceso = "/adminPlanes.jsp";
            }            
        } 
        
        if (action.equalsIgnoreCase("Modificar")) {
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String origen = request.getParameter("origen");
            String precioA = request.getParameter("precioA");
            String precioN = request.getParameter("precioN");
            String imagen = request.getParameter("imagen");
            
            PlanesTuristicosDAO dao = new PlanesTuristicosDAO();
            if(dao.modificarPlan(id, nombre, descripcion, origen, Double.parseDouble(precioA), Double.parseDouble(precioN), imagen))
            {
                acceso = "/adminPlanes.jsp";
            }            
        } 
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
        //processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
