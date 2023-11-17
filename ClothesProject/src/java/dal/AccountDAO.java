/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Color;
import model.Item;
import util.EncodePasswork;

/**
 *
 * @author Pham Thang
 */
public class AccountDAO extends DBContext {

    public Account login(String username, String password) {
        String sql = "select * from Account where username= ? and password =?";
        EncodePasswork en = new EncodePasswork();
        String passEncode = en.toSHA1(password);
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, username);
            st.setNString(2, passEncode);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account a = new Account();
                a.setAddress(rs.getString("address"));
                a.setAvatar(rs.getString("avatar"));
                a.setDob(rs.getString("dob"));
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPassword(rs.getString("password"));
                a.setPhone(rs.getString("phone"));
                a.setRole(rs.getBoolean("role"));
                a.setAccountID(rs.getInt("accountID"));
                a.setUsername(rs.getString("username"));
                a.setBalance(rs.getDouble("balance"));
                a.setStatus(rs.getBoolean("status"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public Account getAccountByAccountID(int accountID){
        String sql = "select * from Account  where accountID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a=new Account();
                 a.setAddress(rs.getString("address"));
                a.setAvatar(rs.getString("avatar"));
                a.setDob(rs.getString("dob"));
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPassword(rs.getString("password"));
                a.setPhone(rs.getString("phone"));
                a.setRole(rs.getBoolean("role"));
                a.setAccountID(rs.getInt("accountID"));
                a.setBalance(rs.getDouble("balance"));
                a.setUsername(rs.getString("username"));
                a.setStatus(rs.getBoolean("status"));
                return a;
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public String signup(String username, String password, String email, String firstname, String lastname) {
        String sql = "insert into Account (username,password,firstName,lastName,email) values (?,?,?,?,?)";
        EncodePasswork en = new EncodePasswork();
        String passEncode = en.toSHA1(password);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, username);
            st.setNString(2, passEncode);
            st.setNString(3, firstname);
            st.setNString(4, lastname);
            st.setString(5, email);

            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                return "Sign up succesfully";
            } else {
                return "Sign up failed";
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Account> getAllAccount() {
        String sql = "select * from Account";
        List<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAddress(rs.getString("address"));
                a.setAvatar(rs.getString("avatar"));
                a.setDob(rs.getString("dob"));
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPassword(rs.getString("password"));
                a.setPhone(rs.getString("phone"));
                a.setRole(rs.getBoolean("role"));
                a.setAccountID(rs.getInt("accountID"));
                a.setBalance(rs.getDouble("balance"));
                a.setUsername(rs.getString("username"));
                a.setStatus(rs.getBoolean("status"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account checkAccountExist(String username) {
        String sql = "select * from Account where username= ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account a = new Account();
                a.setAddress(rs.getString("address"));
                a.setAvatar(rs.getString("avatar"));
                a.setDob(rs.getString("dob"));
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPassword(rs.getString("password"));
                a.setPhone(rs.getString("phone"));
                a.setRole(rs.getBoolean("role"));
                a.setAccountID(rs.getInt("accountID"));
                a.setUsername(rs.getString("username"));
                a.setBalance(rs.getDouble("balance"));
                a.setStatus(rs.getBoolean("status"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
     public String changePass(String password,int accountID) {
        String sql = "UPDATE Account\n"
                + "SET password=?\n"
                + "WHERE accountID=?;";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            EncodePasswork ec=new EncodePasswork();
            String passEncode=ec.toSHA1(password);
            st.setString(1, passEncode);
            
             st.setInt(2, accountID);

            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                return "Update succesfully";
            } else {
                return "Update failed";
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public String updateProfile(String first,String last,String phone,String email,String dob,String address,int accountID) {
        String sql = "UPDATE Account\n"
                + "SET firstname=?,lastname= ?,phone= ?,email= ?,dob= ? ,address=?\n"
                + "WHERE accountID=?;";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, first);
            st.setNString(2, last);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, dob);
             st.setNString(6, address);
             st.setInt(7, accountID);

            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                return "Update succesfully";
            } else {
                return "Update failed";
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void addOrder(Account a,Cart c,String address,String note){
        LocalDateTime now = LocalDateTime.now();
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
         String date = now.format(formatter);
        try{
            String sql="insert into [Order] (accountID,status,bill,date,address,note) values(?,?,?,?,?,?)";
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, a.getAccountID());
            st.setNString(2, "Pending");
            st.setDouble(3, c.getFinalTotalMoney());
            st.setString(4, date);
            st.setNString(5, address);
            st.setNString(6, note);
            st.executeUpdate();
            String sql1="select top 1 orderID from [Order] order by orderID desc";
            PreparedStatement st1=connection.prepareStatement(sql1);
            ResultSet rs=st1.executeQuery();
            if(rs.next()){
                int orderID=rs.getInt("orderID");
                for(Item i : c.getItems()){
                    String sql2="insert into Order_Detail (productID,quantity,total,orderID,sizeID,colorID) values(?,?,?,?,?,?)";
                    PreparedStatement st2=connection.prepareStatement(sql2);
                    st2.setInt(1, i.getProduct().getProductID());
                    st2.setInt(2, i.getQuantity());
                    st2.setDouble(3, (i.getQuantity()*i.getProduct().getPrice()));
                    st2.setInt(4, orderID);
                    st2.setInt(5, i.getSize().getSizeID());
                    st2.setInt(6, i.getColor().getColorID());
                    
                    st2.executeUpdate();
                }
            }
            // cap nhat lai so luong san pham trong kho
            String sql3="update Warehouse set quantity=quantity-? where productID =? and colorID=? and sizeID =?";
            PreparedStatement st3=connection.prepareStatement(sql3);
            for(Item i:c.getItems()){
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getProductID());
                st3.setInt(3, i.getColor().getColorID());
                st3.setInt(4, i.getSize().getSizeID());
                st3.executeUpdate();
            }
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    public void pay(Account a,int pay){
         String sql="update Account set balance=balance-? where accountID=?";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pay);
            st.setInt(2, a.getAccountID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
   

    public List<Account> getAllUser() {
        String sql = "select * from Account where role='false'";
        List<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                 Account a = new Account();
                a.setAddress(rs.getString("address"));
                a.setAvatar(rs.getString("avatar"));
                a.setDob(rs.getString("dob"));
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPassword(rs.getString("password"));
                a.setPhone(rs.getString("phone"));
                a.setRole(rs.getBoolean("role"));
                a.setAccountID(rs.getInt("accountID"));
                a.setUsername(rs.getString("username"));
                a.setBalance(rs.getDouble("balance"));
                a.setStatus(rs.getBoolean("status"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void blockByAccountID(int accountID) {
         String sql="update Account set status='false' where accountID=?";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,accountID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void activeByAccountID(int accountID) {
         String sql="update Account set status='true' where accountID=?";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,accountID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     public static void main(String[] args) { 
        AccountDAO ad = new AccountDAO();
//System.out.println(ad.updateProfile("Trường FPT", "Tư bản", "0123456789", "test@gmail.com", "2021-12-12", "Hòa Lạc city",2));
//System.out.println(ad.checkAccountExist("Thắng123").getFirstname());
//System.out.println(ad.getAccountByAccountID(2).getFirstname());
    ad.blockByAccountID(29);
     }
}
