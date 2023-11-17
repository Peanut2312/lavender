package controller;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.GooglePojo;
import model.GoogleUtils;
import dal.AccountDAO;
import jakarta.servlet.http.HttpSession;
import model.Account;
@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {
   
  private static final long serialVersionUID = 1L;
  public LoginGoogleServlet() {
    super();
  }
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String code = request.getParameter("code");
    if (code == null || code.isEmpty()) {
      RequestDispatcher dis = request.getRequestDispatcher("logintest.jsp");
      dis.forward(request, response);
    } else {
      String accessToken = GoogleUtils.getToken(code);
      GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
      AccountDAO ad=new AccountDAO();
      if(ad.checkAccountExist(googlePojo.getEmail())==null){
          ad.signup(googlePojo.getEmail(), googlePojo.getId(),googlePojo.getEmail(),googlePojo.getGiven_name() , googlePojo.getFamily_name());
          Account a=ad.login(googlePojo.getEmail(), googlePojo.getId());
           HttpSession session=request.getSession();
           session.setAttribute("account", a);
            response.sendRedirect("home");
      }else{
           Account a=ad.login(googlePojo.getEmail(), googlePojo.getId());
           HttpSession session=request.getSession();
           session.setAttribute("account", a);
            response.sendRedirect("home");
      }
    }
  }
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
  
}
