<link href="styles.css" rel="stylesheet" type="text/css">

<div class="header" style="margin: auto; height: 100px; display:inline-block;">
	
	<div style="position: absolute; top: 10px; left: 10px;; display: inline-block;"><h1>Auction</h1></div>

	<div style="display:inline-block; position: absolute; top: 15px; right: 500px;">
		<div class='navBlock'> <a href='AuctionHome.jsp'>Home</a> </div>
		<div class='navBlock'> <a href='Sell.jsp'>Sell</a> </div>
		<div class='navBlock'><p>Current Date: <span id="datetime"></span></p></div>

	</div>
	<div style="display: inline-block; position: absolute; top: 35px; right: 10px;">
		

		<% if (session.getAttribute("acc") == null) {
				out.print("<div class='navBlock'> <a href='login.jsp'>Login</a> </div>");
				out.print("<div class='navBlock'> <a href='register.jsp'>Register</a> </div>");
			} else {
				out.print("<div class='navBlock'>" + session.getAttribute("acc") + "</div>");

				out.print("<div class='navBlock'> <a href='logout.jsp'>Logout</a> </div>");
			} %>

	</div>

</div>

<script>
var dt = new Date();
document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
</script>