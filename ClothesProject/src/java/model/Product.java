/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Pham Thang
 */
public class Product {
    private int productID;
    private Brand brand;
    private String name;
    private int price;
    private String createDate;
    private Sub_Category sub_category;
    private String material;
    private String image;
    private String detail;
    private int viewCount;
    private String sizeGuide;
    private String refundPolicy;

    public Product(Brand brand, String name, int price, String createDate, Sub_Category sub_category, String material, String detail, String sizeGuide, String refundPolicy) {
        this.brand = brand;
        this.name = name;
        this.price = price;
        this.createDate = createDate;
        this.sub_category = sub_category;
        this.material = material;
        this.detail = detail;
        this.sizeGuide = sizeGuide;
        this.refundPolicy = refundPolicy;
    }
    

    public Product() {
    }

    public Product(int productID, Brand brand, String name, int price, String createDate, Sub_Category sub_category, String material, String image, String detail, int viewCount, String sizeGuide, String refundPolicy) {
        this.productID = productID;
        this.brand = brand;
        this.name = name;
        this.price = price;
        this.createDate = createDate;
        this.sub_category = sub_category;
        this.material = material;
        this.image = image;
        this.detail = detail;
        this.viewCount = viewCount;
        this.sizeGuide = sizeGuide;
        this.refundPolicy = refundPolicy;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

   

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Sub_Category getSub_category() {
        return sub_category;
    }

    public void setSub_category(Sub_Category sub_category) {
        this.sub_category = sub_category;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public String getSizeGuide() {
        return sizeGuide;
    }

    public void setSizeGuide(String sizeGuide) {
        this.sizeGuide = sizeGuide;
    }

    public String getRefundPolicy() {
        return refundPolicy;
    }

    public void setRefundPolicy(String refundPolicy) {
        this.refundPolicy = refundPolicy;
    }
    
}
