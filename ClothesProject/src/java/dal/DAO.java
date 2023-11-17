/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.oracle.wls.shaded.org.apache.bcel.generic.DDIV;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Product;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Brand;
import model.Category;
import model.Color;
import model.Image;
import model.Size;
import model.Sub_Category;

/**
 *
 * @author Pham Thang
 */
public class DAO extends DBContext {
//----------------  Category ---------------

    public Category getCategoryByCategoryID(int categoryID) {
        String sql = "select * from Category where categoryID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(categoryID, rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getAllCategory() {
        String sql = "select * from Category";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//----------------  Sub Category ---------------
    public List<Sub_Category> getAllSubCategory() {
        String sql = "select * from Sub_Category";
        List<Sub_Category> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Sub_Category sc = new Sub_Category(rs.getInt("subID"),
                        getCategoryByCategoryID(rs.getInt("categoryID")),
                        rs.getString("name"));
                list.add(sc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Sub_Category getSubCategoryBySubCategoryID(int subID) {
        String sql = "select * from Sub_Category where subID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Sub_Category sc = new Sub_Category(subID,
                        getCategoryByCategoryID(rs.getInt("categoryID")),
                        rs.getString("name"));
                return sc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Map<Category, List<Sub_Category>> getSubCategoryByCategory(List<Category> c) {
        Map<Category, List<Sub_Category>> list = new LinkedHashMap<>();
        String sql = "select * from Sub_Category where categoryID = ? ";
        for (int i = 0; i < c.size(); i++) {
            List<Sub_Category> listcon = new ArrayList<>();
            try {

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, c.get(i).getCategoryID());
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Sub_Category sc = new Sub_Category(rs.getInt("subID"),
                            getCategoryByCategoryID(c.get(i).getCategoryID()),
                            rs.getString("name"));
                    listcon.add(sc);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            list.put(c.get(i), listcon);
        }
        return list;

    }
//----------------  Color ---------------

    public List<Color> getAllColor() {
        String sql = "select * from Color";
        List<Color> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color c = new Color(rs.getInt("colorID"), rs.getString("color"), getProductByProductID(rs.getInt("productID")));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Color getColorByColorID(int colorID) {
        String sql = "select * from Color where colorID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, colorID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = getProductByProductID(rs.getInt("productID"));
                Color c = new Color(colorID, rs.getString("color"), p);
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Color> getColorByProductID(int productID) {
        String sql = "select * from Color where productID=?";
        List<Color> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getProductByProductID(productID);
                Color c = new Color(rs.getInt("colorID"), rs.getString("color"), p);
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//----------------  Size ---------------
    public List<Size> getAllSize() {
        String sql = "select * from Size";
        List<Size> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Size s = new Size(rs.getInt("sizeID"), rs.getString("size"), c);
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Size getSizeBySizeID(int sizeID) {
        String sql = "select * from Size where sizeID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sizeID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Size s = new Size(sizeID, rs.getString("size"),
                        getCategoryByCategoryID(rs.getInt("categoryID")));

                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Size> getSizeByCategoryID(int categoryID) {
        String sql = "select * from Size where categoryID=?";
        List<Size> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = getCategoryByCategoryID(categoryID);
                Size s = new Size(rs.getInt("sizeID"), rs.getString("size"), c);
                list.add(s);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//----------------  Brand ---------------
    public Brand getBrandByBrandID(int brandID) {
        String sql = "select * from Brand where brandID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand b = new Brand(brandID, rs.getString("name"), rs.getString("country"));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Brand> getAllBrand() {
        String sql = "select * from Brand";
        List<Brand> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand(rs.getInt("brandID"), rs.getString("name"), rs.getString("country"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
//----------------  Product ---------------

    public List<Product> getProductBySubCategoryID(int subID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product  where subID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(subID);
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

    public List<Product> getAllProduct() {
        String sql = "select * from Product";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
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

    public List<Product> getAllNewProduct() {
        String sql = "select * from Product WHERE DATEDIFF(MONTH, createDate, GETDATE()) < 6";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
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

    public List<Product> getNewProduct() {
        String sql = "select top 3 * from Product WHERE DATEDIFF(MONTH, createDate, GETDATE()) < 6";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
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

    public List<Product> getOldProduct() {
        String sql = "select top 3 * from Product order by createDate";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
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

    public List<Product> getHotProduct() {
        String sql = "select top 3 * from Product order by viewCount desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
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

    public Product getProductByProductID(int productID) {
        String sql = "select * from Product  where productID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(rs.getInt("brandID"));
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(productID);
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
                p.setSub_category(sc);
                p.setViewCount(rs.getInt("viewCount"));
                p.setPrice(rs.getInt("price"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductByBrandID(int brandID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product  where brandID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(brandID);
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
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

    public List<Product> getNewProductByBrandID(int brandID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product  where brandID = ? and DATEDIFF(MONTH, createDate, GETDATE()) < 6 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = getBrandByBrandID(brandID);
                p.setCreateDate(rs.getString("createDate"));
                p.setDetail(rs.getString("detail"));
                p.setImage(rs.getString("image"));
                p.setMaterial(rs.getString("material"));
                p.setBrand(b);
                p.setName(rs.getString("name"));
                p.setProductID(rs.getInt("productID"));
                p.setRefundPolicy(rs.getString("refundPolicy"));
                p.setSizeGuide(rs.getString("sizeGuide"));
                Sub_Category sc = getSubCategoryBySubCategoryID(rs.getInt("subID"));
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

    public void deleteProductByProductID(int productID) {
        String sql = "delete from Warehouse where productID=?\n"
                + "delete from Color where productID=?\n"
                + "delete from Image where productID=?\n"
                + "delete from Order_Detail where productID=?\n"
                + "delete from Product where productID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, productID);
            st.setInt(3, productID);
            st.setInt(4, productID);
            st.setInt(5, productID);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProductByListProductID(int[] productID) {
        String sql = "delete from Warehouse where productID=?\n"
                + "delete from Color where productID=?\n"
                + "delete from Image where productID=?\n"
                + "delete from Order_Detail where productID=?\n"
                + "delete from Product where productID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (int i = 0; i < productID.length; i++) {
                st.setInt(1, productID[i]);
                st.setInt(2, productID[i]);
                st.setInt(3, productID[i]);
                st.setInt(4, productID[i]);
                st.setInt(5, productID[i]);
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public String addProduct(Product p) {
        String sql = "insert into Product (brandID,name,price,createDate,subID,material,detail,sizeGuide,refundPolicy) \n"
                + "values (?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getBrand().getBrandID());
            st.setNString(2, p.getName());
            st.setInt(3, p.getPrice());
            st.setString(4, p.getCreateDate());
            st.setInt(5, p.getSub_category().getSubID());
            st.setNString(6, p.getMaterial());
            st.setNString(7, p.getDetail());
            st.setNString(8, p.getSizeGuide());
            st.setNString(9, p.getRefundPolicy());
            int test = st.executeUpdate();
            if (test > 0) {
                return "thanh cong";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "that bai";
    }

    public String editProductByProductID(Product p) {
        String sql = "update Product\n"
                + "set brandID=?,name=?,price=?,createDate=?,subID=?,material=?,detail=?,sizeGuide=?,refundPolicy=?\n"
                + "where productID=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getBrand().getBrandID());
            st.setNString(2, p.getName());
            st.setInt(3, p.getPrice());
            st.setString(4, p.getCreateDate());
            st.setInt(5, p.getSub_category().getSubID());
            st.setNString(6, p.getMaterial());
            st.setNString(7, p.getDetail());
            st.setNString(8, p.getSizeGuide());
            st.setNString(9, p.getRefundPolicy());
            st.setInt(10, p.getProductID());
            int test = st.executeUpdate();
            if (test > 0) {
                return "thanh cong";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "that bai";
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void addViewCount(int productID) {
        String sql = "update Product set viewCount=viewCount+1 where productID=?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, productID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//----------------  Image ---------------
    public List<Image> getImageByProductID(int productID) {
        String sql = "select * from Image where productID=?";
        List<Image> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getProductByProductID(productID);
                Image i = new Image(rs.getInt("imageID"), rs.getString("image"), p);
                list.add(i);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
//        Brand b = new Brand(1, "Kh", "IDK");
//        Category c = new Category(1, "fd");
//        Sub_Category sc = new Sub_Category(1, c, "Nhu");
//        Product p=new Product(16, b, "tên", 0, "2023-12-22", sc, "chất liệu", "dôn nâu", "đì têu", 0, "sai gai", "rì phăn");
//        System.out.println(d.editProductByProductID(p));
//        int[] productID = {22, 23};
//        d.deleteProductByListProductID(productID);
        System.out.println(d.getCategoryByCategoryID(3).getName());
    }

    public void deleteBrand(int brandID) {
        String sql = "delete from Sale where brandID=?\n"
                + "delete from Image where productID in (select productID from Product where brandID=?)\n"
                + "delete from Warehouse where productID in (select productID from Product where brandID=?)\n"
                + "delete from Color where productID in (select productID from Product where brandID=?)\n"
                + "delete from Order_Detail where productID in (select productID from Product where brandID=?)\n"
                + "delete from Product where brandID=?\n"
                + "delete from Brand where brandID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            st.setInt(2, brandID);
            st.setInt(3, brandID);
            st.setInt(4, brandID);
            st.setInt(5, brandID);
            st.setInt(6, brandID);
            st.setInt(7, brandID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCategory(int categoryID) {
        String sql = "delete from Warehouse where sizeID in(select sizeID from Size where categoryID=?)\n"
                + "delete from Size where categoryID=?\n"
                + "delete from Order_Detail where productID in (select productID from Product where subID in (select subID from Sub_Category where categoryID=?))\n"
                + "delete from Image where productID in (select productID from Product where subID in (select subID from Sub_Category where categoryID=?))\n"
                + "delete from Product where subID in (select subID from Sub_Category where categoryID=?)\n"
                + "delete from Sub_Category where categoryID=?\n"
                + "delete from Category where categoryID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            st.setInt(2, categoryID);
            st.setInt(3, categoryID);
            st.setInt(4, categoryID);
            st.setInt(5, categoryID);
            st.setInt(6, categoryID);
            st.setInt(7, categoryID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteColor(int colorID) {
        String sql = "delete from Warehouse where colorID=?\n"
                + "delete from Color where colorID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, colorID);
            st.setInt(2, colorID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSize(int sizeID) {
        String sql = "delete from Warehouse where sizeID=?\n"
                + "delete from Size where sizeID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sizeID);
            st.setInt(2, sizeID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSubCategory(int subID) {
        String sql = "delete from Order_Detail where productID in(select productID from Product where subID=?)\n"
                + "delete from Image where productID in(select productID from Product where subID=?)\n"
                + "delete from Product where subID=?\n"
                + "delete from Sub_Category where subID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subID);
            st.setInt(2, subID);
            st.setInt(3, subID);
            st.setInt(4, subID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addBrand(String brandName, String country) {
        String sql = "insert into Brand (name,country) values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, brandName);
            st.setNString(2, country);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addCategory(String categoryName) {
        String sql = "insert into Category (name) values (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, categoryName);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addSize(String sizeName, int cateID) {
        String sql = "insert into Size (size,categoryID) values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, sizeName);
            st.setInt(2, cateID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addColor(String colorName, int productID) {
        String sql = "insert into Color (color,productID) values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, colorName);
            st.setInt(2, productID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addSub(String subName, int categoryID) {
        String sql = "insert into Sub_Category (name,categoryID) values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, subName);
            st.setInt(2, categoryID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editBrand(int brandID, String brandName, String country) {
        String sql = "update Brand set name=?,country=? where brandID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, brandName);
            st.setNString(2, country);
            st.setInt(3, brandID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
