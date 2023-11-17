/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Pham Thang
 */
public class Email {
//    gpzweioljojetkbd
//    phamquangthangadc@gmail.com

    static final String from = "phamquangthangadc@gmail.com";
    static final String password = "gpzweioljojetkbd";

    public static boolean sendEmail(String to, String noiDung) {

        //Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP host
        props.put("mail.smtp.port", "587");  // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
            }

        };
        //Phiên làm việc
        Session session = Session.getInstance(props, auth);
        // Gửi email
        // Tạo 1 tin nhắn
        MimeMessage msg = new MimeMessage(session);
        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            // người gửi
            msg.setFrom(from);

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            // tiêu đề email
            msg.setSubject("Lavender Shop"+System.currentTimeMillis());
            // Quy định ngảy gửi
            msg.setSentDate(new Date());
            // Quy định email nhận phản hồi
            // nội dung
            msg.setContent(noiDung, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        Email.sendEmail("phamquangthangad@gmail.com", "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "   \n"
                + "    <body>\n"
                + "        <p>&hearts;</p>\n"
                + "        <p>&hearts;</p>\n"
                + "         <p>&hearts;</p>\n"
                + "         <p>&hearts;</p>\n"
                + "         <p>&hearts;</p> "
                + "<img src=\"https://memehay.com/meme/20211011/meo-cam-bong-hoa-tren-tay-manh-me-len.jpg\" alt=\"\">\n"
                + "    </body>\n"
                + "</html>");

    }
}
