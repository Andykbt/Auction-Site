<%@ page import = "java.sql.*" %>

<%
if (session.getAttribute("acc") != null) {
	response.sendRedirect("AuctionHome.jsp");
}
%>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction", "root", "");
    

    String name, description, vendor, startingDate, closingDate;
    name = request.getParameter("INProductName");
    description = request.getParameter("INProductDesc");
    vendor = request.getParameter("INVendor");
    startingDate = request.getParameter("startingDate");
    closingDate = request.getParameter("closingDate");

    String insertString = "INSERT INTO `ITEMS`(`itemName`, `itemDescription`, `vendor`, `startingTime`, `closingTime`) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement statement = con.prepareStatement(insertString);

    statement.setString(1, name);
    statement.setString(2, description);
    statement.setString(3, vendor);
    statement.setString(4, startingDate);
    statement.setString(5, closingDate);
    statement.executeUpdate();

    con.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>