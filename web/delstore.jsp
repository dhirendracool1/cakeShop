<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.mongodb.*" %>


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
                         <li class=""><a href="admin.jsp"><b>Add Customer Order</b></a></li>
                         <li class=""><a href="admin.jsp"><b>Delete Customer Order</b></a></li>
                         <li class=""><a href="admin.jsp"><b>Update Customer Order</b></a></li>
                         <li class=""><a href="admin.jsp"><b>Back</b></a></li>
                          <li class=""><a href="logout.jsp"><b>Logout</b></a></li>
                          </ul>
                 </div>
      
      
  </div>

<%
    synchronized (session) {
        response.setContentType("text/html");
        String userName = (String) session.getAttribute("user");
        PrintWriter output = response.getWriter();
        //ItemOrder order;

        try {
          
            MongoClient mongo = new MongoClient("localhost", 27017);

            // if database doesn't exists, MongoDB will create it for you
            DB db = mongo.getDB("Cake");

            DBCollection dhiru = db.getCollection("shop");
 BasicDBObject searchQuery1 = new BasicDBObject();
                        searchQuery1.put("title", "MongoDB");
            DBCursor cursor = dhiru.find(searchQuery1);
            if (cursor.count() == 0) {
%>
<div class="span12">
    <section class="group11">
        <TABLE ALIGN="left-top">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="admin.jsp" class="btn btn-info1 active"/>
                        </form></td></tr></table> 
      <H2><I></br>No items in the store...</I></H2>
    </section>
    </div>
<%} else {%>
<div class="span12">
    <section class="group10">

                <%
                    while (cursor.hasNext()) {
                        //out.println(cursor.next());
                        BasicDBObject obj = (BasicDBObject) cursor.next();
                       String caketype = obj.getString("caketype");
                        String cakecategory = obj.getString("cakecategory");
                        String cakeprice = obj.getString("cakeprice");
                        String cakename = obj.getString("cakename");
                        String cakeimage = obj.getString("cakeimage");
                        String cakeunit = obj.getString("cakeunit");
                        String numItems = obj.getString("numItems");
                 %> 

                 <table border="1"> 
                     <TR>
                    <TH>Cake Name</TH>
                    <TH>Cake Image</TH>
                    <TH>Cake Type</TH>
                    <TH>Cake Category</TH>
                    <TH>Cake Price</TH>
                    
                    <TH></TH>
                </TR>
                <TR> <form method='get' action='del.jsp'>
                    <TD><%=cakename%></TD>
                    <TD><img src="<%=cakeimage%>" width="120" height="137" alt=""</TD>
                    <TD><%=caketype%></TD>
                    <TD><%=cakecategory%></TD>
                    <TD><%=cakeprice%></TD>
                    
                    
                   
  <TD><input type='hidden' name="caketype" value='<%=caketype%>'>
      <input type='hidden' name="cakename" value='<%=cakename%>'>
                       
                        <INPUT TYPE='SUBMIT' VALUE='Delete Order'>

                        </TD>
                </form>
                </TR>
                </TABLE>
                
                <%
    }}%>
            
 </section>
	 </div>

<%
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

