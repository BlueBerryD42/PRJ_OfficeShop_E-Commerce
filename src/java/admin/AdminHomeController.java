package admin;

import dao.AccountDAO;
import dao.CategoryDAO;
import dao.ItemDAO;
import dao.OrderDAO;
import java.io.IOException;
import java.security.DigestException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.Item;
import model.Order;

/**
 * AdminHomeController handles the logic to display the admin dashboard.
 * It retrieves data from the database and forwards it to the admin page.
 */
public class AdminHomeController extends HttpServlet {
    
    private static final String ADMIN_PAGE = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws DigestException, IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            // Get session object
            HttpSession session = request.getSession();
            
            // Fetch data for categories, items, accounts, and orders
            Map<Integer, String> listCategories = new CategoryDAO().getCategories();
            List<Item> listItems = new ItemDAO().getAllItems();
            List<Account> listAccounts = new AccountDAO().getAccounts();
            List<Order> listOrders = new OrderDAO().getAllOrders();
            
            // Store data in session for persistence across requests
            session.setAttribute("listCategories", listCategories);
            session.setAttribute("listItems", listItems);
            session.setAttribute("listAccounts", listAccounts);
            session.setAttribute("listOrders", listOrders);
            
            // Set the destination page to the dashboard
            request.setAttribute("destPage", "dashboard");
        } catch (Exception e) {
            // Log exception with stack trace for better debugging
            log("Error at AdminHomeController: ", e);
        } finally {
            // Forward request to the admin page
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // Handles the HTTP GET method
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DigestException ex) {
            Logger.getLogger(AdminHomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Handles the HTTP POST method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DigestException ex) {
            Logger.getLogger(AdminHomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Returns a short description of the servlet
    @Override
    public String getServletInfo() {
        return "Handles requests to display the admin dashboard and related data.";
    }
}
