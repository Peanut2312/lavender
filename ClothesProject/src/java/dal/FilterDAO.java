/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Brand;
import model.Sub_Category;

/**
 *
 * @author Pham Thang
 */
public class FilterDAO extends DBContext{
    public List<Product> filter(String from,String to,int subID,int min,int max,int[] brandID){
        List<Product> list=new ArrayList<>();
        DAO d=new DAO();
         String sql="select * from Product where price between  "+min+" and "+max;
            if(brandID!=null){
                sql+=" and brandID in (";
                for(int i=0;i<brandID.length-1;i++){
                    sql+=brandID[i]+",";
                }
                sql+=brandID[brandID.length-1]+")";
            }
            if(from!=null){
                sql+=" and createDate>= '"+from+"'";
            }
            if(to!=null){
                sql+=" and createDate<= '"+to+"'";
            }
            if(subID!=0){
                sql+=" and subID= "+subID;
            }
        try{
        PreparedStatement st=connection.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        while(rs.next()){
            Product p=new Product();
            Brand b=d.getBrandByBrandID(rs.getInt("brandID"));
            p.setBrand(b);
            p.setCreateDate(rs.getString("createDate"));
            p.setDetail(rs.getString("detail"));
            p.setImage(rs.getString("image"));
            p.setMaterial(rs.getString("material"));
            p.setName(rs.getString("name"));
            p.setPrice(rs.getInt("price"));
            p.setProductID(rs.getInt("productID"));
            p.setRefundPolicy(rs.getString("refundPolicy"));
            p.setSizeGuide(rs.getString("sizeGuide"));
            Sub_Category sc=d.getSubCategoryBySubCategoryID(rs.getInt("subID"));
            p.setSub_category(sc);
            p.setViewCount(rs.getInt("viewCount"));
            list.add(p);
        }
                }
        catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    public List<Brand> getBrandBySubCategoryID(int subID){
        List<Brand> list=new ArrayList<>();
        String sql="select * from Brand where brandID in (select brandID from Product where subID="+subID+")";
        DAO d=new DAO();
        try{
        PreparedStatement st=connection.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        while(rs.next()){
            Brand b=new Brand(rs.getInt("brandID"), rs.getString("name"), rs.getString("country"));
            list.add(b);
        }
                }
        catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
   
//    public static void main(String[] args) {
//        FilterDAO fd=new FilterDAO();
//     int[] b={1,4};
//        List<Product> list=fd.filter(null, null, 1, 0,10000000,b);
//        System.out.println(list.get(1).getName());
//    }
}
