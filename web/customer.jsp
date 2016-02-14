
<html>
    
<head>
             <%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.mongodb.*" %>
<%@page import= "java.text.*" %>
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
                           <li><a href="trackorder.html"><b>Track Your Package</b></a></li>
<li><a href="logout.jsp"><b>Logout</b></a></li>
 </ul>
                     <div align="right">
             <a href="orderPage.jsp">
                 <img src="images/cart.png" alt=""/></a></div>
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
<h2><b>Final Order</b></h2>
                       
  <div class="span12">
      <section class="group11">
        <%
           int orderid=0;
           synchronized (session) {
        
         
        double total=0;
        int t=0;
        
		response.setContentType("text/html");
               
                String userName= (String)session.getAttribute("user");
                
                Date date = new Date();
                 SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
               
                 Calendar cl1 = Calendar.getInstance();
                String Orderdate=ft.format(date);
                Random randomGenerator = new Random();
            for (int idx = 1; idx <= 10; ++idx){
     int randomInt = randomGenerator.nextInt(100);
     orderid = randomInt;
      log("Generated : " + randomInt);
    //  out.println(+randomInt);
    }
           
            
%>
          <form method='get' action='deleteOrder1.jsp'>     
            <TABLE BORDER=1 ALIGN="CENTER">
                <TR BGCOLOR="#DB778E">
<TD colspan="11"><h5>Order Details for <b><%=userName%> !</b></h5> </TD></TR>
                <TR>

                    <TD colspan="11"><b><font size="5"><h7> Order Confirmation Number is: <%=orderid%></h7></b></TD></TR>
                <TR>
                    <TH>Cake Name</TH>
                    <TH>Cake Unit</TH>
                    <TH>Card Price</TH>
                    <TH>Items Placed</TH>
                    <TH>Card Name</TH>
                    <TH>Card Type</TH>
                    <TH>Card Number</TH>
                    <TH>Shipping Address</TH>
                    <TH>Order Date</TH> 
                    <TH>Delivery Date</TH>
                </TR>
  <%               try{
      
			String Cardname = request.getParameter("cardname");
			String Cardtype = request.getParameter("cardtype");
			String Shipadd = request.getParameter("shipadd");
			String Cardno = request.getParameter("cardno");
                     String totalcakeprice = request.getParameter("totalcakeprice");
                     String deliverydate = request.getParameter("deliverydate");
			MongoClient mongo = new MongoClient("localhost", 27017);
						
			// If database doesn't exists, MongoDB will create it for you
			//DB db = mongo.getDB("CustomerReviews");
                        DB db1 = mongo.getDB("Cake");
			String user = (String) session.getAttribute("user");
			// If the collection does not exists, MongoDB will create it for you
			DBCollection dhiru = db1.getCollection("order");
                        DBCollection dhiru1 = db1.getCollection("temp_shop");
                        BasicDBObject searchQuery1 = new BasicDBObject();
			searchQuery1.put("user", user);
                        
                        
      //Date orderDate = format.parse(Orderdate);
                        //Date todayDate = new Date();
// ft = new SimpleDateFormat ("dd.MM.yyyy");
                        //Date date = new Date();
                        //SimpleDateFormat ft = new SimpleDateFormat("E dd.MM.yyyy");
//Date date3=ft.parse(deliverydate);
                       // Calendar cl1 = Calendar.getInstance();
                        
                        Date date2= new Date(ft.parse(deliverydate).getTime());
                        Calendar cl3 = Calendar.getInstance();


String date3=""; 
Calendar c = Calendar.getInstance();
try {
    c.setTime(ft.parse(deliverydate));
} catch (ParseException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
} 
c.add(Calendar.DAY_OF_MONTH, -1);  // number of days to add
date3 = ft.format(c.getTime());

                        
                       // Date date1 = cl1.getTime();
                        //Date date2 = cl2.getTime();
			BasicDBObject doc = new BasicDBObject("title", "MongoDB");
				
                                //append("cakename", cakename).
                                //append("cakeunit", cakeunit).
                                //append("cakeprice", cakeprice).
                                
                        DBCursor cursor1 = dhiru1.find(searchQuery1);
                        int count = cursor1.count();
                        ArrayList<String> cakenamearray = new ArrayList<String>();
                         ArrayList<String> caketypearray = new ArrayList<String>();
                        
                          while (cursor1.hasNext()) { 
                                BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                              String cakename = obj1.getString("cakename");
                              String caketype = obj1.getString("caketype");
                              
                         caketypearray.add(caketype);
                         cakenamearray.add(cakename);
                        
                         
                          
                          }
                          
                          
                         doc = new BasicDBObject("title", "MongoDB").
                                 append("user", userName).
                                append("totalcakeprice", totalcakeprice).
                                append("orderid", orderid).
                               
                                append("orderdate", Orderdate).
                                 append("canceldate", date3).
                                append("cardname", Cardname).
				append("cardtype", Cardtype).
                                append("shipadd", Shipadd).
                                 append("deliverydate", deliverydate).
                                 append("cardno", Cardno).
                                 append("caketype", caketypearray).
                       append("cakename", cakenamearray);   
                        
                       
				
			dhiru.insert(doc);
                         cursor1 = dhiru1.find(searchQuery1);
                        //DBCollection temp_shop = db1.getCollection("temp_shop");
                        if (cursor1.count() == 0) {}
                        else{
                        while (cursor1.hasNext()) {  
                         BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                        String cakename = obj1.getString("cakename");
                        String cakeprice = obj1.getString("cakeprice");
                        String cakeunit = obj1.getString("cakeunit");
                        String cakeimage = obj1.getString("cakeimage");
                        int numItems = Integer.parseInt(obj1.getString("numItems"));
                         %>
                         <tr><TD><%=cakename%></TD>
                    
                    <TD><%=cakeunit%></TD>
                    <TD><%=cakeprice%></TD>
                    <TD><%=numItems%></TD>
                     <TD><%=Cardname%></TD> 
                     <TD><%=Cardtype%></TD>
                     <TD><%=Cardno%></TD>
                     <TD><%=Shipadd%></TD>
                     <TD><%=Orderdate%></TD>
                        <TD><%=deliverydate%></TD> 
                         </tr>
                    
             
<%}}%>

                
                <tr><td colspan="11"><b><font size="5">
                            You placed an order on :<%=ft.format(date)%></b></td></tr>
                <tr> <td colspan="11"><b><font size="5">Your Delivery Date is :<%=deliverydate%></b></td></tr>
                <tr><td colspan="11"><b><font size="5">You can cancel your order anytime by: <%=date3%></b></td></tr>
                <tr><TD colspan="11"><input type='text' hidden id="orderid" name="orderid" value='<%=orderid%>'>
                       
                        <INPUT TYPE='SUBMIT' VALUE='Cancel Order'class="btn btn-info1 active">

                    </TD></tr>   
                </table>
                </form>
      </section>
  </div>
                <%
                         dhiru1.remove(searchQuery1);
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