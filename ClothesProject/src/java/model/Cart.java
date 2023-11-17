/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DAO;
import dal.WarehouseDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Pham Thang
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityByIdColorSize(int productID, int colorID, int sizeID) {
        return getItemByIDColorSize(productID, colorID, sizeID).getQuantity();
    }

    private Item getItemByIDColorSize(int productID, int colorID, int sizeID) {
        for (Item i : items) {
            if (i.getProduct().getProductID() == productID && i.getColor().getColorID()==colorID && i.getSize().getSizeID() == sizeID) {
                return i;
            }
        }
        return null;
    }
    public void addItem(Item t){
        if(getItemByIDColorSize(t.getProduct().getProductID(), t.getColor().getColorID(), t.getSize().getSizeID())!=null){
            Item m=getItemByIDColorSize(t.getProduct().getProductID(), t.getColor().getColorID(), t.getSize().getSizeID());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }
        else{
            items.add(t);
        }
    }
    public void removeItem(int productID, int colorID, int sizeID){
        if(getItemByIDColorSize(productID, colorID, sizeID)!=null){
            items.remove(getItemByIDColorSize(productID, colorID, sizeID));
        }
    }
    public double getTotalMoney(){
        double t=0;
        for (Item i : items) {
            t+=(i.getQuantity())*(i.getProduct().getPrice());
        }
        return t;
    }
    public double getFinalTotalMoney(){
        double t=0; 
        for (Item i : items) {
            if(!i.getProduct().getBrand().getCountry().equals("Việt Nam")){
                t+=i.getQuantity()*i.getProduct().getPrice()*1.1;
            } else{
                t+=i.getQuantity()*i.getProduct().getPrice();
            }
            
        }
        return t;
    }
//    private Product getProductByProductID(int productID,List<Product> list){
//        for(Product i:list){
//            if(i.getProductID()==productID)
//                return i;
//        }
//        return null;
//    }
    public Cart(String txt){
        DAO d=new DAO();
        items=new ArrayList<>();
        try{
        if(txt!=null && txt.length()!=0){
            String[] s=txt.split("/");
            for(String i:s){
                String[] n=i.split(":");
                int productID=Integer.parseInt(n[0]);
                int colorID=Integer.parseInt(n[1]);
                int sizeID=Integer.parseInt(n[2]);
                int quantity=Integer.parseInt(n[3]);
                Product p=d.getProductByProductID(productID);
                Size size=d.getSizeBySizeID(sizeID);
                
               Color c=d.getColorByColorID(colorID);
                Item t=new Item(p, size,c , quantity);
                addItem(t);
            }
            
        }
        }
        catch(NumberFormatException e){
            System.out.println(e);
        }
    }
}
