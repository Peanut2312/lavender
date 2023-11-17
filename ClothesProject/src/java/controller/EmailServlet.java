/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Email;
import model.Order;
import model.Order_Detail;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "EmailServlet", urlPatterns = {"/email"})
public class EmailServlet extends HttpServlet {

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
            out.println("<title>Servlet EmailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmailServlet at " + request.getContextPath() + "</h1>");
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
        String orderID_raw = request.getParameter("orderID");
        int orderID = 0;
        try {
            orderID = Integer.parseInt(orderID_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        OrderDAO od = new OrderDAO();
        Order o = od.getOrderByOrderID(orderID);
        List<Order_Detail> list = od.getDetailOrderByDetaiOrderID(orderID);
        request.setAttribute("order", o);
        request.setAttribute("list", list);
                String email = o.getAccount().getEmail();

        Email e = new Email();
        e.sendEmail(email, "<!DOCTYPE html>\n"
                + "<html>\n"
                + "    <head>\n"
                + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                + "        <title>Lavender</title>\n"
                + "        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css\">\n"
                + "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js\"></script>\n"
                + "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n"
                + "<link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.8.1/css/all.css\">\n"
                + "\n"
                + "         <link href=\"img/flower.png\" rel=\"icon\" type=\"image/x-icon\">\n"
                + "         <style>\n"
                + "                 .body-main {\n"
                + "        background: #ffffff;\n"
                + "        border-bottom: 15px solid #1E1F23;\n"
                + "        border-top: 15px solid #1E1F23;\n"
                + "        margin-top: 30px;\n"
                + "        margin-bottom: 30px;\n"
                + "        padding: 40px 30px !important;\n"
                + "        position: relative ;\n"
                + "        box-shadow: 0 1px 21px #808080;\n"
                + "        font-size:10px;\n"
                + "        \n"
                + "        \n"
                + "        \n"
                + "    }\n"
                + "\n"
                + "    .main thead {\n"
                + "		background: #1E1F23;\n"
                + "        color: #fff;\n"
                + "		}\n"
                + "    .img{\n"
                + "        height: 100px;}\n"
                + "    h1{\n"
                + "       text-align: center;\n"
                + "    }\n"
                + "\n"
                + "         </style>\n"
                + "    </head>\n"
                + "    <body>\n"
                + "       <div class=\"container\">\n"
                + "\n"
                + "\n"
                + "\n"
                + "\n"
                + "<div class=\"container\">\n"
                + "    <div class=\"row\">\n"
                + "        <div class=\"col-md-6 col-md-offset-3 body-main\">\n"
                + "            <div class=\"col-md-12\">\n"
                + "               <div class=\"row\">\n"
                + "                    <div class=\"col-md-4\">\n"
                + "                        <a href=\"order\"><img class=\"img\" alt=\"Invoce Template\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/362177773_1046104096571116_8908662849704474030_n.png?_nc_cat=109&ccb=1-7&_nc_sid=ae9488&_nc_ohc=Dio3L-lvFmYAX-VV1hH&_nc_oc=AQlQ-wuAF-Nsr1bNTwoh3drc2zxdbaYf0bToqyZ77kArBW2o6S7lRfG0ohfUi7htEb8&_nc_ht=scontent.fhan3-5.fna&oh=03_AdRMU1bbsd-13GcfYXCLiXeSq46yHq_QVZ1HDK19hpcOOA&oe=64E0A356&_nc_fr=fhan3c05\"/></a>  \n"
                + "                    </div>\n"
                + "                    <div class=\"col-md-8 text-right\">\n"
                + "                        <h4 style=\"color: #F81D2D;\"><strong>Lavender</strong></h4>\n"
                + "                        <p>Hai Duong city </p>\n"
                + "                        <p>0354888209</p>\n"
                + "                        <p>odaycobanmoithu@gmail.com</p>\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "                <br />\n"
                + "                <div class=\"row\">\n"
                + "                    <div class=\"col-md-12 text-center\">\n"
                + "                        <h2>Order</h2>\n"
                + "                        <h5>#" + o.getOrderID() + "</h5>\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "                <br />\n"
                + "                <div>\n"
                + "                    <table class=\"table\">\n"
                + "                        \n"
                + "                        <tbody>\n"
                + "                         \n"
                + "                           \n"
                + "                            <tr style=\"color: #F81D2D;\">\n"
                + "                                <td class=\"text-right\"><h4><strong>Total:</strong></h4></td>\n"
                + "                                <td class=\"text-left\"><h4><strong> " + o.getBill() + " </strong></h4></td>\n"
                + "                            </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "                </div>\n"
                + "                <div>\n"
                + "                    <div class=\"col-md-12\">\n"
                + "                        <p><b>Date :</b> " + o.getDate() + "</p>\n"
                + "                        <p><b>Address :</b> " + o.getAddress() + "</p>\n"
                + "                        <p><b>Phone :</b> " + o.getAccount().getPhone() + "</p>\n"
                + "                        <p><b>Name :</b> " + o.getAccount().getFirstname() + "</p>\n"
                + "                        <p><b>Note :</b> " + o.getNote() + "</p>\n"
                + "<h1>Thank you for your shoping</h1>"
                + "                        <br />\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</div>\n"
                + "</div>\n"
                + "\n"
                + "    </body>\n"
                + "</html>");
        request.getRequestDispatcher("orderDetail.jsp").forward(request, response);

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
        processRequest(request, response);
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
