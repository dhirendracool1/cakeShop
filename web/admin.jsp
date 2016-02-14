
<html>
  
<head>
<title>Cake Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
 <body>  
     <%if (session.getAttribute("user").equals("")) {
                            synchronized (session) {
         String user=request.getParameter("user");
         
    %>
        <div class="container">
  <div class="navbar">
	         <div class="navbar-inner">
	           
	             <ul class="nav">
                         <li class="active"><a href="admin.jsp"><b>Home</b></a></li>
                         <li class=""><a href="existing.html"><b>Add Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Delete Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Update Customer Order</b></a></li>
                          <li class=""><a href="logout.jsp"><b>Logout</b></a></li>
                          </ul>
                 </div>
      
      
  </div>

         <div class="span4">
	       		<ul class="nav nav-list">
    
    <li class="active"><a href="admin.jsp">Home</a></li>
    <li><a href="existing.html">Add Customer Order</a></li>
    <li><a href="existing.html">Delete Customer Order</a></li>
    <li><a href="existing.html">Update Customer Order</a></li>
    <li><a href="existing.html">Back</a></li>
    <li><a href="logout.jsp">Logout</a></li>
   
</ul>
	       	</div>
     
  <div class="span8">
    <section class="group6">
          <fieldset>
    <legend><h5>Welcome <%=user%>!</h5></legend>
          <form  method = "post" action = "addstore.jsp">
                <input class = "btn btn-info1 active" type = "submit" name = "add" value = "Add Product to Store">
</form></br>
                <form  method = "post" action = "delstore.jsp">
                <input class = "btn btn-info1 active" type = "submit" name = "delete" value = "Delete Product from Store">
            </form></br>
                <form  method = "post" action = "updatestore.html">
                <input class = "btn btn-info1 active" type = "submit" name = "update" value = "Update Product to Store">
            </form></br>
                <form  method = "post" action = "existing.html">
                <input class = "btn btn-info1 active" type = "submit" name = "addcustomer" value = "Add/Delete/Update Customer Order">
            </form></br>
          </fieldset>    
      </section>
	 </div>
                <%}} else {%>
                
                <div class="container">
  <div class="navbar">
	         <div class="navbar-inner">
	           
	             <ul class="nav">
                         <li class="active"><a href="admin.jsp"><b>Home</b></a></li>
                         <li class=""><a href="existing.html"><b>Add Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Delete Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Update Customer Order</b></a></li>
                          <li class=""><a href="logout.jsp"><b>Logout</b></a></li>
                          </ul>
                 </div>
      
      
  </div>

         <div class="span4">
	       		<ul class="nav nav-list">
    
    <li class="active"><a href="admin.jsp">Home</a></li>
    <li><a href="existing.html">Add Customer Order</a></li>
    <li><a href="existing.html">Delete Customer Order</a></li>
    <li><a href="existing.html">Update Customer Order</a></li>
    <li><a href="existing.html">Back</a></li>
    <li><a href="logout.jsp">Logout</a></li>
   
</ul>
	       	</div>
     
  <div class="span8">
   <section class="group6">
       <fieldset>
    <legend><h5>Welcome <%=session.getAttribute("user")%>!</h5></legend> 
          <form  method = "post" action = "addstore.jsp">
                <input class = "btn btn-info1 active" type = "submit" name = "add" value = "Add Product to Store">
</form></br>
                <form  method = "post" action = "delstore.jsp">
                <input class = "btn btn-info1 active" type = "submit" name = "delete" value = "Delete Product from Store">
            </form></br>
                <form  method = "post" action = "updatestore.html">
                <input class = "btn btn-info1 active" type = "submit" name = "update" value = "Update Product to Store">
            </form></br>
                <form  method = "post" action = "existing.html">
                <input class = "btn btn-info1 active" type = "submit" name = "addcustomer" value = "Add/Delete/Update Customer Order">
            </form></br>
               
      </section>
	 </div>
                <%}%>
      
     <footer>
	
        <div class="footer-content">
            <ul>
            	<li><h4>Cake Shop</h4></li>
                <li><a href="aboutus.html">About Us</a></li>
                <li><a href="aboutus.html">Contact Us</a></li>
                <li><a href="aboutus.html">Delivery Policy</a></li>
                <li><a href="aboutus.html">Terms & Conditions</a></li>
                
			</ul>
            
           <ul>
            <li><h4>Shop</h4></li>
            <li><a href="birthday.jsp">Birthday Cakes</a></li>
            <li><a href="wedding.jsp">Wedding Cakes</a></li>
        </ul>
            
            <ul>
            	<li><h4>Customer Service </h4></li>
                <li><a href="userdetails.jsp">About your Order</a></li>
                 <li><a href="testimonial.html">Reviews/Complaints</a></li>
                
			</ul>
            <ul>
            	<li><h4>Connect with Us</h4></li>
                <li>
                <img src="images/fb.png" alt=""/>  </li>
                <li><img src="images/twitter.jpg" alt=""/> </li>
               
			</ul>
           
        
        </div>
		
        <div class="footer-bottom">
            <p> <span>&copy; 2015 All Rights Reserved </span>&nbsp;&nbsp;|&nbsp;&nbsp; CSP 595 Cake Website by Team 17</p>
        </div>
		
    </footer>
    </div>
 
     
        </body>
</html>

