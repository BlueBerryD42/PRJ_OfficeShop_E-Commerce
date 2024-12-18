package controller;


import dao.BlogDAO;
import dao.CategoryDAO;
import dao.ItemDAO;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Blog;
import model.Item;

/**
 *
 * @author ASUS
 */
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession sessison = request.getSession();
            
            // Our Product Session
            List<Item> listItems = new ItemDAO().getTop4Items();
            request.setAttribute("listItems", listItems);
            
            // Best Seller Session
            Map<Integer, String> listCategories = new CategoryDAO().getCategories();
            List<Item> listBestSellerItems = new ItemDAO().getTop4ItemsByCateId((int) listCategories.keySet().toArray()[0]);
            sessison.setAttribute("listCategories", listCategories);
            request.setAttribute("listBestSellers", listBestSellerItems);
            
            // Latest Blog Session
            List<Blog> listBlogs = new BlogDAO().getRandomNLatestBlogs(3);
            request.setAttribute("listBlogs", listBlogs);
            
            HttpSession session = request.getSession();
            session.setAttribute("urlHistory", "HomeController");
            session.setAttribute("destPage", "home");
        } catch (Exception e) {
            log("Error at HomeController: " + e.toString());
        } finally {
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
        processRequest(request, response);
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
