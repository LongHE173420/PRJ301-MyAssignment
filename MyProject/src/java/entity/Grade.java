/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Grade {
    private int grid;
    private Exam eid;
    private Student stid;
    private float score;

    public Grade() {
    }

    public Grade(int grid, Exam eid, Student stid, float score) {
        this.grid = grid;
        this.eid = eid;
        this.stid = stid;
        this.score = score;
    }

    public int getGrid() {
        return grid;
    }

    public void setGrid(int grid) {
        this.grid = grid;
    }

    public Exam getEid() {
        return eid;
    }

    public void setEid(Exam eid) {
        this.eid = eid;
    }

    public Student getStid() {
        return stid;
    }

    public void setStid(Student stid) {
        this.stid = stid;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    
    
}
