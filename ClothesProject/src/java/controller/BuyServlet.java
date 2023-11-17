/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
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
import model.Image;
import model.Item;
import model.Product;
import model.Size;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="BuyServlet", urlPatterns={"/buy"})
public class BuyServlet extends HttpServlet {
   
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
            out.println("<title>Servlet BuyServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath () + "</h1>");
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
         String productID_raw = request.getParameter("productID");
        int productID = 0;
        try {
            productID = Integer.parseInt(productID_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        DAO d = new DAO();
        Product p = d.getProductByProductID(productID);
        List<Image> listImage = d.getImageByProductID(productID);
        request.setAttribute("p", p);
        request.setAttribute("listImage", listImage);
        List<Size> listSize = d.getSizeByCategoryID(p.getSub_category().getCategory().getCategoryID());
        request.setAttribute("listSize", listSize);
        List<Product> related = d.getProductByBrandID(p.getBrand().getBrandID());

        int i = 0;
        int check = 0;
        while (p.getProductID() != check) {
            check = related.get(i).getProductID();
            i++;
        }
        for (int j = 0; j < related.size(); j++) {
            if(related.get(j).getProductID()==productID){
                related.remove(j);
                break;
            }
        }
        if (related.size() > 4) {
            related.subList(4, related.size()).clear();
        }

        
        
        List<Color> listColor=d.getColorByProductID(productID);
        
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
        String quantity=request.getParameter("quantity");
        String sizeID=request.getParameter("sizeID");
        String colorID=request.getParameter("colorID");
        if(txt.isEmpty()){
            txt=productID+":"+colorID+":"+sizeID+":"+quantity;
        }else{
            txt=txt+"/"+productID+":"+colorID+":"+sizeID+":"+quantity;
        }
        Cookie c=new Cookie("cart", txt);
        c.setMaxAge(2*24*60*60);
        response.addCookie(c);
        Cart cart=new Cart(txt);
        int size=cart.getItems().size();
request.setAttribute("listColor", listColor);
        request.setAttribute("sizeCart", size);
        request.setAttribute("related", related);
        request.getRequestDispatcher("product.jsp").forward(request, response);
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
        processRequest(request, response);
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
