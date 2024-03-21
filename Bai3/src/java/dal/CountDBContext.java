/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import PageView.View;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class CountDBContext extends DBContext<View> {

    public int getViewCount() {
        int count = 0;

        try {
            String sql = "SELECT count FROM Count";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = (int) rs.getInt("count");
            }
        } catch (SQLException ex) {

        }
        return count;
    }

    public void insertCount(int insert) {
        try {

            String shiftDownSql = "UPDATE [dbo].[Count] SET [count] = [count] + 1";

            PreparedStatement stm1 = connection.prepareStatement(shiftDownSql);
            stm1.executeUpdate();

            String sql = "INSERT INTO [dbo].[Count]\n"
                    + "           ([count])\n"
                    + "     VALUES	(?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, insert);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    @Override
    public ArrayList<View> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(View entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(View entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(View entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public View get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
