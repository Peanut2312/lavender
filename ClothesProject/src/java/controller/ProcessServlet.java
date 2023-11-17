/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import dal.WarehouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Color;
import model.Item;
import model.Product;
import model.Size;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="ProcessServlet", urlPatterns={"/process"})
public class ProcessServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO d=new DAO();
        List<Product> list=new ArrayList<>();
        Cookie[] arr=request.getCookies();
        String txt="";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart=new Cart(txt);
        String num_raw=request.getParameter("num");
        String productID_raw=request.getParameter("productID");
        String sizeID_raw=request.getParameter("sizeID");
        String colorID_raw=request.getParameter("colorID");
        int num=3,productID=0,sizeID=0,colorID=0;
        try{
            WarehouseDAO wd=new WarehouseDAO();
            productID=Integer.parseInt(productID_raw);
            num=Integer.parseInt(num_raw);
            sizeID=Integer.parseInt(sizeID_raw);
            colorID=Integer.parseInt(colorID_raw);
            Product p=d.getProductByProductID(productID);
            Size s=d.getSizeBySizeID(sizeID);
            Color c=d.getColorByColorID(colorID);
            int numStore=wd.getQuantityProductByColorSize(productID, colorID, sizeID);
            if(num==-1&&(cart.getQuantityByIdColorSize(productID, colorID, sizeID)==1)){
                cart.removeItem(productID, colorID, sizeID);
            }else{
                if(num==1 && cart.getQuantityByIdColorSize(productID, colorID, sizeID)==numStore){
                    num=0;
                }
                Item t=new Item(p, s, c, num);
                cart.addItem(t);
            }
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        List<Item> items=cart.getItems();
        txt="";
        if(items.size()>0){
            txt=items.get(0).getProduct().getProductID()+":"+
                    items.get(0).getColor().getColorID()+":"+items.get(0).getSize().getSizeID()+":"+
                    items.get(0).getQuantity();
            for(int i=1;i<items.size();i++){
                txt+="/"+items.get(i).getProduct().getProductID()+":"+
                    items.get(i).getColor().getColorID()+":"+items.get(i).getSize().getSizeID()+":"+
                    items.get(i).getQuantity();
            }
                    
        }
        request.setAttribute("num", num);
        Cookie c=new Cookie("cart", txt);
        c.setMaxAge(2*24*60*60);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("show.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       DAO d=new DAO();
        Cookie[] arr=request.getCookies();
        String txt="";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String productID=request.getParameter("productID");
        String sizeID=request.getParameter("sizeID");
        String colorID=request.getParameter("colorID");
        String[] ids=txt.split("/");
        String out="";
        for(int i=0;i<ids.length;i++){
            String[] s=ids[i].split(":");
            if(s[0].equals(productID)==false||s[1].equals(colorID)==false||s[2].equals(sizeID)==false){
                if(out.isEmpty()){
                    out=ids[i];
                }else{
                    out+="/"+ids[i];
                }
            }
        }
        if(!out.isEmpty()){
            Cookie c=new Cookie("cart", out);
            c.setMaxAge(2*24*60*60);
            response.addCookie(c);
        }
        Cart cart=new Cart(out);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("show.jsp").forward(request, response);
//        int num=3,productID=0,sizeID=0,colorID=0;
//        try{
//            WarehouseDAO wd=new WarehouseDAO();
//            productID=Integer.parseInt(productID_raw);
//            sizeID=Integer.parseInt(sizeID_raw);
//            colorID=Integer.parseInt(colorID_raw);
//            Product p=d.getProductByProductID(productID);
//            Size s=d.getSizeBySizeID(sizeID);
//            Color c=d.getColorByColorID(colorID);
//            }
//        catch(NumberFormatException e){
//            System.out.println(e);
//        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
