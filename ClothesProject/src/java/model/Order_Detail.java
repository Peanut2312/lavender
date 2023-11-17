/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Pham Thang
 */
public class Order_Detail {
    private int listID;
    private Product product;
    private int quantity;
    private double total;
    private int orderID;
    private Size size;
    private Color color;

    public Order_Detail() {
    }

    public Order_Detail(int listID, Product product, int quantity, double total, int orderID, Size size, Color color) {
        this.listID = listID;
        this.product = product;
        this.quantity = quantity;
        this.total = total;
        this.orderID = orderID;
        this.size = size;
        this.color = color;
    }

    public int getListID() {
        return listID;
    }

    public void setListID(int listID) {
        this.listID = listID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }
    

   

   

    
    
    
    
}
