<%@page import="com.mongodb.WriteResult"%>
<%@page import="com.mongodb.WriteResult"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<html>
  
<head>
<title>Cake Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
 <body>    
       <div class="container">
  <div class="navbar">
	         <div class="navbar-inner">
	           
	             <ul class="nav">
                         <li class="active"><a href="admin.jsp"><b>Home</b></a></li>
                         <li class=""><a href="existing.html"><b>Add Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Delete Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Update Customer Order</b></a></li>
                         <li class=""><a href="addstore.jsp"><b>Back</b></a></li>
                          <li class=""><a href="logout.jsp"><b>Logout</b></a></li>
                          </ul>
                 </div>
      
      
  </div>

         <div class="span4">
	       		<ul class="nav nav-list">
    <li class="active"><a href="admin.jsp"><b>Home</b></a></li>
    <li class=""><a href="addstore.jsp"><b>Add products to Store</b></a></li>
                         <li class=""><a href="delcustomer.jsp"><b>Delete products from Store</b></a></li>
                         <li class=""><a href="updatecust.html"><b>Update products to Store</b></a></li>
                         <li class=""><a href="existing.html"><b>Add Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Delete Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Update Customer Order</b></a></li>
</ul>
	       	</div>
            <div class="span8">
                <section class="group6">
              	
<%
MongoClient mongo = new MongoClient("localhost", 27017);
			//Get the values from the form
String search= "orderid";
    int searchParameter = Integer.parseInt(request.getParameter("searchParameter"));
    DB db = mongo.getDB("Cake");
			//DB db1 = mongo.getDB("CustomerReviews");
			//DBCollection myReviews = db.getCollection("Login2");
                        DBCollection order = db.getCollection("order");
			
			// Find and display 
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put(search, searchParameter);

			DBCursor cursor = order.find(searchQuery);

while (cursor.hasNext()) {
					
					BasicDBObject obj = (BasicDBObject) cursor.next();
                                        String cardname=obj.getString("cardname");
                                        String cardtype=obj.getString("cardtype");
                                        String cardno=obj.getString("cardno");

 %>
<h1>Update the order!</h1>
<form action="addupdate.jsp">
<table border="1">
    
    <TR>    
        <TD colspan="3"><b><font size="5">Card Name</td> <td colspan="3"><b><font size="5"><input type="text" name="cardname" value="<%=cardname%>"</b></TD></tr>
                         <TR>    
        <TD colspan="3"><b><font size="5">Card Type</td> <td colspan="3"><b><font size="5"> <input type="text" name="cardtype" value="<%=cardtype%>"</b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Card Number</td> <td colspan="3"> <b><font size="5"><input type="text" name="cardno" value="<%=cardno%>"</b></TD></tr>
<tr>
<input type="hidden" name="orderid" value="<%=searchParameter%>">
    <td> <input type ="submit" value="Update!"/></td></tr>                  

</table>
</form>
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