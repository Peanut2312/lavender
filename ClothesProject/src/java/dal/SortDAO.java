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
public class SortDAO extends DBContext{
  public List<Product> sort(String from,String to,int subID,int min,int max,int[] brandID,int option){
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
            if(option!=0){
                if(option==1){
                    sql+=" order by price";
                }
                if(option==2){
                    sql+=" order by price DESC";
                }
                if(option==3){
                    sql+=" order by createDate";
                }
                if(option==4){
                    sql+=" order by createDate DESC";
                }
                if(option==5){
                    sql+=" order by viewCount";
                }
                if(option==6){
                    sql+=" order by viewCount DESC";
                }
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
//    public static void main(String[] args) {
//        SortDAO sd=new SortDAO();
//        int[] b=null;
//        System.out.println(sd.sort(null, null, 0, 0, 10000000, b, 1).get(1).getName());
//    }
}
