<html>
  
<head>
<title>Cake Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@page import="com.mongodb.*"%>
<%@page import="java.util.*"%>

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

         <div class="span4">
	       		<ul class="nav nav-list">
    <li class="active"><a href="admin.jsp"><b>Home</b></a></li>
    <li class=""><a href="addstore.jsp"><b>Add products to Store</b></a></li>
                         <li class=""><a href="delstore.jsp"><b>Delete products from Store</b></a></li>
                         <li class=""><a href="updatestore.html"><b>Update products to Store</b></a></li>
                         <li class=""><a href="existing.html"><b>Add Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Delete Customer Order</b></a></li>
                         <li class=""><a href="existing.html"><b>Update Customer Order</b></a></li>
</ul>
	       	</div>
     
  <div class="span8">
      <section class="group6">
<%
                    response.setContentType("text/html");
                    session = request.getSession();
                    //ShoppingCart cart;

                    synchronized (session) {

                        try {
                                        //Get the values from the form

                            MongoClient mongo = new MongoClient("localhost", 27017);
                                        // if database doesn't exists, MongoDB will create it for you

                            DB db1 = mongo.getDB("Cake");
DBCollection temp_shop = db1.getCollection("temp_shop");
 BasicDBObject searchQuery2 = new BasicDBObject();

                            
                            String cakename = request.getParameter("cakename");
                            String cakeunit = request.getParameter("cakeunit");
                            //String cakeprice = request.getParameter("cakeprice");
                            String cakeimage = request.getParameter("cakeimage");
                            Float totalcost = Float.parseFloat(request.getParameter("cakeprice"));
                            String caketype = request.getParameter("caketype");
                            int numItems = Integer.parseInt(request.getParameter("numItems")); 
                            
                            searchQuery2.put("cakename", cakename);
                            DBCursor cursor = temp_shop.find(searchQuery2);
                            if (cursor.count()!=0){
                             String searchField = "cakename";
     

    
     BasicDBObject doc1 = new BasicDBObject();
     BasicDBObject doc2 = new BasicDBObject();
     BasicDBObject searchQuery = new BasicDBObject().append(searchField, cakename);
                        DBCursor cursor1 = temp_shop.find(searchQuery);
                       while (cursor1.hasNext()) {
					
					BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                                        numItems = obj1.getInt("numItems");
                                        Float cakeprice = Float.parseFloat(obj1.getString("cakeprice"));
                                        numItems= numItems+1;
                                        totalcost = cakeprice * numItems;
                                        

doc1.append("$set",new BasicDBObject().append("numItems", numItems));
doc2.append("$set",new BasicDBObject().append("totalcost", totalcost));
}

WriteResult res = temp_shop.update(searchQuery, doc1);
WriteResult res1 = temp_shop.update(searchQuery, doc2);
if(res.getN() == 0 && res1.getN() == 0)
{
BasicDBObject doc = new BasicDBObject("title", "temp_shop").				
append("totalcost", totalcost).
        append("numItems", numItems);

temp_shop.insert(doc);
}
                            }
                            else
                            {
                            String cakeprice = request.getParameter("cakeprice");
                            //String totalcakeprice1 = request.getParameter("");
                            //DBCollection shop = db1.getCollection("shop");
                            BasicDBObject searchQuery1 = new BasicDBObject();

                            String user = (String) session.getAttribute("user");
                            searchQuery1.put("user", user);
                            //DBCursor cursor1 = shop.find(searchQuery1);
                            //DBCollection temp_shop = db1.getCollection("temp_shop");
                            BasicDBObject doc = new BasicDBObject("title", "MongoDB")
                                    .append("user", user)
                                    .append("cakeunit", cakeunit)
                                    .append("cakename", cakename)
                                    .append("cakeprice", cakeprice)
                                    .append("totalcost", totalcost)
                                    .append("numItems", numItems)
                                    .append("caketype", caketype)
                                    .append("cakeimage", cakeimage);

                            temp_shop.insert(doc);
                        }} catch (MongoException e) {
                        e.printStackTrace();
                    } response.sendRedirect("orderPage.jsp");
                }
            %> 
			
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
