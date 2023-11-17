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
import model.Brand;
import model.Item;
import model.Order;
import model.Order_Detail;
import model.Product;
import model.Sub_Category;

/**
 *
 * @author Pham Thang
 */
public class OrderDAO extends DBContext {

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDAO ad = new AccountDAO();
                Order o = new Order(rs.getInt("orderID"), ad.getAccountByAccountID(rs.getInt("accountID")), rs.getString("status"), rs.getDouble("bill"), rs.getString("date"),rs.getString("address"),rs.getString("note"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }



    public void changeStatus(int orderID, String status) {
        String sql="update [Order] set status= ? where orderID= ?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void deleletOrder(int orderID) {
        String sql="delete from Order_Detail where orderID=?\n" +
"delete from [Order] where orderID=?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public List<Order_Detail> getDetailOrderByDetaiOrderID(int orderID) {
        String sql = "select * from Order_Detail where orderID =?";
        List<Order_Detail> list=new ArrayList<>();
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
           while (rs.next()) {
                AccountDAO ad=new AccountDAO();
                DAO d=new DAO();
                Order_Detail od=new Order_Detail(rs.getInt("listID"), d.getProductByProductID(rs.getInt("productID")), rs.getInt("quantity"), rs.getDouble("total"), orderID, d.getSizeBySizeID(rs.getInt("sizeID")), d.getColorByColorID(rs.getInt("colorID")));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public Order getOrderByOrderID(int orderID) {
        String sql = "select * from [Order] where orderID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AccountDAO ad=new AccountDAO();
                Order o=new Order(orderID, ad.getAccountByAccountID(rs.getInt("accountID")), rs.getString("status"), rs.getDouble("bill"), rs.getString("date"),rs.getString("address"),rs.getString("note"));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Order_Detail> getOrderDetailByStatusAccountID(String status,int accountID){
         String sql = "select * from Order_Detail where orderID in (select orderID from [Order] where accountID=? and status=?) ";
         List<Order_Detail> list=new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
             st.setString(2, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDAO ad=new AccountDAO();
                DAO d=new DAO();
                Order_Detail od=new Order_Detail(rs.getInt("listID"), d.getProductByProductID(rs.getInt("productID")), rs.getInt("quantity"), rs.getDouble("total"), rs.getInt("orderID"), d.getSizeBySizeID(rs.getInt("sizeID")), d.getColorByColorID(rs.getInt("colorID")));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
      

    public void backProductAndMoney(int orderID) {
        List<Item> items=new ArrayList<>();
        DAO d=new DAO();
        String sql="select * from Order_Detail where orderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Item i=new Item(d.getProductByProductID(rs.getInt("productID")), d.getSizeBySizeID(rs.getInt("sizeID")), d.getColorByColorID(rs.getInt("colorID")), rs.getInt("quantity"));
                items.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        for (Item i : items) {
            String sql1="update Warehouse set quantity=quantity+? where productID=? and sizeID=? and colorID=?\n" +
"update Account set balance=balance+ (?*?)";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, i.getQuantity());
            st1.setInt(2,i.getProduct().getProductID());
            st1.setInt(3, i.getSize().getSizeID());
            st1.setInt(4, i.getColor().getColorID());
            st1.setInt(5, i.getProduct().getPrice());
            st1.setInt(6, i.getQuantity());
            st1.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        }
    }
    public static void main(String[] args) {
        OrderDAO od=new OrderDAO();
        od.backProductAndMoney(113);
    }
}
