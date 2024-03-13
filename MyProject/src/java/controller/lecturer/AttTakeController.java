/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import controller.author.BaseRequiredAuthenticationController;
import dal.LessionDBContext;
import entity.Account;
import entity.Attendence;
import entity.Lession;
import entity.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AttTakeController extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
       int leid = Integer.parseInt(req.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Student> students = db.getStudentsByLession(leid);
        ArrayList<Attendence> atts = new ArrayList<>();
        Lession lession = new Lession();
        lession.setLeid(leid);
        for (Student student : students) {
            Attendence a = new Attendence();
            a.setLession(lession);
            a.setStudent(student);
            a.setDescription(req.getParameter("description"+student.getSid()));
            a.setPresent(req.getParameter("present"+student.getSid()).equals("yes"));
            atts.add(a);
        }
        db.takeAttendances(leid, atts);
        resp.sendRedirect("att?id="+leid);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
//        int leid = Integer.parseInt(req.getParameter("id"));
        
          int leid = Integer.parseInt(req.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Attendence> atts = db.getAttendencesByLession(leid);

      
        Lession lession = db.getLesBy(leid);
        
        req.setAttribute("lession", lession);
        req.setAttribute("atts", atts);
       req.getRequestDispatcher("../view/lecturer/att.jsp").forward(req, resp);
    }
    
    
    
}