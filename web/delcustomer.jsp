
<%@page import="java.text.ParseException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.MongoException"%>
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
                          <li class=""><a href="logout.jsp"><b>Logout</b></a></li>
                          </ul>
                 </div>

<%
    synchronized (session) {
        response.setContentType("text/html");
        String userName = (String) session.getAttribute("user");
        PrintWriter output = response.getWriter();
        //ItemOrder order;

        try {
            //Get the values from the form
            String searchField = "user";//request.getParameter("searchField");

            String searchParameter = userName;//request.getParameter("searchParameter");

            //Connect to Mongo DB
            MongoClient mongo = new MongoClient("localhost", 27017);

            // if database doesn't exists, MongoDB will create it for you
            DB db = mongo.getDB("Cake");

            DBCollection dhiru = db.getCollection("order");

            // Find and display 
            BasicDBObject searchQuery = new BasicDBObject();
            searchQuery.put(searchField, searchParameter);

            DBCursor cursor = dhiru.find(searchQuery);
if (cursor.count() == 0) {
%>
<div class="span12">
    <section class="group10">
        <TABLE ALIGN="left-top">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="admin.jsp" class="btn btn-info1 active"/>
                        </form></td></tr></table> 
      <H2><I></br>No items ordered...</I></H2>
    </section>
    </div>
<%} else {%>
<div class="span12">
    <section class="group10">
        <fieldset>
            <legend><h5>Welcome <%=searchParameter%>! Your Order details are below. Please click on the orders to delete.</h5></legend>
   <table border="1"> 
                     
    <TR>
                    <TH>Order Number</TH>
                    <TH>Cake Name</TH>
                    <TH>Cake Price</TH>
                    <TH>Card Number</TH>
                    <TH>Order Date</TH>
                    <TH>Delivery Date</TH>
                    <TH>Cancellation Date</TH>
                    <TH></TH>
                </TR>
       
                <%
                    while (cursor.hasNext()) {
                        //out.println(cursor.next());
                        BasicDBObject obj = (BasicDBObject) cursor.next();
                       ArrayList<BasicDBObject> a = (ArrayList<BasicDBObject>) obj.get("cakename");
                        String searchField1 = "orderid";
                        String cakeimage = obj.getString("cakeimage");
                        String Orderdate = obj.getString("orderdate");
                        String cardtype = obj.getString("cardtype");
                        String caketype = obj.getString("caketype");
                        String cardno = obj.getString("cardno");
                        String canceldate = obj.getString("canceldate");
                        String deliverydate = obj.getString("deliverydate");
                        String cakeprice = obj.getString("totalcakeprice");
                        String Unit = obj.getString("cakeunit");
                        int orderid = Integer.parseInt(obj.getString("orderid"));
                     
                        //DateFormat format = new SimpleDateFormat("dd.mm.yyyy", Locale.ENGLISH);
                        //Date orderDate = format.parse(Orderdate);
                        Date todayDate = new Date();

                        //Date date = new Date();
                        SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");

                        Calendar cl1 = Calendar.getInstance();
                        Calendar cl2 = Calendar.getInstance();
 
                  long date1 = new Date().getTime(); 

                        Calendar cl3 = Calendar.getInstance();
//SimpleDateFormat f = new SimpleDateFormat("dd-MMM-yyyy");
Date d = ft.parse(canceldate);
long milliseconds = d.getTime();
  // number of days to add


                        
                            BasicDBObject searchQuery1 = new BasicDBObject();
                        searchQuery1.put(searchField1, orderid);%>
                        
                <TR> <form method='get' action='delsales.jsp'>
                    <TD><%=orderid%></TD>
                    <TD><% for(int i=0;i<a.size();i++)
                           {
                               out.print("''"+a.get(i)+"'' |");
                           }%></TD>
                    
                    
                    <TD><%=cakeprice%></TD>
                    <TD><%=cardno%></TD>
                    <TD><%=Orderdate%></TD>
                    <TD><%=deliverydate%></TD>
                   <TD><%=canceldate%></TD>
  <TD><input type='hidden' name="orderid" value='<%=orderid%>'>
                       
                        <INPUT TYPE='SUBMIT' VALUE='Delete Order' class="btn btn-info1 active">

                        </TD>
                </form>
                </TR>
                
<%}
    }%>
    </TABLE>
        </fieldset>        
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