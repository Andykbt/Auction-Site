<%@ include file="index.jsp" %>
<%@	page import = "java.sql.*"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="center" style="width:1175px; border-radius: 25px; padding:10px;">
	<table id="productTable">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
			<th>Vendor</th>
			<th>Starting Time</th>
			<th>Closing Time</th>
		</tr>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction", "root", "");

		String query = "SELECT * FROM ITEMS";
		PreparedStatement statement = con.prepareStatement(query);

		ResultSet r = statement.executeQuery();

		while (r.next()) {
			%> <tr>
				<td class="rowID"><%= r.getInt("itemID") %></td>
				<td class="rowName"><%= r.getString("itemName") %></td>
				<td><%= r.getString("itemDescription") %></td>
				<td><%= r.getString("vendor") %></td>
				<td><%= r.getDate("startingTime") %></td>
				<td><%= r.getDate("closingTime") %></td>
				<td> <form action="makeBid.jsp" style="margin: 0;"> <button type="submit" name="makeBid" class="makeBid">Make bid</button> </form>
			</tr>
			<%
		}

		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	</table>
</div>

<%!
public String getHighestBid(int id){
	Double highestBid = 0.00;

	try {
		Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction", "root", "");
		String query = "SELECT Price FROM Bid WHERE itemID = ? ORDER BY `price` DESC LIMIT 1";
		PreparedStatement statement = con.prepareStatement(query);

		statement.setString(1, Integer.toString(id));

		ResultSet r = statement.executeQuery();
	
		while (r.next()) {
			highestBid = r.getDouble("Price");
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	String s = Double.toString(highestBid);
	return s;
}
%>

<script>
$(".makeBid").click(function() {
    var $row = $(this).closest("tr");
    var $text = $row.find(".rowName").text();
    var $id = $row.find(".rowID").text();
    $(".bidDetails").html("Make a bid for: " + $text);
    $(".bidItemID").val($id);
    $(".makeBid").val($id);
    console.log($id);
    
    $.ajax({
            url: 'data.php',
            type: "POST",
            data: {val : test },
            dataType: 'json',
            success: function (data) {
                console.log(data);

            }
        });
});
</script>
