<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student details</title>
</head>
<body>
    <%
    int studentid=Integer.parseInt(request.getParameter("id"));
    String url="jdbc:mysql://localhost:3306/student";
    String user="root";
    String password="";
    try
    {
        class.forName("com.mysql.jdbc.driver");
        Connection con=DriverManager.getConnection(url,user,password);
        String query="SELECT * FROM students WHERE id=?";
        PreparedStatement pst=con.prepareStatement(query);
        pst.setInt(1,studentid);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
            %>
            <h2>Student Details</h2>
            <p>Name:<%=rs.getString("name")%></p>
            <p>REG NUMBER: <%= rs.getString("regno")%></p>
            <p>Department:<%=rs.getString("department")%></p>
            <%
        }
        rs.close();
        pst.close();
        con.close();
    }catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
</body>
</html>
