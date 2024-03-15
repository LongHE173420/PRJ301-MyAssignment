/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assiment;
import entity.Exam;
import entity.Grade;
import entity.Student;
import entity.Subject;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class GradeDBContext extends DBContext<Grade> {
    
    
    public ArrayList<Grade> getGradeBySid(int sid, int subid) {
        ArrayList<Grade> grades = new ArrayList<>();
        try {
            String sql = "SELECT gra.grid, e.eid, e.date, ass.asid, ass.name , ass.weight, sub.subid, sub.subname, "
                    + "sub.credit, s.sid, s.sname, s.scode, s.sgender, s.sdob, s.smail, s.sphone, s.saddress, gra.score "
                    + "FROM Grade gra "
                    + "INNER JOIN Exam e ON gra.eid = e.eid "
                    + "INNER JOIN Student s ON gra.sid = s.sid "
                    + "INNER JOIN Assiment ass ON ass.asid = e.asid "
                    + "INNER JOIN Subject sub ON sub.subid = ass.subid "
                    + "WHERE s.sid = ? AND sub.subid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, subid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setGrid(rs.getInt("grid"));
                grade.setScore(rs.getFloat("score"));

                Subject sub = new Subject();
                sub.setSubid(rs.getInt("subid"));
                sub.setSubname(rs.getString("subname"));
                sub.setCredit(rs.getInt("credit"));

                Assiment assiment = new Assiment();
                assiment.setAsid(rs.getInt("asid"));
                assiment.setName(rs.getString("name"));
                assiment.setWeight(rs.getFloat("weight"));
                assiment.setSubid(sub);

                Exam exam = new Exam();
                exam.setEid(rs.getInt("eid"));
                exam.setDate(rs.getDate("date"));
                exam.setAsid(assiment);

                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setScode(rs.getString("scode"));
                s.setSgender(rs.getBoolean("sgender"));
                s.setSmail(rs.getString("smail"));
                s.setSphone(rs.getString("sphone"));
                s.setSaddress(rs.getString("saddress"));
                s.setSdob(rs.getDate("sdob"));

                grade.setEid(exam);
                grade.setStid(s);

                grades.add(grade);
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(GradeDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return grades;
    }
    
    

    @Override
    public ArrayList<Grade> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Grade get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
