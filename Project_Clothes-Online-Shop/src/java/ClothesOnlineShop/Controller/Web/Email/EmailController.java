package ClothesOnlineShop.Controller.Web.Email;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmailController")
public class EmailController extends HttpServlet {

    private final String eFrom = "tribtse183703@fpt.edu.vn";
    private final String ePass = "lodh asak gvds yrtw";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String to = request.getParameter("email");
        System.out.println("Email recipient: " + to); // Kiểm tra giá trị to có hợp lệ hay không

        if (to == null || to.isEmpty()) {
            response.getWriter().write("Invalid email address"); // Xử lý khi không có địa chỉ email
            return;
        }
        String subject = "Chào mừng bạn đã đến với Clothes Shop";
        String message = "Cảm ơn bạn đã đăng ký nhận thông tin mới nhất từ chúng tôi.";
        try {
            sendEmail(subject, message, to);
            response.sendRedirect("DispatchServlet");
        } catch (Exception e) {
            response.getWriter().write("Failed to send email: " + e.getMessage());
            e.printStackTrace(); // In ra lỗi ra console
            throw new ServletException("Error in sending email", e); // Ném lại exception để Servlet container xử lý
        }
    }

    public void sendEmail(String subject, String message, String to) throws Exception {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587"); // Corrected port for TLS
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator au = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(eFrom, ePass);
            }
        };

        Session session = Session.getInstance(props, au);

        MimeMessage msg = new MimeMessage(session);
        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
        msg.setFrom(new InternetAddress(eFrom));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        msg.setSubject(subject, "UTF-8");

        String htmlContent = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<style>"
                + "body { font-family: Arial, sans-serif; }"
                + ".container { max-width: 600px; margin: 0 auto; padding: 20px; text-align: center; border: 1px solid #ddd; background-color: #fff; }"
                + ".header { background-color: #f4f4f4; padding: 10px 0; }"
                + ".header h2 { margin: 0; color: #333; }"
                + ".content { padding: 20px 0; }"
                + ".footer { background-color: #f4f4f4; padding: 10px 0; font-size: 12px; color: #888; }"
                + ".footer a { color: #555; text-decoration: none; }"
                + "</style>"
                + "</head>"
                + "<body>"
                + "<div class=\"container\">"
                + "  <div class=\"header\">"
                + "    <h2>ClothesShop</h2>"
                + "  </div>"
                + "  <div class=\"content\">"
                + "    <h2>CHÀO MỪNG BẠN ĐÃ ĐẾN VỚI 3CONNGUOI SHOP</h2>"
                + "    <p>Hello,</p>"
                + "    <p>Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ, chính sách mua hàng của chúng tôi.<br>"
                + "    Bạn sẽ là một trong những người được nhận thông báo SALE, NEW PRODUCT sớm nhất.<br>"
                + "    Nếu bạn cần hỗ trợ hãy liên hệ hotline: 0372899192.<br>"
                + "    Xin cảm ơn.</p>"
                + "  </div>"
                + "  <div class=\"footer\">"
                + "    <p>3Connguoi Shop Ho Chi Minh - 0372899192 - <a href=\"mailto:3conguoishop@gmail.com\">clothesshop@gmail.com</a></p>"
                + "  </div>"
                + "</div>"
                + "</body>"
                + "</html>";

        msg.setContent(htmlContent, "text/html; charset=UTF-8");

        Transport.send(msg);
        System.out.println("Sent message successfully....");
    }
// Test send email
    public static void main(String[] args) {
        EmailController emailController = new EmailController();

        String to = "ddao8066@gmail.com"; // Thay đổi địa chỉ email của bạn cần test

        String subject = "Chào mừng bạn đã đến với Clothes Shop";
        String message = "Cảm ơn bạn đã đăng ký nhận thông tin mới nhất từ chúng tôi.";

        try {
            emailController.sendEmail(subject, message, to);
            System.out.println("Email sent successfully to: " + to);
        } catch (MessagingException e) {
            System.out.println("Failed to send email: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Failed to send email: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
