<html>
  
<head>
<title>Cake Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
  </div>

<%
   
         synchronized (session) {
			
		try{
			//Get the values from the form
			String searchField = "user";
			String searchParameter = request.getParameter("searchParameter");			
			
			//Connect to Mongo DB
			MongoClient mongo = new MongoClient("localhost", 27017);
						
			
			DB db = mongo.getDB("Cake");
			DB db1 = mongo.getDB("CustomerReviews");
			DBCollection myReviews = db1.getCollection("Login2");
                        DBCollection order = db.getCollection("order");
			
			// Find and display 
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put(searchField, searchParameter);

			DBCursor cursor = myReviews.find(searchQuery);
                        //DBCursor cursor1 = myReviews.find(searchQuery);
                        //DBCursor cursor1 = myReviews.find(searchQuery);
                        int count= cursor.count();
                        
                       if (count == 0) {
      %>
      <div class="span12">
    <section class="group11">
        <TABLE ALIGN="left-top">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="existing.html" class="btn btn-info1 active"/>
                        </form></td></tr></table> 
      <H2><I></br>There is no such user...</I></H2>
    </section>
    </div> 
 
 <%
 } else {session.setAttribute("user", searchParameter);
         
 %>    
 <div class="span4">
    
       <form  method = "post" action = "addproduct.jsp">
                <input class = "btn btn-info1 active" type = "submit" name = "update" value = "Add Customer Order">
            </form></br>
                <form  method = "post" action = "delcustomer.jsp">
                <input class = "btn btn-info1 active" type = "submit" name = "addcustomer" value = "Delete Customer Order">
            </form></br>
            <form  method = "post" action = "updatecust.html">
                <input class = "btn btn-info1 active" type = "submit" name = "update" value = "Update Customer Order">
            </form></br> 
   
 </div>
 <div class="span8">
    <section class="group6">
        
                  <%
                            BasicDBObject searchQueryForOrder = new BasicDBObject();
			searchQueryForOrder.put(searchField, searchParameter);

			DBCursor cursorForOrder = order.find(searchQuery);
                       // ArrayList<String> cakename = new ArrayList();
                        if(cursorForOrder.count()==0){%>
                        <fieldset <legend><h5>No order placed till now!</h5></legend> </fieldset>
    <form action="existing.html"><INPUT TYPE="submit" NAME="submit" VALUE="Back" class="btn btn-info1 active">
                        </form>
                       <% } else{%>
                        <fieldset>
                            <legend><h5>You placed products till now!</h5></legend> </fieldset>
        <table border="1"> 
                     <TR>
                    <TH>Order Number</TH>
                    <TH>Cake Name</TH>
                    <TH>Cake Price</TH>
                    <TH>Card Number</TH>
                    <TH>Order Date</TH>
                    <TH>Delivery Date</TH>
                    </TR>    
                      <% while(cursorForOrder.hasNext()){
                           BasicDBObject obj = (BasicDBObject) cursorForOrder.next();
                           ArrayList<BasicDBObject> a = (ArrayList<BasicDBObject>) obj.get("cakename");
                           //ArrayList<BasicDBObject> b = (ArrayList<BasicDBObject>) obj.get("caketype");
                           //BasicDBList list = (BasicDBList) cursorForOrder.next().get("cakename");
                  //String a[] = list.toArray(new String[list.size()]);
                          
                    String cakeimage = obj.getString("cakeimage");
                    String caketype = obj.getString("caketype");    
                    String cakeprice = obj.getString("totalcakeprice");
                    String Orderdate = obj.getString("orderdate");
                        String orderid = obj.getString("orderid");
                        String deliverydate = obj.getString("deliverydate");
                        String cardno = obj.getString("cardno");
%> 
         
                <TR> 
                    <TD><%=orderid%></TD>
                    <TD><% for(int i=0;i<a.size();i++)
                           {
                               out.print("''"+a.get(i)+"''|");
                              
                           }
                     
                    %>
                    
                    </TD>
                    
                    <TD><%=cakeprice%></TD>
                     <TD><%=cardno%></TD>
                    <TD><%=Orderdate%></TD>
                    <TD><%=deliverydate%></TD>
                </TR>
                

<%
                       }
                        
                        }}%>
      </TABLE>      
 </section>
	 </div>
           
  <% //response.sendRedirect("deletesalesman.jsp");
  } catch (MongoException e) {
            e.printStackTrace();
        }
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





