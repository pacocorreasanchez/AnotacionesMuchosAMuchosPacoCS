/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.beans.Modulo;
import es.albarregas.beans.Profesor;
import es.albarregas.dao.IGenericoDAO;
import es.albarregas.daofactory.DAOFactory;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paco
 */
@WebServlet(name = "Conclusion", urlPatterns = {"/Conclusion"})
public class Conclusion extends HttpServlet {

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
        String url = null;

        DAOFactory daof = DAOFactory.getDAOFactory();
        IGenericoDAO gdao = daof.getGenericoDAO();

        Profesor profesor = new Profesor();

        int contadorModulos = 5;

        switch (request.getParameter("op")) {
            case "update":
                profesor = (Profesor) gdao.getById(Integer.parseInt(request.getParameter("id")), Profesor.class);
                profesor.setNombreProfesor(request.getParameter("nombre"));

                Set<Modulo> modulos = new HashSet<Modulo>();

                for (int i = 1; i <= contadorModulos; i++) {
                    Modulo modulo = new Modulo();
                    if (request.getParameter("selectModulo" + i) != null && !request.getParameter("selectModulo" + i).equals("vacio")) {
                        modulo = (Modulo) gdao.getById(Integer.parseInt(request.getParameter("selectModulo" + i)), Modulo.class);
                        modulos.add(modulo);
                        gdao.insertOrUpdate(modulo);
                    } else if (request.getParameter("modulo" + i) != null && request.getParameter("modulo" + i).length() > 0) {
                        modulo.setNombreModulo(request.getParameter("modulo" + i));
                        modulos.add(modulo);
                        gdao.insertOrUpdate(modulo);
                    }
                }

                gdao.insertOrUpdate(profesor);
                url = "index.jsp";
                break;
        }

        request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
