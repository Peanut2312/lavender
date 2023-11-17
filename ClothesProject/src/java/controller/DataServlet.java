/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.DataDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import model.Account;
import model.Product;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "DataServlet", urlPatterns = {"/data"})
public class DataServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DataServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DataServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataDAO dd = new DataDAO();
        int[] country = dd.countCountry(7, 2023, 8, 2023);
        int[] count = dd.countOrderByTime(7, 2023, 8, 2023);
        LinkedHashMap<Account, Integer> top = dd.getTopCustomer(7, 2023, 8, 2023);
        LinkedHashMap<Account, Integer> rich = dd.getRichCustomer(7, 2023, 8, 2023);
        int month1 = 7;
        int month2 = 8;
        int year1 = 2023;
        int year2 = 2023;
        int year = 2023;
        int year3 = 2023;
        int year4 = 2023;
        int year5 = 2023;
        int year6 = 2023;
        int productID1=1;
        int productID2=3;
        String month1_raw = request.getParameter("month1");
        String month2_raw = request.getParameter("month2");
        String year1_raw = request.getParameter("year1");
        String year2_raw = request.getParameter("year2");
        String year_raw = request.getParameter("year");
        String year3_raw = request.getParameter("year3");
        String year4_raw=request.getParameter("year4");
         String year5_raw=request.getParameter("year5");
          String year6_raw=request.getParameter("year6");
          String productID1_raw=request.getParameter("productID1");
          String productID2_raw=request.getParameter("productID2");
        if (month1_raw != null) {

            try {
                month1 = Integer.parseInt(month1_raw);
                month2 = Integer.parseInt(month2_raw);
                year1 = Integer.parseInt(year1_raw);
                year2 = Integer.parseInt(year2_raw);
                count = dd.countOrderByTime(month1, year1, month2, year2);
                country = dd.countCountry(month1, year1, month2, year2);
                top = dd.getTopCustomer(month1, year1, month2, year2);
                rich = dd.getRichCustomer(month1, year1, month2, year2);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        if (year_raw != null) {
            try {
                year = Integer.parseInt(year_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        if (year3_raw != null) {
            try {
                year3 = Integer.parseInt(year3_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
         if (year4_raw != null) {
            try {
                year4 = Integer.parseInt(year4_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
         if (year5_raw != null) {
            try {
                year5 = Integer.parseInt(year5_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
         if (year6_raw != null) {
            try {
                year6 = Integer.parseInt(year6_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
          if (productID1_raw != null) {
            try {
                productID1 = Integer.parseInt(productID1_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
            if (productID2_raw != null) {
            try {
                productID2 = Integer.parseInt(productID2_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        int[] a = new int[13];
        for (int i = 0; i < 12; i++) {
            a[i] = dd.getCountBrand(i, 1, year);
        }
        request.setAttribute("levent", a);
        int[] b = new int[12];
        for (int i = 0; i < 12; i++) {
            b[i] = dd.getCountBrand(i, 5, year);
        }
        request.setAttribute("nike", b);
        int[] c = new int[12];
        for (int i = 0; i < 12; i++) {
            c[i] = dd.getCountBrand(i, 4, year);
        }
        int[] l = new int[5];
        for (int i = 0; i < 3; i++) {
            l = dd.getBrandMoney(year4, 1);
        }
        int[] o = new int[5];
        for (int i = 0; i < 3; i++) {
            o = dd.getBrandMoney(year4, 4);
        }
        int[] n = new int[5];
        for (int i = 0; i < 3; i++) {
            n = dd.getBrandMoney(year4, 5);
        }
        int[] revenue = new int[12];
        for (int i = 0; i < 12; i++) {
            revenue[i] = dd.getRevenue(year5, i);
        }
        
        DAO d=new DAO();
        Product p1=d.getProductByProductID(productID1);
        Product p2=d.getProductByProductID(productID2);
        request.setAttribute("p1", p1);
        request.setAttribute("p2", p2);
        request.setAttribute("sale1", dd.buyCount(productID1));
        request.setAttribute("sale2", dd.buyCount(productID2));
        request.setAttribute("buy1", dd.accountCount(productID1));
        request.setAttribute("buy2", dd.accountCount(productID2));
        request.setAttribute("i1", dd.warehouseCount(productID1));
        request.setAttribute("i2", dd.warehouseCount(productID2));
        request.setAttribute("list", d.getAllProduct());
        int[] money=dd.getCountryMoney(year3);
        request.setAttribute("outer", c);
        request.setAttribute("l", l);
        request.setAttribute("o", o);
       request.setAttribute("n", n);
       request.setAttribute("revenue", revenue);
        request.setAttribute("month1", month1);
        request.setAttribute("month2", month2);
         request.setAttribute("year", year);
        request.setAttribute("year1", year1);
        request.setAttribute("year2", year2);
         request.setAttribute("year5", year5);
        request.setAttribute("year4", year4);
        request.setAttribute("year6", year6);
        request.setAttribute("year3", year3);
        request.setAttribute("count", count);
        request.setAttribute("money", money);
        request.setAttribute("country", country);
        request.setAttribute("top", top);
        request.setAttribute("rich", rich);
        request.getRequestDispatcher("data.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
