

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
            <TABLE ALIGN="left-top">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Continue Shopping" formaction="addproduct.jsp" class="btn btn-info1 active"/>
                        </form></td></tr></table> 
                        <%
                            response.setContentType("text/html");
                            session = request.getSession();
                            //ShoppingCart cart;
                            synchronized (session) {
                                try {
                                    MongoClient mongo = new MongoClient("localhost", 27017);
                                    DB db1 = mongo.getDB("Cake");
                                    DBCollection shop = db1.getCollection("temp_shop");
                                    DBCollection order = db1.getCollection("order");
                                    BasicDBObject searchQuery1 = new BasicDBObject();

                                    String user = (String) session.getAttribute("user");
                                    searchQuery1.put("user", user);
                                    DBCursor cursor1 = shop.find(searchQuery1);
                                    DBCursor cursor = order.find(searchQuery1);
                                    //DBCollection temp_shop = db1.getCollection("temp_shop");
                                    if (cursor1.count() == 0) {
                        %>
            <H2><I></br>No items in your cart...</I></H2>
                    <%
                    } else {%>
            <TABLE ALIGN="right">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Cancel Order" formaction="deleteOrder.jsp" class="btn btn-info1 active"/>
                        </form></td></tr></table>                       
            <TABLE BORDER=1 ALIGN="CENTER">
                <TR>
                    <TH>Cake Name</TH>
                    <TH>Image</TH>
                    <TH>Cake Price</TH>
                    <TH>Number of Items</TH>
                    <TH>Total Cost</TH>
                    
                    <TH></TH>
                </TR>
                <%
                    int i = 1;
                    int count = cursor1.count();
                    String temptotalcakeprice = request.getParameter("totalcakeprice");
                    float totalcakeprice = 0;
                    while (cursor1.hasNext()) {

                        BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                        String cakename = obj1.getString("cakename");
                        String cakeprice = obj1.getString("cakeprice");
                        String cakeunit = obj1.getString("cakeunit");
                        String cakeimage = obj1.getString("cakeimage");
                        String totalcost = obj1.getString("totalcost");
                        
                        String numItems = obj1.getString("numItems");
                %>
                <TR>    
                    <TD><center> <%=cakename%></center></TD> 
                <TD><center><img src="<%=cakeimage%>" width="120" height="137" alt=""></center></TD>
                <TD><center>$ <%=cakeprice%></center></TD>    
                <TD>
                    <form action="update.jsp?count=<%=i%>" method="post">
                        <input type="text" hidden  name="cakeimage" id="cakeimage<%=i%>" value="<%=cakeimage%>">
                        <input type="text" hidden  name="cakename" id="cakename<%=i%>" value="<%=cakename%>">
                        <input type="text" hidden  name="cakeprice<%=i%>" id="cakeprice<%=i%>" value="<%=cakeprice%>">
                        <input type="number"  min="1" name="numItems<%=i%>" id="numItems<%=i%>" value="<%=numItems%>">

                        <INPUT TYPE="SUBMIT" Value="Update" >
                    </form>
                </TD>  
                <TD>
                <center>$ <%=Float.parseFloat(totalcost)%></center>
                </TD>
               
                <td><form><INPUT TYPE="HIDDEN" NAME="cakename" VALUE="<%=cakename%>" >
                        <SMALL><INPUT TYPE="SUBMIT" Value="Remove" formaction="remove.jsp">
                            <INPUT TYPE="HIDDEN" NAME="cakename" VALUE="<%=cakename%>">
                        </SMALL></form></td>
                </TR>           
                <%
                        i++;

                        totalcakeprice = Float.parseFloat(totalcost) + totalcakeprice;

     }%>
            </TABLE>
                       

<%if (cursor.count() == 0) {%>
<%  if (temptotalcakeprice == null) {
            %><h7>Total Cost = $ <%=totalcakeprice%></h7>
            <%} else {%>
            <h7>Total Cost Before Discount =   $ <%=totalcakeprice%></h7></br>
            <h7>Total Cost After Discount =   $ <%=Float.parseFloat(temptotalcakeprice)%></h7>
             
            <%}
            %> 

        <TABLE BORDER="1" ALIGN="center">
                <tr>
                    <td>
                        <form method = "post">
                            <input type="text" name="coupon" value="DIS10" class="qty"/>
                            <input type="text" hidden name="totalcakeprice" id="totalcakeprice" value="<%=totalcakeprice%>">
                            <INPUT TYPE="SUBMIT" VALUE="Apply Coupon" formaction="disc.jsp" class="btn btn-info1 active"/>
                        </form>
                    </td>
                </tr>
            </table>
                            <%} else {
                            
                           if (temptotalcakeprice == null) {
                               %><h7>Total Cost = $ <%=totalcakeprice%></h7></br>
                              
            <%} else {%>
            <h7>Total Cost = $ <%=totalcakeprice%></h7></br>
            <h7>No Discount!</h7>
             
            <%}
            %>
              
<script>
function myFunction() {
    alert("Already availed this offer.Sorry No discount!");
}
</script>  
                            <TABLE BORDER="1" ALIGN="center">
                <tr>
                    
                    <td>
                        <form method = "post">
                            <input type="text" name="coupon" value="DIS10" class="qty"/>
                            
                            <INPUT TYPE="SUBMIT"  VALUE="Apply Coupon"  button onclick="myFunction()" class="btn btn-info1 active" />
                        </form>
                    </td>
                </tr>
            </table>
                            <%} %>
                            
            <TABLE ALIGN="right">
                <tr>

                    <td>
                        <form method = "post">
                            
                            <input type="text" hidden name="totalcakeprice" id="totalcakeprice" value="<%=totalcakeprice%>">
                            <INPUT TYPE="SUBMIT" VALUE="Proceed to checkout!" formaction="cust.jsp" class="btn btn-info1 active">
                            </br>
                        </form>
                    </td>
                </tr>
            </table>
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

