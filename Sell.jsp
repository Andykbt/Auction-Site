<%@ include file="index.jsp" %>
<%@ page import="java.util.*" %>

<%
if (session.getAttribute("acc") == null) {
    session.setAttribute("error", "noAccount");
	response.sendRedirect("login.jsp");
}

%>


<div class="center" style="width: 350px; height: 550px; border-radius: 20px;">
	<div style="position: absolute; top: 0px; width: 100%; height: 50px; background-color: #BB86FC">
		<h3 style="text-align: center">Sell A Product</h3>
	</div>

	<div style="position: absolute; top: 75px; left: 75px;">
		<form action="processSell.jsp" style="text-align: center;" onsubmit="return validateSell(this)">
			<label for="productName">Product Name</label><br>
			<input type="text" name="INProductName" id="productName" placeholder="Your product name"><br>

			<label for="productDescription">Product Description</label><br>
			<input type="text" name="INProductDesc" id="productDescription" placeholder="Your product description"><br>

			<label for="productName">Vendor</label><br>
			<input type="text" name="INVendor" id="Vendor" value='<%=session.getAttribute("acc")%>' readonly><br>

			<label for="startingDate">Starting date</label><br>
			<input type="date" name="startingDate" id="startingDate"><br>

			<label for="closingDate">Closing date</label><br>
			<input type="date" name="closingDate" id="closingDate"><br>

			<input type="submit" name="button_sell" value="Submit"/>
		</form>
	</div>
</div>

<script>
function validateSell(theForm) {
	var valid = true;

	if (!theForm.productName.value.length) {
		valid = false;
		theForm.productName.style.border = "1px solid #ff0000";
	}

	if (!theForm.productDescription.value.length) {
		valid = false;
		theForm.productDescription.style.border = "1px solid #ff0000";
	}

	if (!theForm.startingDate.value) {
		valid = false;
		theForm.startingDate.style.border = "1px solid #ff0000";
	}

	if (!theForm.closingDate.value) {
		valid = false;
		theForm.closingDate.style.border = "1px solid #ff0000";
	}


	var sDate = new Date();
	sDate = Date.parse(theForm.startingDate.value);

	var cDate = new Date();
	cDate = Date.parse(theForm.closingDate.value);


	if (cDate < sDate) {
		valid = false;
	}

	return valid;
}
</script>