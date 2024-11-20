package dao;


import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Item;

/**
 *
 * @author ASUS
 */
public class ItemDAO {

    private static final String GETITEMS = "SELECT pid, pName, price, imgPath, description, "
            + "status, cateId FROM Item WHERE pid = ?";
    private static final String GET_ALL_ITEMS = "SELECT pid, pName, price, imgPath, "
            + "description, status, cateId FROM Item";
    private static final String GET_TOP_4_ITEMS = "SELECT TOP(4) pid, pName, price, "
            + "imgPath, description, status, cateId FROM Item ORDER BY pid";
    private static final String GET_NEXT_4_ITEMS = "SELECT pid, pName, price, "
            + "imgPath, description, status, cateId \n"
            + "FROM Item ORDER BY pid OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
    private static final String GET_TOP_4_ITEMS_BY_CATEGORY = "SELECT TOP(4) pid, "
            + "pName, price, imgPath, description, status, cateId FROM Item WHERE cateId = ? ORDER BY pid";
    private static final String GET_ALL_ITEMS_WITH_PAGING = "SELECT pid, pName, price, imgPath, description, status, cateId \n"
            + "FROM Item ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
    private static final String GET_TOTAL_ITEMS = "SELECT COUNT(pid) AS total FROM Item";
    private static final String GET_ITEMS_BY_CATEGORY_WITH_PAGGING = "SELECT pId, pName, "
            + "price, imgPath, description, status, cateId FROM Item WHERE cateId = ? ORDER BY pId ASC "
            + "OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
    private static final String GET_TOTAL_ITEMS_BY_CATEGORY = "SELECT COUNT(pId) AS total FROM Item WHERE cateId = ?";
    private static final String UPDATE_ITEMS_INFO = "UPDATE Item SET pName = ? , price = ? , imgPath = ?\n"
            + "      , description = ?, status = ?, cateId = ? WHERE pId = ?";
    private static final String INSERT_NEW_ITEMS = "INSERT INTO Item (pName, price, imgPath, description, status, cateId) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_LIST_TOP_ITEMS_RANDOM = "SELECT TOP(?) * FROM Item WHERE cateId = ? ORDER BY NEWID()";
    private static final String GET_RANDOM_N_ITEMS = "SELECT TOP(?) * FROM Item ORDER BY NEWID()";
    
    public List<Item> getRandomNItems(int quantity) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_RANDOM_N_ITEMS);
                psm.setInt(1, quantity);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("cateId");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public List<Item> getListTopItemsRandom(int top, int cateId) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_LIST_TOP_ITEMS_RANDOM);
                psm.setInt(1, top);
                psm.setInt(2, cateId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public boolean insertNewItems(String name, String imgPath, int price, String description, int status, int cateId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(INSERT_NEW_ITEMS);
                psm.setString(1, name);
                psm.setInt(2, price);
                psm.setString(3, imgPath);
                psm.setString(4, description);
                psm.setInt(5, status);
                psm.setInt(6, cateId);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateItemsInfo(int pid, String name, String imgPath, int price, String description, int status, int cateId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_ITEMS_INFO);
                psm.setString(1, name);
                psm.setInt(2, price);
                psm.setString(3, imgPath);
                psm.setString(4, description);
                psm.setInt(5, status);
                psm.setInt(6, cateId);
                psm.setInt(7, pid);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getTotalItemsByCategory(int category) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOTAL_ITEMS_BY_CATEGORY);
                psm.setInt(1, category);
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return total;
    }

    public List<Item> getItemsByCategoryWithPagging(int category, int page, int PAGE_SIZE) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ITEMS_BY_CATEGORY_WITH_PAGGING);
                psm.setInt(1, category);
                psm.setInt(2, page);
                psm.setInt(3, PAGE_SIZE);
                psm.setInt(4, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("cateId");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getTotalItems() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOTAL_ITEMS);
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return total;
    }

    public List<Item> getAllItemsWithPaging(int page, int PAGE_SIZE) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_ITEMS_WITH_PAGING);
                psm.setInt(1, page);
                psm.setInt(2, PAGE_SIZE);
                psm.setInt(3, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getTotalItemsFromSearchKeyword(String keyword, String searchby) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getItems = "SELECT COUNT(pid) AS total\n"
                    + "FROM Items P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getItems += "WHERE pName LIKE ?";
                } else {
                    getItems= "WHERE cateName LIKE ?";
                }
                psm = conn.prepareStatement(getItems);
                psm.setString(1, "%" + keyword + "%");
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return total;
    }

    public List<Item> getSearchItemsWithPaging(String keyword, String searchby, int page, int PAGE_SIZE) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getItems = "SELECT pid, pName, price, imgPath, description, status, P.cateId \n"
                    + "FROM Item P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getItems += "WHERE pName LIKE ? ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
                } else {
                    getItems += "WHERE cateName LIKE ? ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
                }
                psm = conn.prepareStatement(getItems);
                psm.setString(1, "%" + keyword + "%");
                psm.setInt(2, page);
                psm.setInt(3, PAGE_SIZE);
                psm.setInt(4, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Item> getTop4ItemsByCateId(int cateId) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOP_4_ITEMS_BY_CATEGORY);
                psm.setInt(1, cateId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Item> getNext4Items(int amount) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_NEXT_4_ITEMS);
                psm.setInt(1, amount);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Item> getTop4Items() throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOP_4_ITEMS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public Item getItems(int pid) throws SQLException {
        Item item = null;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GETITEMS);
                psm.setInt(1, pid);
                rs = psm.executeQuery();
                if (rs.next()) {
                    item = new Item(rs.getInt("PID"), rs.getString("PName"),
                            rs.getInt("price"), rs.getString("imgPath"),
                            rs.getString("description"), rs.getInt("status"),
                            rs.getInt("CateID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return item;
    }

    public List<Item> getItems(String keyword, String searchby) throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getItems = "SELECT pid, pName, price, imgPath, description, status, P.cateId \n"
                    + "FROM Item P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getItems += "WHERE pName like ?";
                } else {
                    getItems += "WHERE cateName like ?";
                }
                psm = conn.prepareStatement(getItems);
                psm.setString(1, "%" + keyword + "%");
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Item> getAllItems() throws SQLException {
        List<Item> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_ITEMS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Item item = new Item(id, fullName, price, imgPath, description, status, cateId);
                        list.add(item);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

}
