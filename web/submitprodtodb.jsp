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
                    
                    
                    
                </section>
            </div>
	
<%
MongoClient mongo = new MongoClient("localhost", 27017);
			//Get the values from the form
String cakename = request.getParameter("cakename");
String cakecategory = request.getParameter("cakecategory");
			String cakeimage = request.getParameter("cakeimage");
			String cakeprice = request.getParameter("cakeprice");
                        String cakeprice1 = request.getParameter("cakeprice1");
                        String cakeprice2 = request.getParameter("cakeprice");
			String cakeunit = request.getParameter("cakeunit");
                        String caketype = request.getParameter("caketype");
			String numItems = request.getParameter("numItems");
                        //String eggless = request.getParameter("eggless");
			//MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("Cake");
                        
                        if(cakeprice1.equals(null)|| cakeprice1.equals("0"))
                {
                    
                }else {
                    cakeprice=cakeprice1;
                    
                        }
			// If the collection does not exists, MongoDB will create it for you
			DBCollection myReviews = db.getCollection("shop");
                        BasicDBObject doc = new BasicDBObject("title", "MongoDB")
                                .append("cakeunit", cakeunit)
                                .append("cakecategory", cakecategory)
					.append("cakename", cakename)
                                .append("cakeprice", cakeprice)
                                
                                
                                .append("cakeprice1", cakeprice2)
                                 .append("caketype", caketype)
                                .append("numItems", numItems)
					.append("cakeimage", cakeimage);
                                
                        
			myReviews.insert(doc);
                        
%>
<fieldset>
    <legend><h5>Product Stored in the Store!</legend>

<table border="1"><TR>    
        <TD colspan="3"><b><font size="5">Cake Name</td> <td colspan="3"><b><font size="5"> <%=cakename%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Cake Category</td> <td colspan="3"> <b><font size="5"><%=cakecategory%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Cake Type</td> <td colspan="3"><b><font size="5"> <%=caketype%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Cake Unit</td> <td colspan="3"> <b><font size="5"><%=cakeunit%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Original Cake Price</td> <td colspan="3"><b><font size="5"> <%=cakeprice2%></b></TD></tr>
             <TR>    
        <TD colspan="3"><b><font size="5">Discounted Cake Price</td> <td colspan="3"><b><font size="5"> <%=cakeprice1%></b></TD></tr>       
            <TR>    
        <TD colspan="3"><b><font size="5">Number of Items</td> <td colspan="3"><b><font size="5"> <%=numItems%></b></TD></tr>

</table>
</fieldset>
		
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