/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Image;
import model.Product;
import model.Warehouse;

/**
 *
 * @author Pham Thang
 */
public class WarehouseDAO extends DBContext{
    public List<Warehouse> getAllWarehouse(){
        List<Warehouse> list=new ArrayList<>();
        String sql = "select * from Warehouse";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DAO d=new DAO();
                Warehouse w=new Warehouse(d.getProductByProductID(rs.getInt("productID")),d.getSizeBySizeID( rs.getInt("sizeID")),d.getColorByColorID(rs.getInt("colorID")) , rs.getInt("quantity"));
                list.add(w);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    } 
    public int getQuantityProductByColorSize(int productID,int colorID,int sizeID){
        int quantity=0;
        DAO d=new DAO();
        String sql="select * from Warehouse where productID = ? and colorID = ? and sizeID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, colorID);
            st.setInt(3, sizeID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                quantity=rs.getInt("quantity");
            }
            
           } catch(SQLException e){
               System.out.println(e);
           }   
        return quantity;
    }
    public static void main(String[] args) {
        WarehouseDAO wd=new WarehouseDAO();
        wd.update(1, 1, 1, 10);
    }

    public void update(int productID, int colorID, int sizeID, int quantity) {
        String sql="update Warehouse set quantity=? where\n" +
"productID=? and colorID=? and sizeID=?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(2, productID);
            st.setInt(3, colorID);
            st.setInt(4, sizeID);
            st.setInt(1, quantity);
            
            st.executeUpdate();
            
           } catch(SQLException e){
               System.out.println(e);
           }   
    }
    public void delete(int productID, int colorID, int sizeID) {
        String sql="delete from Warehouse where\n" +
"productID=? and colorID=? and sizeID=?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, colorID);
            st.setInt(3, sizeID);
          
            st.executeUpdate();
            
           } catch(SQLException e){
               System.out.println(e);
           }   
    }

    public void add(int productID, int colorID, int sizeID, int quantity) {
        String sql="insert into Warehouse (productID,colorID,sizeID,quantity) values(?,?,?,?)";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, colorID);
            st.setInt(3, sizeID);
          st.setInt(4, quantity);
            st.executeUpdate();
            
           } catch(SQLException e){
               System.out.println(e);
           }  
    }
}
