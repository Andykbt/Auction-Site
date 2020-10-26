<%@ include file="index.jsp" %>
<%

if (session.getAttribute("error") != null ) {
	if (session.getAttribute("error") == "noAccount") { %>	
		<div style="text-align: center;">
			<p class="error">You need to login to sell a product!</p>
		</div>
	<% } else if (session.getAttribute("error") == "noMatch") { %>
		<div style="text-align: center;">
			<p class="error">This username and password does not match our records. Please double-check and try again.</p>
		</div>
	 <% }
	 session.setAttribute("error", null);
}
%>



<div class="center" style="width: 350px; height: 300px; border-radius: 20px;">
	<div style="position: absolute; top: 0px; width: 100%; height: 50px; background-color: #BB86FC">
		<h3 style="text-align: center">Login</h3>
	</div>

	<div style="text-align: center; position: absolute; top: 75px; left: 75px;">
		<form action="processLogin.jsp" style="text-align: center;">
			<label for="username">Username: </label><br>
			<input type="text" name="INusername" id="username" placeholder="Your username"><br>

			<label for="password">Password: </label><br>
			<input type="password" name="INpassword" id="password" placeholder="Your Password"><br>

			<input type="submit" name="button_login" value="login"/>
		</form>
	</div>
</div>

<div style="text-align: center; position: relative; display: block;">
	<p>No account? Register <a href="register.jsp" style="border-radius: 5px; background-color: #BB86FC; padding: 5px; color: black"> here </a></p>
</div>

<script>
function hidePassword() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
