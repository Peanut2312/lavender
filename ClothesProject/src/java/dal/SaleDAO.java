/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;
import model.Sale;

/**
 *
 * @author Pham Thang
 */
public class SaleDAO extends DBContext{
    public Sale getSaleByTime(){
 LocalDateTime currentDateTime = LocalDateTime.now();
   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
DAO d=new DAO();
        // Chuyển đổi thành chuỗi
        String date = currentDateTime.format(formatter);
        Sale s=new Sale();
        String sql="select * from Sale where toTime> ? ";
         try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                
               s=new Sale(rs.getInt("saleID"), rs.getDouble("sale")
                        , d.getBrandByBrandID(rs.getInt("brandID")),rs.getString("image"), rs.getString("name"), rs.getString("toTime"),rs.getString("fromTime"),rs.getBoolean("apply"));
           return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void apply(Sale s){
        String sql="update Sale set apply=1 where saleID=?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, s.getSaleID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void deleteApply(Sale s){
        String sql="update Sale set apply=0 where saleID=?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, s.getSaleID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
   


    public void updatePrice(Sale s) {
        String sql="update Product set price=price-price*?";
         try {
            
            if(s.getBrand()!=null){
                sql+=" where brandID= "+s.getBrand().getBrandID();
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, s.getSale());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void backPrice(Sale s) {
        String sql="update Product set price=price/(1-?)";
         try {
             
           
            if(s.getBrand()!=null){
                sql+=" where brandID = "+s.getBrand().getBrandID();
            }
             PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, s.getSale());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSaleBySaleID(int saleID) {
        String sql="delete from Sale where saleID = ?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, saleID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void editSaleBySaleID(Sale s) {
        
        if(s.getBrand()!=null){
             String sql = "update Sale\n"
                + "set sale=?,brandID=?,name=?,toTime=?,fromTime=?,apply=?\n"
                + "where saleID=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, s.getSale());
            
            st.setInt(2, s.getBrand().getBrandID());
            st.setNString(3, s.getName());
            st.setString(4, s.getToTime());
            st.setString(5, s.getFromTime());
            st.setBoolean(6, s.isApply());
            st.setInt(7, s.getSaleID());
             st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        } else{
             String sql = "update Sale\n"
                + "set sale=?,name=?,toTime=?,fromTime=?,apply=?\n"
                + "where saleID=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, s.getSale());
            
            st.setNString(2, s.getName());
            st.setString(3, s.getToTime());
            st.setString(4, s.getFromTime());
            st.setBoolean(5, s.isApply());
            st.setInt(6, s.getSaleID());
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        }
    }
    
    


     public boolean checkAvailable(Sale sale) {
        String toTimeString = sale.getToTime();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

        LocalDateTime toTime = LocalDateTime.parse(toTimeString, formatter);

        LocalDateTime currentDateTime = LocalDateTime.now();

        return toTime.isAfter(currentDateTime);
    }

    public Sale getSaleBySaleID(int saleID) {
        String sql = "select * from Sale where saleID =?";
        try {
DAO d=new DAO();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, saleID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand brand=null;
                if(rs.getInt("brandID")!=0){
                    brand=d.getBrandByBrandID(rs.getInt("brandID"));
                }
                Sale s=new Sale(rs.getInt("saleID"), rs.getDouble("sale")
                        ,brand ,rs.getString("image"), rs.getString("name"), rs.getString("toTime"),rs.getString("fromTime"),rs.getBoolean("apply"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addSale(Sale s) {
        if(s.getBrand()!=null){
             String sql = "insert into Sale (sale,brandID,image,name,toTime,fromTime,apply) values (?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, s.getSale());
            
            st.setInt(2, s.getBrand().getBrandID());
            st.setString(3, "img/saleoff.png");
            st.setNString(4, s.getName());
            st.setString(5, s.getToTime());
            st.setString(6, s.getFromTime());
            st.setBoolean(7, s.isApply());
             st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        } else{
            String sql = "insert into Sale (sale,image,name,toTime,fromTime,apply) values (?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, s.getSale());
            
            st.setString(2, "img/saleoff.png");
            st.setNString(3, s.getName());
            st.setString(4, s.getToTime());
            st.setString(5, s.getFromTime());
            st.setBoolean(6, s.isApply());
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        }
        
    }
     

    public List<Sale> getAllSale() {
         String sql = "select * from Sale";
        List<Sale> list = new ArrayList<>();
        try {
            DAO d=new DAO();
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               Sale  s=new Sale(rs.getInt("saleID"), rs.getDouble("sale")
                        ,d.getBrandByBrandID(rs.getInt("brandID")) ,rs.getString("image"), rs.getString("name"), rs.getString("toTime"),rs.getString("fromTime"),rs.getBoolean("apply"));
           list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        SaleDAO sd=new SaleDAO();
        System.out.println(sd.getAllSale().get(0).getName());
    }
}
