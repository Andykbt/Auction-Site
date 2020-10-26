<%@ include file="index.jsp" %>

<title>Register</title> 

<% if (session.getAttribute("error") == "usedNickname") {
	out.print("<div style='text-align:center'><p style='color: red;'>This username is already taken.</p></div>");
	session.setAttribute("error", null);
} %>

<div class="center" style="width: 250px; height: 655px; border-radius: 20px; top: 55%;">
	<div style="position: absolute; top: 0px; width: 100%; height: 50px; background-color: #BB86FC">
		<h3 style="text-align: center">Register</h3>
	</div>

	<div style="position: absolute; top: 55px;">
		<form action="processRegistration.jsp" style="text-align: left; padding-left: 25px;" onsubmit="return validateForm(this)">
			<label for="username">Username: </label><br>
			<input type="text" name="INusername" id="username" placeholder="Your username"><br>

			<label for="password">Password: </label><br>
			<input type="password" name="INpassword" id="password" placeholder="Your password"><br>

			<label for="name">Name: </label><br>
			<input type="text" name="INname" id="name" placeholder="Your name"><br>

			<label for="telephone">Telephone Number: </label><br>
			<input type="text" name="INtelephone" id="telephone" placeholder="Your telephone number"><br>

			<label for="mobile">Mobile: </label><br>
			<input type="text" name="INmobile" id="mobile" placeholder="Your mobile number"><br>

			<label for="email">Email: </label><br>
			<input type="text" name="INemail" id="email" placeholder="Your email address"><br>

			<label for="address">Address: </label><br>
			<input type="text" name="INaddress" id="address" placeholder="Your address"><br>

			<input type="submit" name="button_register" value="register"/>
		</form>
	</div>
</div>

<script>
function validateForm(theForm) {
	var valid = true;

	if (!theForm.username.value.length) {
		valid = false;
		theForm.username.style.border = "1px solid #ff0000";
	}

	if (!theForm.password.value.length) {
		valid = false;	
		theForm.password.style.border = "1px solid #ff0000";
	}

	if (!theForm.name.value.length) {
		valid = false;
		theForm.name.style.border = "1px solid #ff0000";
	}

	if (!theForm.telephone.value.length) {
		valid = false;	
		theForm.telephone.style.border = "1px solid #ff0000";
	}

	if (!theForm.mobile.value.length) {
		valid = false;
		theForm.mobile.style.border = "1px solid #ff0000";
	}

	var emailRegExp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; //https://www.w3resource.com/javascript/form/email-validation.php
	if (theForm.email.value.match(emailRegExp || !theForm.email.value.length)) {
		theForm.email.style.border = "1px solid #ff0000";
	}

	if (!theForm.address.value.length) {
		valid = false;	
		theForm.address.style.border = "1px solid #ff0000";
	}

	//window.alert(valid);
	return valid;
}

function hidePassword() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>

