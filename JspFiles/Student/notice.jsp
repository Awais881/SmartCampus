<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<html>
<head>
    <title>Student Panel</title>
  
    <style>
        body {
            font-family: 'Arial', sans-serif;
            /* background-color: #f9f9f9; */
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            /* background-color: #fff; */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        h2{
  background-color: #00c78e;
    padding: 10px;
    color: white;
}

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Notices</h2>
        <table>
            <tr>
           
                <th>Tittle</th>
                <th>Content</th>
                <th>Date</th>
            </tr>
            <% 
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
                    Statement stmt = con.createStatement();
                    String query = "SELECT * FROM notices";
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        String title = rs.getString("title");
                        String content = rs.getString("content");
                        String date = rs.getString("date");

                        out.println("<tr>");

                        out.println("<td>" + title + "</td>");
                        out.println("<td>" + content + "</td>");
                        out.println("<td>" + date + "</td>");
                        out.println("</tr>");
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                }
            %>
        </table>
    </div>
</body>
</html>
