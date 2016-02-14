
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<html lang="en" dir="ltr">
<head>
<title>Cake Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="javascript.js"></script>
</head>
 <body onload="init()"> 
        <div class="container">
  <div class="navbar">
	          <div class="navbar-inner">
	            
	              <ul class="nav">
                          <li class="active"><a href="flavour.jsp"><b>Cakes by Flavour</b></a></li>
                          <li><a href="theme.jsp"><b>Cakes by Theme</b></a></li>
                          <li><a href="photo.jsp"><b>Photo Cakes</b></a></li>
                          <li><a href="addone.jsp"><b>Add-Ons</b></a></li>
                          <li><a href="userdetails.jsp"><b>Register/Login</b></a>
                          <li><a href="index.html"><b>Home</b></a>
                          </li>
                          
                         

                    
	              </ul>
                     
                         
                      <form name="autofillform" action="autocomplete" class="search" method="get">
                            <table border="0" cellpadding="1" bgcolor="#FFF8DC"> 
                                <tbody>
                                   
                                        <b>Search</b>
                                        
                                            <input type="text" class="search-query" placeholder="Enter Keyword here" id="complete-field" onkeyup="doCompletion()">
                                        <button type="button" class="btn btn-info active">Go</button>
                                    
<tr>
              <td id="auto-row" colspan="2">
                <table id="complete-table" class="popupBox" >
              <td>
          <tr>
                </table>
                                </tbody>
                            </table>
                        </form>
          
	          </div>
      
      
  </div>

     
      
         <div class="span4">
	        		<ul class="nav nav-list">
    <li class="nav-header">What we are?</li>
    <li class="active"><a href="index.html">Home</a></li>
    <li><a href="aboutus.html">About Us</a></li>
    <li><a href="aboutus.html">Location & Hours</a></li>
    <li><a href="testimonial.html">Reviews & Testimonials</a></li>
   
    <li class="nav-header">What we Offer</li>
    <li><a href="prod.jsp">Our Cakes</a></li>
    <li><a href="gallery.html">Gallery</a></li>
    <li><a href="userdetails.jsp">Your Order</a></li>
    <li><a href="offers.jsp">Offers</a></li>
   
</ul>
	        	</div>
     
     
            
            
                       
  <div class="span8">

    <h2 color="">Welcome!</h2>
    
       
        <%String searchField = request.getParameter("searchField");
                                    String searchParameterUserName = request.getParameter("user");

                                    String searchParameterPassword = request.getParameter("pass");
                                    //Connect to Mongo DB
                                    MongoClient mongo = new MongoClient("localhost", 27017);
                                    // if database doesn't exists, MongoDB will create it for you
                                    DB db = mongo.getDB("CustomerReviews");
                                    DB db1 = mongo.getDB("Cake");
                                    //DBCollection Login = db.getCollection("Login2");

                                    // Find and display 
                                    BasicDBObject searchQuery = new BasicDBObject();
                                    searchQuery.put("user", searchParameterUserName);
                                    searchQuery.put("pass", searchParameterPassword);
                                    DBCollection shop = db1.getCollection("shop");
                                    BasicDBObject searchQuery1 = new BasicDBObject();
                                    searchQuery1.put("title", "MongoDB");
                                    //DBCursor cursor = Login.find(searchQuery);
                                    DBCursor cursor1 = shop.find(searchQuery1);
                    %>
                    <%
                if (cursor1.count() == 0) {}else {
            int i = 1;
            while (cursor1.hasNext()) {
                BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                String cakename = obj1.getString("cakename");
                String cakeprice = obj1.getString("cakeprice");
                String cakeunit = obj1.getString("cakeunit");
                String cakeimage = obj1.getString("cakeimage");
        %>
        <section class="group<%=i%>">
            <a class="photo_hover3"><img src="<%=cakeimage%>" width="120" height="137" alt=""></a> 
            <p><%=cakename%></p>
            <p><%=cakeunit%>| US <%=cakeprice%></p>
            <form  method = "post" action = "userdetails.jsp">
                <input class = "button" type = "submit" name = "cakename" value = "Buy">
            </form>
            </section>
            <%
                    i++;
                    if (i == 4) {
                        i = 1;
                    }
                    
                }}
            %>
  
</div>
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
