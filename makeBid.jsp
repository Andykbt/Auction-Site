<%@ include file="index.jsp" %>
<%@ page import = "java.sql.*" %>
<%@	page import = "java.util.Date" %>
<%@	page import = "java.text.SimpleDateFormat" %>


<%
	if (session.getAttribute("acc") == null) {
    	session.setAttribute("error", "noAccount");
		response.sendRedirect("login.jsp");
	}
%>

<div class="center" style="height: 250px; width: 250px; text-align: center; border-radius: 25px;">
<%
	Double highestBid = 0.00;
	int id = Integer.parseInt(request.getParameter("makeBid"));
	String itemName = "";
	String sDate = "";
	String cDate = "";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction", "root", "");	

		String query = "SELECT itemName, startingTime, closingTime FROM ITEMS where itemID = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, Integer.toString(id));
		ResultSet r = statement.executeQuery();

		r.next();
		itemName = r.getString("itemName");
		sDate = r.getString("startingTime");
		cDate = r.getString("closingTime");

		query = "SELECT Price FROM Bid RIGHT JOIN ITEMS ON Bid.itemID = ITEMS.itemID where Bid.itemID = ? ORDER BY `price` DESC LIMIT 1";
		statement = con.prepareStatement(query);
		statement.setString(1, Integer.toString(id));
		r = statement.executeQuery();

		r.next();
		highestBid = r.getDouble("price");
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	Double minUserBid = highestBid + 1;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date currentDate = new Date();
	Date startingD, closingD;

	startingD = format.parse(sDate);
	closingD = format.parse(cDate);

	if (currentDate.compareTo(startingD) == 1 && currentDate.compareTo(closingD) == -1) {
		out.print("<h2 style='text-align: center;'>Make a bid for " + itemName + "</h2>");
		out.print("<div> <span>Current highest bid: </span>" + highestBid + "</div>");

		%><br>
		<form action="processBid.jsp" onsubmit="validateInput()">
			<input type="text" value="<%=id%>" style="display:none;" name="itemID">

			<span><label for="userBid" style="text-align:left;">Your bid:</label>
				<input type="number" style="width: 120px;" min="<%= minUserBid %>" name="userBid" id="userBid" value="<%=minUserBid%>" step="any">
			</span>
			<input type="submit" value="Make Bid" onClick="changeText(); return false;">
		</form>
	<%} else { %>
		<h1 style="padding-top: 35px;">This item is not available for bids</h1>
	<%}
%>
</div>

<script>
	function validateInput() {
		var num = document.getElementById("userBid").value;
		document.getElementById("userBid").value = (Math.round(num * 100) / 100).toFixed(2);
	}
</script>
