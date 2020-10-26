<%@ page import="java.sql.*" %>

<%
if (session.getAttribute("acc") != null) {
    response.sendRedirect("AuctionHome.jsp");
}

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction", "root", "");

    String nickName, name, telephoneNumber, mobileNumber, email, address, password;

    nickName = request.getParameter("INusername");
    name = request.getParameter("INname");
    telephoneNumber = request.getParameter("INtelephone");
    mobileNumber = request.getParameter("INmobile");
    email = request.getParameter("INemail");
    address = request.getParameter("INaddress");
    password = request.getParameter("INpassword");

    String insertString = "insert into Users(Nickname, Name, TelephoneNumber, MobileNumber, Email, Address, Password) values(?,?,?,?,?,?,?)";
    PreparedStatement statement = con.prepareStatement(insertString);
    statement.setString(1, nickName);
    statement.setString(2, name);
    statement.setString(3, telephoneNumber);
    statement.setString(4, mobileNumber);
    statement.setString(5, email);
    statement.setString(6, address);
    statement.setString(7, password);

    statement.executeUpdate();

    con.close();
    response.sendRedirect("AuctionHome.jsp");
} catch (Exception e) {
    e.printStackTrace();
    session.setAttribute("error", "usedNickname");
    response.sendRedirect("register.jsp");
}


%>