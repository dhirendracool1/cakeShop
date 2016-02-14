
<html>
  
<head>
<title>Cake Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.mongodb.*" %>

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
                          <li class=""><a href="logout.jsp"><b>Logout</b></a></li>
                          </ul>
                 </div>
<%
    
    try{
			
   MongoClient mongo = new MongoClient("localhost", 27017);
    	DB db = mongo.getDB("Cake");
			
	DBCollection dhiru = db.getCollection("order");
        int orderid= Integer.parseInt(request.getParameter("orderid"));
			BasicDBObject searchQuery = new BasicDBObject();
			
                        searchQuery.put("orderid", orderid);
       DBCursor cursor = dhiru.find(searchQuery);
       
	                      
                      %>
                      
                      <%
                        if(cursor.count() == 0){
                            %>
				<h1>There are no such orders.</h1></tr>
               <%
			}else{
                             while (cursor.hasNext()) {
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
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="delcustomer.jsp" class="btn btn-info1 active"/>
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
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="delcustomer.jsp" class="btn btn-info1 active"/>
                        </form></td></tr></table> 
      <H2><I></br>Sorry! You have passed the cancellation date...</I></H2>
    </section>
    </div>          
              
<%}} }
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