<%@ page import="java.sql.*" %>

<%
response.sendRedirect("AuctionHome.jsp");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction", "root", "");

    String userBid, itemID, nickname;
    itemID = request.getParameter("itemID");
    userBid = request.getParameter("userBid");
    nickname = (String)session.getAttribute("acc");

    String insertString = "INSERT INTO Bid(itemID, Price, Nickname) values(?,?,?)";
    PreparedStatement statement = con.prepareStatement(insertString);

    statement.setString(1, itemID);
    statement.setString(2, userBid);
    statement.setString(3, nickname);
    statement.executeUpdate();

    con.close();
} catch (Exception e) {
	e.printStackTrace();
}

return;
%>