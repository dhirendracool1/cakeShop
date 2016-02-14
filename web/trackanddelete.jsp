<%@page import="com.mongodb.MongoException"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.*" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>Status</title>

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
                        <li><a href="trackorder.html"><b>Track your Package</b></a></li>
                        <li><a href="logout.jsp"><b>Logout</b></a></li>
                    </ul>
                    <div align="right">
                        <a href="orderPage.jsp">
                            <img src="images/cart.png" alt=""/></a></div>
                     </div>
            </div>
           
<%
    try{
			
   MongoClient mongo = new MongoClient("localhost", 27017);
    	DB db = mongo.getDB("Cake");
			
	DBCollection dhiru = db.getCollection("order");
        //DBCollection dhiru1 = db.getCollection("shop1");
        int orderid= Integer.parseInt(request.getParameter("orderid"));
        //String cakename = request.getParameter("cakename");
			BasicDBObject searchQuery = new BasicDBObject();
                        //BasicDBObject searchQuery1 = new BasicDBObject();
			searchQuery.put("orderid", orderid);
                        //searchQuery1.put("cakename", cakename);
       DBCursor cursor = dhiru.find(searchQuery); 
       //DBCursor cursor1 = dhiru.find(searchQuery1); 
	                      
                      %>
                      
                      <%
                        if(cursor.count() == 0){
                    	}else{while (cursor.hasNext()) {
                        //out.println(cursor.next());
                        BasicDBObject obj = (BasicDBObject) cursor.next();
                        String canceldate = obj.getString("canceldate");
                        SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
                        long date1 = new Date().getTime(); 

                        //Calendar cl3 = Calendar.getInstance();
//SimpleDateFormat f = new SimpleDateFormat("dd-MMM-yyyy");
Date d = ft.parse(canceldate);
long milliseconds = d.getTime();
                       if (milliseconds>date1){     
			 dhiru.remove(searchQuery);%>
    <div class="span12">
    <section class="group10">
        <TABLE ALIGN="left-top">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="trackorder.html" class="btn btn-info1 active"/>
                        </form></td></tr></table> 
      <H2><I></br>Order Deleted Succesfully!...</I></H2>
    </section>
    </div>
                      <% }else {%>
         <div class="span12">
    <section class="group10">
        <TABLE ALIGN="left-top">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="trackorder.html" class="btn btn-info1 active"/>
                        </form></td></tr></table> 
      <H2><I></br>Sorry! You have passed the cancellation date...</I></H2>
    </section>
    </div>  
                       
        
<%   }}}
                        } catch (MongoException e) {
				e.printStackTrace();
		}
                      
                     
                          %>
        
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