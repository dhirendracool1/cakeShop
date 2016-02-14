<%@page import="com.mongodb.WriteResult"%>
<%@page import="com.mongodb.WriteResult"%>
<%@page import="com.mongodb.DBCursor"%>
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
                    
                    
               
	
<%
MongoClient mongo = new MongoClient("localhost", 27017);
			//Get the values from the form
String cakename = request.getParameter("cakename");
    String cakecategory = request.getParameter("cakecategory");
      String caketype = request.getParameter("caketype");
      String numItems = request.getParameter("numItems");
      String cakeunit = request.getParameter("cakeunit");
      String cakeprice = request.getParameter("cakeprice");
	String cakeimage = request.getParameter("cakeimage");		
     String searchField = "cakename";
     String update = "cakeunit";
     String update1 = "cakeprice";
     String update2 = "cakename";
     String update3 = "cakecategory";
     String update4 = "caketype";
     String update5 = "numItems";
     String update6 = "cakeimage";
   
    	DB db = mongo.getDB("Cake");
			
	DBCollection store1 = db.getCollection("shop");
    
  BasicDBObject doc1 = new BasicDBObject();
  BasicDBObject doc2 = new BasicDBObject();
  BasicDBObject doc3 = new BasicDBObject();
  BasicDBObject doc4 = new BasicDBObject();
  BasicDBObject doc5 = new BasicDBObject();
  BasicDBObject doc6 = new BasicDBObject();
  BasicDBObject doc7 = new BasicDBObject();
        
			BasicDBObject searchQuery = new BasicDBObject().append(searchField, cakename);
                        DBCursor cursor = store1.find(searchQuery);
                        BasicDBObject searchQuery1 = new BasicDBObject();
                                    searchQuery1.put("cakename", cakename);
                                    searchQuery1.put("caketype", caketype);
                                    DBCursor cursor1 = store1.find(searchQuery1);
                       
                        while (cursor.hasNext()) {
					
					BasicDBObject obj = 
(BasicDBObject) cursor.next();	

doc1.append("$set",new BasicDBObject().append(update, cakeunit));
doc2.append("$set",new BasicDBObject().append(update1, cakeprice));
doc3.append("$set",new BasicDBObject().append(update2, cakename));
doc4.append("$set",new BasicDBObject().append(update3, cakecategory));
doc5.append("$set",new BasicDBObject().append(update4, caketype));
doc6.append("$set",new BasicDBObject().append(update5, numItems));
doc7.append("$set",new BasicDBObject().append(update6, cakeimage));
}

WriteResult res = store1.update(searchQuery, doc1);
WriteResult res1 = store1.update(searchQuery, doc2);
WriteResult res2 = store1.update(searchQuery, doc3);
WriteResult res3 = store1.update(searchQuery, doc4);
WriteResult res4 = store1.update(searchQuery, doc5);
WriteResult res5 = store1.update(searchQuery, doc6);
WriteResult res6 = store1.update(searchQuery, doc7);
if(res.getN() == 0 && res1.getN() == 0 && res2.getN() == 0 && res3.getN() == 0 && res4.getN() == 0 && res5.getN() == 0 && res6.getN() == 0)
{
BasicDBObject doc = new BasicDBObject("title", "store1").				
append("cakename", cakename).
        append("cakeprice", cakeprice).
        append("caketype", caketype).
        append("numItems", numItems).
        append("cakecategory", cakecategory).
        append("cakeimage", cakeimage).
append("cakeunit", cakeunit);

store1.insert(doc);
}

while (cursor1.hasNext()) {
					
					BasicDBObject obj = (BasicDBObject) cursor1.next();

 %>
<fieldset>
    <legend><h5>Products Updated to Store!</h5></legend>
<table border="1"><TR>    
        <TD colspan="3"><b><font size="5">Cake Name</td> <td colspan="3"><b><font size="5"> <%=cakename%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Cake Category</td> <td colspan="3"> <b><font size="5"><%=cakecategory%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Cake Type</td> <td colspan="3"><b><font size="5"> <%=caketype%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Cake Unit</td> <td colspan="3"> <b><font size="5"><%=cakeunit%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Cake Price</td> <td colspan="3"><b><font size="5"> <%=cakeprice%></b></TD></tr>
                   <TR>    
        <TD colspan="3"><b><font size="5">Number of Items</td> <td colspan="3"><b><font size="5"> <%=numItems%></b></TD></tr>
</table>
</fieldset>
<%}%>
     
                </section>
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