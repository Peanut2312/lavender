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
import java.util.List;
import model.Brand;
import model.Product;
import model.Size;
import model.Sub_Category;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="AddServlet", urlPatterns={"/add"})
public class AddServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AddServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddServlet at " + request.getContextPath () + "</h1>");
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
        List<Sub_Category> listSub=d.getAllSubCategory();
        List<Size> listSize=d.getAllSize();
        List<Brand> listBrand=d.getAllBrand();
        request.setAttribute("listSub", listSub);
        request.setAttribute("listSize", listSize);
        request.setAttribute("listBrand", listBrand);
        request.getRequestDispatcher("add.jsp").forward(request, response);
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
        String name=request.getParameter("name");
        String brand_raw=request.getParameter("brand");
        String sub_raw=request.getParameter("sub");
        String price_raw=request.getParameter("price");
        String date=request.getParameter("date");
        String material=request.getParameter("material");
        String detail=request.getParameter("detail");
        String size=request.getParameter("size");
        String refund=request.getParameter("refund");
        int brand=0;
        int sub=0;
        int price=0;
        try{
            brand=Integer.parseInt(brand_raw);
            sub=Integer.parseInt(sub_raw);
            price=Integer.parseInt(price_raw);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        DAO d=new DAO();
        Sub_Category sc=d.getSubCategoryBySubCategoryID(sub);
        Brand b=d.getBrandByBrandID(brand);
      
        Product p=new Product(b, name, price, date, sc, material, detail, size, refund);
//        PrintWriter out = response.getWriter();
//            out.print(brand);
        d.addProduct(p);
        response.sendRedirect("crud");
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
