/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="ChangePassServlet", urlPatterns={"/changePass"})
public class ChangePassServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ChangePassServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassServlet at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("changePass.jsp").forward(request, response);
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
        AccountDAO ad=new AccountDAO();
        String user=request.getParameter("user");
        String oldpass=request.getParameter("oldpass");
        String newpass=request.getParameter("newpass");
        String repass=request.getParameter("repass");
        Account a =ad.login(user, oldpass);
        String accountID_raw=request.getParameter("accountID");
        int accountID=0;
        String notice="";
        try{
            accountID=Integer.parseInt(accountID_raw);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        if(a==null){
           notice="Old password is incorrect";
            request.setAttribute("notice", notice);
            request.setAttribute("color", "red");
            request.getRequestDispatcher("changePass.jsp").forward(request, response);
        }else{
            if(!newpass.equals(repass)) {
                request.setAttribute("notice", "Re-Password is not same to New Password");
                request.setAttribute("color", "red");
            request.getRequestDispatcher("changePass.jsp").forward(request, response);
            }else{
                Account ac=ad.getAccountByAccountID(accountID);
                 notice=ad.changePass(newpass, accountID);
              request.setAttribute("notice", notice);
              HttpSession session=request.getSession();
              session.setAttribute("account", ac);
              request.setAttribute("color", "#0d6efd");
            request.getRequestDispatcher("changePass.jsp").forward(request, response);
            }
              
        }
        
        
      
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
