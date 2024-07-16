/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Web.login;

import ClothesOnlineShop.DAO.AdminDAO;
import ClothesOnlineShop.DAO.UserDAO;
import ClothesOnlineShop.Model.AdminDTO;
import ClothesOnlineShop.Model.Constants;
import ClothesOnlineShop.Model.UserDTO;
import ClothesOnlineShop.Model.UserGoogleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 *
 * @author buitr
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code != null) {
            String accessToken = getToken(code);
            UserGoogleDTO user = getUserInfo(accessToken);
            if (user != null) {
                HttpSession session = request.getSession(true);
                // Assuming you have a method to convert UserGoogleDTO to UserDTO
                UserDTO userDTO = convertGoogleUserToUserDTO(user);
                session.setAttribute("usersession", userDTO);
                response.sendRedirect("DispatchServlet");
            } else {
                response.sendRedirect("login.jsp?error=User information could not be retrieved");
            }
        } else {
            // Normal login flow with email and password
            doPost(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        if (jobj.has("error")) {
            throw new ClientProtocolException("Error in getting Google token: " + jobj.get("error").getAsString());
        }

        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);
        return googlePojo;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO DAO = new UserDAO();
        UserDTO user = DAO.login(email, password);
        AdminDAO adminDAO = new AdminDAO();
        AdminDTO admin = adminDAO.login(email, password);
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("usersession", user);
            response.sendRedirect("DispatchServlet");
        } else if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("adminsession", admin);
            response.sendRedirect("AdminServlet");
        } else {
            request.setAttribute("msg", "Wrong user or password! Please Try again");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/web/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private UserDTO convertGoogleUserToUserDTO(UserGoogleDTO googleUser) {
        UserDTO userDTO = new UserDTO();
        userDTO.setEmail(googleUser.getEmail());
        userDTO.setFirstName(googleUser.getGiven_name());
        userDTO.setLastName(googleUser.getFamily_name());
        return userDTO;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
