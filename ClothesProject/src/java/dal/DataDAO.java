/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Account;

/**
 *
 * @author Pham Thang
 */
public class DataDAO extends DBContext {

    public int[] countOrderByTime(int month1, int year1, int month2, int year2) {
        int[] count = new int[6];
        String sql = "WITH Hours AS (\n"
                + "    SELECT ? AS hour\n"
                + ")\n"
                + "\n"
                + "SELECT Hours.hour, ISNULL(COUNT([Order].orderID), 0) AS order_count\n"
                + "FROM Hours\n"
                + "LEFT JOIN [Order] ON Hours.hour = DATEPART(HOUR, [Order].date)\n"
                + "WHERE [Order].date >= '" + year1 + "-" + month1 + "-01' AND [Order].date < '" + year2 + "-" + month2 + "-01'\n"
                + "GROUP BY Hours.hour;";
        try {
            int k = 0;
            for (int i = 0; i < 6; i++) {
                int sum = 0;
                for (int j = 0; j < 4; j++) {
                    PreparedStatement st = connection.prepareStatement(sql);
                    st.setInt(1, k);
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        sum += rs.getInt("order_count");
                    }
                    k++;
                }
                count[i] = sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public int[] countCountry(int month1, int year1, int month2, int year2) {
        int[] count = new int[2];
        int i = 0;
        String sql = "SELECT \n"
                + "    CASE \n"
                + "        WHEN country = N'Việt Nam' THEN N'Việt Nam'\n"
                + "        ELSE 'Foreign'\n"
                + "    END AS country,\n"
                + "    COUNT(listID) AS [Count]\n"
                + "FROM \n"
                + "    Order_Detail od, Brand b, Product p,[Order] o\n"
                + "WHERE \n"
                + "    p.productID = od.productID\n"
                + "    AND p.brandID = b.brandID\n"
                + "	and o.orderID=od.orderID\n"
                + "    AND o.date >= '" + year1 + "-" + month1 + "-01' AND o.date < '" + year2 + "-" + month2 + "-01'\n"
                + "GROUP BY \n"
                + "    CASE \n"
                + "        WHEN country = N'Việt Nam' THEN N'Việt Nam'\n"
                + "        ELSE 'Foreign'\n"
                + "    END\n"
                + "ORDER BY \n"
                + "    COUNT(listID) desc;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count[i] = rs.getInt("Count");
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public LinkedHashMap<Account, Integer> getTopCustomer(int month1, int year1, int month2, int year2) {
        LinkedHashMap<Account, Integer> top = new LinkedHashMap<>();
        String sql = "SELECT top 5 a.accountID, COUNT(o.orderID) AS NumberOfOrder "
                + "FROM Account a JOIN [Order] o ON a.accountID = o.accountID "
                + "WHERE o.date >= ? AND o.date < ? "
                + "GROUP BY a.accountID "
                + "ORDER BY NumberOfOrder DESC ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, year1 + "-" + month1 + "-01");
            st.setString(2, year2 + "-" + month2 + "-01");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDAO ad = new AccountDAO();
                Account account = ad.getAccountByAccountID(rs.getInt("accountID"));
                int numberOfOrders = rs.getInt("NumberOfOrder");
                top.put(account, numberOfOrders);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return top;
    }

    public LinkedHashMap<Account, Integer> getRichCustomer(int month1, int year1, int month2, int year2) {
        LinkedHashMap<Account, Integer> top = new LinkedHashMap<>();
        String sql = "SELECT a.accountID, SUM(od.total) AS Total "
                + "FROM Account a "
                + "JOIN [Order] o ON a.accountID = o.accountID "
                + "JOIN Order_Detail od ON o.orderID = od.orderID "
                + "WHERE o.date >= ? AND o.date < ? "
                + "GROUP BY a.accountID "
                + "ORDER BY SUM(od.total) DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, year1 + "-" + month1 + "-01");
            st.setString(2, year2 + "-" + month2 + "-01");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDAO ad = new AccountDAO();
                Account account = ad.getAccountByAccountID(rs.getInt("accountID"));
                int total = rs.getInt("Total");
                top.put(account, total);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return top;
    }

    public int getCountBrand(int month, int brandID, int year) {
        int count = 0;
        String sql = "select b.name,sum(quantity) as [Count]  from Product p,Brand b, Order_Detail od,[Order] o \n"
                + "where p.productID=od.productID and b.brandID=p.brandID and b.brandID=? and o.orderID=od.orderID and month(o.date)=?\n"
                + "and year(o.date)=?\n"
                + "group by b.name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            st.setInt(2, month + 1);
            st.setInt(3, year);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("Count");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public String[] getCountry(int year) {
        String[] country = new String[20];
        int i = 0;
        String sql = "select b.country,sum(total) as [Count]  from Product p,Brand b, Order_Detail od,[Order] o \n"
                + "where p.productID=od.productID and b.brandID=p.brandID and o.orderID=od.orderID  and year(o.date)=?\n"
                + "group by b.country";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                country[i] = rs.getString("country");
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return country;
    }

    public int[] getCountryMoney(int year) {
        int[] country = new int[20];
        int i = 0;
        String sql = "select b.country,sum(total) as [Count]  from Product p,Brand b, Order_Detail od,[Order] o \n"
                + "where p.productID=od.productID and b.brandID=p.brandID and o.orderID=od.orderID  and year(o.date)=?\n"
                + "group by b.country";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                country[i] = rs.getInt("Count");
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return country;
    }

    public int[] getBrandMoney(int year, int brandID) {
        int[] money = new int[20];
        int i = 0;
        String sql = "select p.name,b.name,sum(od.total) as [Count]  from Product p,Brand b, Order_Detail od,[Order] o \n"
                + "where p.productID=od.productID and b.brandID=p.brandID  and o.orderID=od.orderID and b.brandID=?\n"
                + "and year(o.date)=?\n"
                + "group by p.name,b.name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                money[i] = rs.getInt("Count");
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return money;
    }

    public int getRevenue(int year, int month) {
        int money = 0;
        String sql = "select sum(od.total) as [Count] from Order_Detail od,[Order] o\n"
                + "where o.orderID=od.orderID and month(o.date)=? and year(o.date)=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month + 1);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                money = rs.getInt("Count");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return money;
    }
    public int buyCount(int productID){
        int result = 0;
        String sql = "select p.name, sum(od.quantity) as[a] from Product p, Order_Detail od where od.productID=p.productID and p.productID=? group by p.name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt("a");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }
    public int accountCount(int productID){
        int result = 0;
        String sql = "select p.name, sum(od.quantity) as[a] from Product p, Order_Detail od where od.productID=p.productID and p.productID=? group by p.name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt("a");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }
     public int warehouseCount(int productID){
        int result = 0;
        String sql = "select p.name ,sum(w.quantity) as[a] from Warehouse w,Product p where p.productID=w.productID and p.productID=? group by p.name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt("a");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

    public static void main(String[] args) {
        DataDAO dd = new DataDAO();
        System.out.println(dd.warehouseCount(1));
    }
}
