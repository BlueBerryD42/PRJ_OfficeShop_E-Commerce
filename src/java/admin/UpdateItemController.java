package admin;


import dao.ItemDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class UpdateItemController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            if (action != null) {
                String name = request.getParameter("name");
                String imgPath = request.getParameter("imgPath");
                int price = Integer.parseInt(request.getParameter("price"));
                String description = request.getParameter("description");
                int status = Integer.parseInt(request.getParameter("status"));
                int cateId = Integer.parseInt(request.getParameter("cateId"));
                switch (action) {
                    case "updateItem":
                        int pid = Integer.parseInt(request.getParameter("pid"));
                        boolean check1 = new ItemDAO().updateItemsInfo(pid, name, imgPath, price, description, status, cateId);
                        if (check1) {
                            request.setAttribute("MSG_SUCCESS", "You have successfully updated the item information!");
                        } else {
                            request.setAttribute("MSG_ERROR", "You have failed to update item information!");
                        }
                        break;
                    case "createItem":
                        boolean check2 = new ItemDAO().insertNewItems(name, imgPath, price, description, status, cateId);
                        if (check2) {
                            request.setAttribute("MSG_SUCCESS", "You have successfully created new item!");
                        } else {
                            request.setAttribute("MSG_ERROR", "You have failed to create new item!");
                        }
                        break;
                }
            } else {
                request.setAttribute("MSG_ERROR", "Oops, something went wrong! Try later!");
            }
        } catch (Exception e) {
            log("Error at UpdateItemController: " + e.toString());
        } finally {
            request.getRequestDispatcher("AdminManageItemController").forward(request, response);
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
