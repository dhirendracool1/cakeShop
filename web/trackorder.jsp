

<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.MongoException"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
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
           
                        <%
                            response.setContentType("text/html");
                            session = request.getSession();
                            //ShoppingCart cart;
                            synchronized (session) {
                                try {
                                    MongoClient mongo = new MongoClient("localhost", 27017);
                                    DB db1 = mongo.getDB("Cake");
                                    //DBCollection shop = db1.getCollection("temp_shop");
                                    DBCollection order = db1.getCollection("order");
                                    BasicDBObject searchQuery1 = new BasicDBObject();

                                    int orderid = Integer.parseInt(request.getParameter("orderid"));
                                    searchQuery1.put("orderid", orderid);
                                    //DBCursor cursor1 = shop.find(searchQuery1);
                                    DBCursor cursor = order.find(searchQuery1);
                                    //DBCollection temp_shop = db1.getCollection("temp_shop");
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
                    <%
                    } else {%>
                    <div class="span12">
    <section class="group10">
                    <fieldset>
    <legend><h5>Order placed till now!</h5></legend>              
            <TABLE BORDER=1 ALIGN="CENTER">
                <TR>
                    <TH><b>Order Number</b></TH>
                    <TH><b>Order Date</b></TH>
                    <TH><b>Delivery Date</b></TH>
                    <TH><b>Cancellation Date</b></TH>
                    <TH><b>Cake Name</b></TH>
                    
                    <TH><b>Cake Price</b></TH>
                    <TH><b>Card Name</b></TH>
                    <TH><b>Card Number</b></TH>
                    <TH><b>Card Type</b></TH>
                    <TH></TH>
                </TR>
                <%
                    
                    while (cursor.hasNext()) {

                        BasicDBObject obj1 = (BasicDBObject) cursor.next();
                        ArrayList<BasicDBObject> a = (ArrayList<BasicDBObject>) obj1.get("cakename");
                          // ArrayList<BasicDBObject> b = (ArrayList<BasicDBObject>) obj1.get("caketype");

                        String cakeprice = obj1.getString("totalcakeprice");
                        String cardname = obj1.getString("cardname");
                        String cardno = obj1.getString("cardno");
                        String cardtype = obj1.getString("cardtype");
                         orderid = Integer.parseInt(obj1.getString("orderid"));
                        String orderdate = obj1.getString("orderdate");
                        String deliverydate = obj1.getString("deliverydate");
                        String canceldate = obj1.getString("canceldate");
                %>
                <TR> <form method='get' action='trackanddelete.jsp'>
                    <TD><%=orderid%></TD>
                    <TD><%=orderdate%></TD>
                    <TD><%=deliverydate%></TD>
                    <TD><%=canceldate%></TD>
                    <TD><% for(int i=0;i<a.size();i++)
                           {
                               out.print("''"+a.get(i)+"'' ,");
                           }%></TD>
                    
                    
                    <TD><%=cakeprice%></TD>
                    <TD><%=cardname%></TD>
                    <TD><%=cardno%></TD>
                    <TD><%=cardtype%></TD>
                    
                   
  <TD>
      <input type='hidden' name="orderid" value='<%=orderid%>'>
                       
                        <INPUT TYPE='SUBMIT' VALUE='Delete Order' class="btn btn-info1 active">

                        </TD>
                </form>
                </TR>
                
             <%}%>   
            </TABLE>
                    </fieldset>
 </section>
      
	 </div>
            <%}
                    } catch (MongoException e) {
                        e.printStackTrace();
                    }
                }
            %> 
            <!--end holder-->
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

