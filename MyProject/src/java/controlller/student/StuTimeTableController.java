/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlller.student;


import controller.author.BaseRequiredAuthenticationController;
import dal.LecturerDBContext;
import dal.LessionDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import util.DateTimeHelper;
import entity.*;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class StuTimeTableController extends BaseRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        req.getRequestDispatcher("/view/student/stutable.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        int lid = 0;
        if (idParam != null && !idParam.isEmpty()) {
            lid = Integer.parseInt(idParam);
        } else {
            resp.getWriter().println("Can't get lid!");
        }
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
        String position = req.getParameter("position");
        java.sql.Date from = null;
        java.sql.Date to = null;

        Date today = new Date();
        if (raw_from == null||raw_from.isEmpty()) {
            from = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.getWeekStart(today));
        } else {
            from = java.sql.Date.valueOf(raw_from);
        }

        if (raw_to == null||raw_to.isEmpty()) {
            to = DateTimeHelper.convertUtilDateToSqlDate(
                    DateTimeHelper.addDaysToDate(DateTimeHelper.getWeekStart(today), 6));
        } else {
            to = java.sql.Date.valueOf(raw_to);
        }

        ArrayList<java.sql.Date> dates = DateTimeHelper.getListBetween(
                DateTimeHelper.convertSqlDateToUtilDate(from),
                DateTimeHelper.convertSqlDateToUtilDate(to));

        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        
        
        LessionDBContext lessDB = new LessionDBContext();
        ArrayList<Lession> lessions = lessDB.getLessionBy(lid, from, to);
//        ArrayList<Lession> stdLessions = lessDB.getStdLessionBy(lid,from,to);
        
        LecturerDBContext ldb = new LecturerDBContext();
        Lecturer lecturer = ldb.getLecturerById(lid);
        
        StudentDBContext stDB = new StudentDBContext();
     Student student = stDB.getStdByID(lid);
        
        
        req.setAttribute("student", student);
//       req.setAttribute("stdLessions", stdLessions);
        req.setAttribute("lecturer", lecturer);
        req.setAttribute("slots", slots);
        req.setAttribute("dates", dates);
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("lessions", lessions);
        req.getRequestDispatcher("../view/student/stutimetable.jsp").forward(req, resp);

    }
    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}