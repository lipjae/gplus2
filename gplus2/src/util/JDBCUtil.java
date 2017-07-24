package util;
import java.sql.*;

public class JDBCUtil {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://211.34.105.33:3306/gplus2";
            System.out.println("===> JDBC Connection 성공 ===");
            return DriverManager.getConnection(url,"gplus2","gplus2_123!@#");
        } catch (Exception e) {
        	 System.out.println("===> JDBC Connection 실패  ===");
            e.printStackTrace();
            
        }
        return null;
    }

    public static void close(PreparedStatement stmt, Connection conn) {
        if(stmt != null) {                    
            try {
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                stmt = null;
            }
        }
        
        if(conn != null) {                    
            try {
            	conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                conn = null;
            }
        }
    }
    
    public static void close(Statement stmt, Connection conn) {
        if(stmt != null) {                    
            try {
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                stmt = null;
            }
        }
        
        if(conn != null) {                    
            try {
            	conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                conn = null;
            }
        }
    }
    
    public static void close(ResultSet rs, PreparedStatement stmt) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(stmt != null) {                    
            try {
            	stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	stmt = null;
            }
        }
    }
    
    public static void close(ResultSet rs, Statement stmt) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(stmt != null) {                    
            try {
            	stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	stmt = null;
            }
        }
    }
    
    public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(stmt != null) {                    
            try {
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                stmt = null;
            }
        }
        
        if(conn != null) {                    
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                conn = null;
            }
        }
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(stmt != null) {                    
            try {
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                stmt = null;
            }
        }
        
        if(conn != null) {                    
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                conn = null;
            }
        }
    }    
    
} // class
