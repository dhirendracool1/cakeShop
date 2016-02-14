<%@page import="com.mongodb.DBCursor"%>
<html>
  
<head>
<title>Cake Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
</head>



<%

	//private static final long serialVersionUID = 1L;
	MongoClient mongo = new MongoClient("localhost", 27017);
			//Get the values from the form
String cakename = request.getParameter("cakename");
String cakeunit = request.getParameter("cakeunit");
String caketype = request.getParameter("caketype");
String cakecategory = request.getParameter("cakecategory");
			String cakeprice = request.getParameter("cakeprice");
			String retailerZipcode = request.getParameter("retailerZipcode");
			String retailerCity = request.getParameter("retailerCity");
			String retailerState = request.getParameter("retailerState");
			String user = request.getParameter("user");
			int userAge = Integer.parseInt(request.getParameter("userAge"));
			String userGender = request.getParameter("userGender");
			int reviewRating = Integer.parseInt(request.getParameter("reviewRating"));
			String reviewDate = request.getParameter("reviewDate");
			String reviewText = request.getParameter("reviewText");
			//MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("Cake");
			// If the collection does not exists, MongoDB will create it for you
			DBCollection myReviews = db.getCollection("myReviews");

			BasicDBObject doc = new BasicDBObject("title", "MongoDB")
                                .append("cakename", cakename)
                                .append("cakeunit", cakeunit)
					.append("cakeprice", cakeprice)
                                .append("caketype", caketype)
                                .append("cakecategory", cakecategory)
                                .append("retailerZipcode", retailerZipcode)
                                .append("retailerCity", retailerCity)
                                .append("retailerState", retailerState)
					.append("user", user)
                                .append("userAge", userAge)
					.append("userGender", userGender)
                                .append("reviewRating", reviewRating)
                                .append("reviewDate", reviewDate)
					.append("reviewText", reviewText);

			myReviews.insert(doc);


%>

<body>  
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
        </div>


    </div>

            <div class="span12">
                <section class="group11">
                    
                        
                        <TABLE ALIGN="right top">
                <tr><td>
                        <form method = "post">
                            <INPUT TYPE="SUBMIT" VALUE="Back" formaction="addproduct.jsp" class="btn btn-info1 active"/>
                        </form></td></tr></table>
                    </br></br>
                    <fieldset>
    <legend><h5>Review Submitted</h5></legend>
    <table border="1">
    <TR>
                    <TH>Cake Name</TH>
                    <TH>Cake Unit</TH>
                    <TH>Cake Price</TH>
                    <TH>City</TH>
                    <TH>State</TH>
                    <TH>Zipcode</TH>
                    <TH>UserID</TH>
                    <TH>Age</TH>
                    <TH>Gender</TH>
                    <TH>Rating</TH>
                    <TH>Date of Review</TH>
                    <TH>Review Text</TH>
                </TR>
                
 
                <TR>
                    <TD><%=cakename%></TD>
                    <TD><%=cakeunit%></TD>
                    <TD>$ <%=cakeprice%></TD>
                    <TD><%=retailerCity%></TD>
                    <TD><%=retailerState%></TD>
                    <TD><%=retailerZipcode%></TD>
                    <TD><%=user%></TD>
                    <TD><%=userAge%></TD>
                    <TD><%=userGender%></TD>
                    <TD><%=reviewRating%></TD>
                    <TD><%=reviewDate%></TD>
                    <TD><%=reviewText%></TD>
                </TR>

    </TABLE>
    
    
    </fieldset>
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