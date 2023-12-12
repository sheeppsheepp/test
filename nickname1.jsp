<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String Name = request.getParameter("Name");

    // String uri = "jdbc:mysql://localhost:3306/test?user=root&password=root";
    String uri = "jdbc:mysql://aws.connect.psdb.cloud/boat-test1111?sslMode=VERIFY_IDENTITY";
    // String id = "root";
    // String pwd = "root";

    Connection con = null; // 將 con 變數的定義移到外部，初始化為 null

    try {
        // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(uri,
        "0h4892kersjtfnmr0s65", 
        "pscale_pw_7lecHJ4wjcmTZEIc1xnqb44iL3pzC0AtcmyWTA69oMr");
        String sql = "INSERT INTO score (name, scores) VALUES ('Kelly', 100)";
        Statement stmt = con.createStatement();
        stmt.execute(sql);
        

        // con.setAutoCommit(false); // 設置為非自動提交

        // String sql = "SELECT * FROM test WHERE Name=?";
        // PreparedStatement psCheck = con.prepareStatement(sql);
        // psCheck.setString(1, Name);
        // ResultSet rs = psCheck.executeQuery();

        // if (rs.next()) {
        //     out.println("暱稱: " + Name + "已存在，請重新輸入。");
        // } else {
        //     sql = "INSERT INTO test VALUES(?,?)";
        //     PreparedStatement psNew = con.prepareStatement(sql);
        //     // psNew.setString(1, PKNO);
        //     psNew.setString(2, Name);
        //     psNew.execute();
        //     out.println("歡迎" + Name + "的探險");
            
        //     // con.commit(); // 提交事務
        //     rs.close();
        //     psCheck.close();
        //     psNew.close();
        //     con.close();
        
    
    } catch (Exception e) {
        // 捕獲其他異常
        e.printStackTrace();
        System.out.println("發生例外: " + e.toString() + "狀況: " + e.getMessage());
    } finally {
        // 在 finally 块中確保關閉資源
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
</html>