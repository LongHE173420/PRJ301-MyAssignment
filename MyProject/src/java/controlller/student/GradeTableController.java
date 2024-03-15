/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlller.student;

import dal.GradeDBContext;
import dal.SubjectDBContext;
import entity.Grade;
import entity.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class GradeTableController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GradeTableController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GradeTableController at " + request.getContextPath() + "</h1>");
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
        

        request.getRequestDispatcher("/view/student/gradeinput.jsp").forward(request, response);
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
        try {
        // Retrieve student and subject IDs from request parameters
        int stId = Integer.parseInt(request.getParameter("stId"));
        int subId = Integer.parseInt(request.getParameter("subId"));

        // Retrieve grades based on student and subject IDs
        GradeDBContext gradeDBContext = new GradeDBContext();
        ArrayList<Grade> grades = gradeDBContext.getGradeBySid(stId, subId);

        // Set grades in request attributes
        request.setAttribute("grades", grades);
        // Set student and subject IDs in request attributes (optional)
       float over = calculate(grades);
        request.setAttribute("over", over);
        // Forward the request to gradetable.jsp
        request.getRequestDispatcher("/view/student/gradetable.jsp").forward(request, response);
    } catch (NumberFormatException e) {
        // Handle NumberFormatException if parsing IDs fails
        e.printStackTrace(); // or handle gracefully, e.g., redirect to an error page
    }

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

        private float calculate(ArrayList<Grade> grades) {
        float overal = 0;
        for (Grade grade : grades) {
            overal += grade.getScore() * grade.getEid().getAsid().getWeight();
        }
        return overal;
    }
}
