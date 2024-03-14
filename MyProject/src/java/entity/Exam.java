/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class Exam {
    private int eid;
    private Assiment asid;
    private Date date;

    public Exam() {
    }

    public Exam(int eid, Assiment asid, Date date) {
        this.eid = eid;
        this.asid = asid;
        this.date = date;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public Assiment getAsid() {
        return asid;
    }

    public void setAsid(Assiment asid) {
        this.asid = asid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
