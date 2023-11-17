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
import model.Product;
import model.Sub_Category;

/**
 *
 * @author Pham Thang
 */
public class SearchDAO extends DBContext{
    public List<Product> searchByName(String name){
        String sql = "select * from Product  where name like '%"+name+"%'";
        List<Product> list=new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DAO d=new DAO();
                Product p = new Product();
                Brand b=d.getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc=d.getSubCategoryBySubCategoryID(rs.getInt("subID"));
                p.setSub_category(sc);
                p.setViewCount(rs.getInt("viewCount"));
                p.setPrice(rs.getInt("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
//    public static void main(String[] args) {
//        SearchDAO sd=new SearchDAO();
//        System.out.println(sd.searchByName("levent").get(1).getImage());
//    }
}
