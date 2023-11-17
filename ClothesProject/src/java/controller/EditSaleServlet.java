/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import dal.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Brand;
import model.Sale;
import model.Size;
import model.Sub_Category;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="EditSaleServlet", urlPatterns={"/editSale"})
public class EditSaleServlet extends HttpServlet {
   
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
            out.println("<title>Servlet EditSaleServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditSaleServlet at " + request.getContextPath () + "</h1>");
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
        SaleDAO sd=new SaleDAO();
        
        String saleID_raw=request.getParameter("saleID");
        int saleID=0;
        try{
            saleID=Integer.parseInt(saleID_raw);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        DAO d=new DAO();
        List<Sub_Category> listSub=d.getAllSubCategory();
        List<Size> listSize=d.getAllSize();
        List<Brand> listBrand=d.getAllBrand();
        request.setAttribute("listSub", listSub);
        request.setAttribute("listSize", listSize);
        request.setAttribute("listBrand", listBrand);
        Sale s=sd.getSaleBySaleID(saleID);
        request.setAttribute("sale", s);
        request.getRequestDispatcher("editSale.jsp").forward(request, response);
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
        String sale_raw=request.getParameter("sale");
        String saleID_raw=request.getParameter("saleID");
        String brandID_raw=request.getParameter("brandID");
       String name= request.getParameter("name");
        String to=request.getParameter("to");
       String from= request.getParameter("from");
        String apply_raw=request.getParameter("apply");
        int apply=0;
        int saleID=0,brandID=0;
        double sale=0;
        SaleDAO sd=new SaleDAO();
        try{
apply=Integer.parseInt(apply_raw);
            saleID=Integer.parseInt(saleID_raw);
            brandID=Integer.parseInt(brandID_raw);
            sale=Double.parseDouble(sale_raw);
        }catch(Exception e){
            System.out.println(e);
        }
        Boolean choice=true;
        if(apply==0){
            choice=false;
        }
       
        String inputPattern = "yyyy-MM-dd'T'HH:mm";
        String outputPattern = "yyyy-MM-dd HH:mm:ss.SSS";

        // Định dạng đầu vào và đầu ra
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern(inputPattern);
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern(outputPattern);

        // Chuyển đổi chuỗi thành LocalDateTime
        LocalDateTime fromTime = LocalDateTime.parse(from, inputFormatter);
LocalDateTime toTime = LocalDateTime.parse(to, inputFormatter);
        // Chuyển đổi LocalDateTime thành chuỗi định dạng mong muốn
        String from1 = fromTime.format(outputFormatter);
        String to1 = toTime.format(outputFormatter);
        DAO d=new DAO();
         Brand brand=null;
        if(brandID!=0){
        brand=d.getBrandByBrandID(brandID);}
        
        Sale s=new Sale(saleID, sale,brand , "img/saleoff.png", name,to1 , from1,choice);
        sd.editSaleBySaleID(s);
        response.sendRedirect("sale");
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
