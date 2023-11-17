/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Pham Thang
 */
public class Sale {
    private int saleID;
    private double sale;
    private Brand brand;

  
    private String image;
    private String name;
    private String toTime;
    private String fromTime;
    private boolean apply;

    public Sale() {
    }

    public Sale(int saleID, double sale, Brand brand, String image, String name, String toTime, String fromTime, boolean apply) {
        this.saleID = saleID;
        this.sale = sale;
        this.brand = brand;
        this.image = image;
        this.name = name;
        this.toTime = toTime;
        this.fromTime = fromTime;
        this.apply = apply;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getToTime() {
        return toTime;
    }

    public void setToTime(String toTime) {
        this.toTime = toTime;
    }

    public String getFromTime() {
        return fromTime;
    }

    public void setFromTime(String fromTime) {
        this.fromTime = fromTime;
    }

    public boolean isApply() {
        return apply;
    }

    public void setApply(boolean apply) {
        this.apply = apply;
    }

    
   

   
    
}
