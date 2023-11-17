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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="UpdateDetail", urlPatterns={"/updateDetail"})
public class UpdateDetail extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDetail at " + request.getContextPath () + "</h1>");
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
        String brandName=request.getParameter("brandName");
        String country=request.getParameter("country");
        String categoryName=request.getParameter("categoryName");
        String sizeName=request.getParameter("sizeName");
        String cateID_raw=request.getParameter("cateID");
        String colorName=request.getParameter("colorName");
        String subName=request.getParameter("subName");
        String productID_raw=request.getParameter("productID");
        String categoryID_raw=request.getParameter("categoryID");
        DAO d=new DAO();
        if(brandName!=null){
            d.addBrand(brandName,country);
        }
        if(categoryName!=null){
            d.addCategory(categoryName);
        }
        if(sizeName!=null){
            int cateID=0;
            try{
                cateID=Integer.parseInt(cateID_raw);
            }
            catch(NumberFormatException e){
                System.out.println(e);
            }
            d.addSize(sizeName,cateID);
        }
        if(colorName!=null){
            int productID=0;
            try{
                productID=Integer.parseInt(productID_raw);
            }catch(NumberFormatException e){
                System.out.println(e);
            }
            d.addColor(colorName,productID);
        }
        if(subName!=null){
            int categoryID=0;
            try{
                categoryID=Integer.parseInt(categoryID_raw);
            }catch(NumberFormatException e){
                System.out.println(e);
            }
            d.addSub(subName,categoryID);
        }
                     request.getRequestDispatcher("detail").forward(request, response);

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
