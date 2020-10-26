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

    if (request.getParameter("button_login") != null) {
    	String userDB, passDB;
    	String user, pass;

    	user = request.getParameter("INusername");
    	pass = request.getParameter("INpassword");

    	String insertString = "SELECT * FROM Users WHERE Nickname = ? AND Password = ?";
    	PreparedStatement statement = con.prepareStatement(insertString);
    	statement.setString(1, user);
    	statement.setString(2, pass);

    	ResultSet r = statement.executeQuery();

    	if (r.next()) {
    		userDB = r.getString("Nickname");
    		passDB = r.getString("Password");
    		if (user.equals(userDB) && pass.equals(passDB)) {
    			session.setAttribute("acc", userDB);
    			response.sendRedirect("AuctionHome.jsp");
        	}
    	} else {
                response.sendRedirect("login.jsp");
        }

    	con.close();
	}
} catch(Exception e) {
	out.println(e);
}

%>