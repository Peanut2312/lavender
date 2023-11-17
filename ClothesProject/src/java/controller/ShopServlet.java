/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.FilterDAO;
import dal.SortDAO;
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
import java.util.Map;
import model.Brand;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;
import model.Size;
import model.Sub_Category;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "ShopServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
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

        DAO d = new DAO();
        FilterDAO fd = new FilterDAO();
        String subID_raw = request.getParameter("subID");
        int subID = 0;
        try {
            subID = Integer.parseInt(subID_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        List<Product> list;

        if (subID == 0) {
            list = d.getAllProduct();
        } else {
            list = d.getProductBySubCategoryID(subID);

        }
        // lấy danh sách brand
        List<Category> listCate = d.getAllCategory();
        List<Brand> listBrand = new ArrayList<>();
        if (subID == 0) {
            listBrand = null;
        } else {
            listBrand = fd.getBrandBySubCategoryID(subID);
        }
//filter brand
        String[] brandValues = request.getParameterValues("brand");
        int[] brands =null;
        if(brandValues!=null){
             brands = new int[brandValues.length];
    for (int i = 0; i < brandValues.length; i++) {
    brands[i] = Integer.parseInt(brandValues[i]);
}
    if(brands[0]==0){
           brands=null;
       }
        }
//        PrintWriter out = response.getWriter();
//            out.print(brandValues[2]);
       

// Giờ đây, mảng brands chứa các giá trị brand đã được chuyển đổi thành kiểu int

        // gửi sub category
        Map<Category, List<Sub_Category>> listSub = d.getSubCategoryByCategory(listCate);
        request.setAttribute("listCate", listCate);
        request.setAttribute("listSub", listSub);

        // bộ lọc
        String min_raw = request.getParameter("min");
        String max_raw = request.getParameter("max");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        if (from == null || from.isEmpty()) {
            from=null;
}

if (to == null || to.isEmpty()) {
    to=null;
}
        int min = 0, max = 10000000;
        if (min_raw != null && max_raw != null) {
            try {
                min = Integer.parseInt(min_raw);
                max = Integer.parseInt(max_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        
        SortDAO sd=new SortDAO();
        String option_raw=request.getParameter("option");
        int option=0;
        try{
            option=Integer.parseInt(option_raw);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        List<Product> filterlist=sd.sort(from, to, subID, min, max, brands, option);
        list.clear();
        list.addAll(filterlist);
        
        
        // phân trang
        int page = 1, numperpage = 9;
        int size = list.size();
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            try {
                page = Integer.parseInt(xpage);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> list1 = d.getListByPage(list, start, end);
        

        // lấy cart
         List<Product> listBuy=new ArrayList<>();
        Cookie[] arr=request.getCookies();
        String txt="";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                }
            }
        }
Cart cart=new Cart(txt);
        List<Item> listItem=cart.getItems();
        int n;
        if(listItem!=null){
            n=listItem.size();
        }else{
            n=0;
        }
        request.setAttribute("sizeCart", n);
//        Cart cart=new Cart(txt, listBuy);
//        List<Item> listItem=cart.getItems();
//        int n;
//        if(listItem!=null){
//            n=listItem.size();
//        }else 
//            n=0;
//        request.setAttribute("size", n);

        // gửi dữ liệu  
//        PrintWriter out=response.getWriter();
//        for(int i=0;i<brands.length;i++){
//            out.print(brands[i]+" ");
//        }
        request.setAttribute("option", option);
        request.setAttribute("brands", brands);
        request.setAttribute("subID", subID);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("min", min);
        request.setAttribute("max", max);
        request.setAttribute("data", list);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("list", list1);
        request.setAttribute("listBrand", listBrand);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
