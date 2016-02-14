<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <%@ page import="java.io.*"%>
        <%@ page import="java.util.*"%>
        <%@page import="com.mongodb.*" %>
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
                    <%
                      
                            synchronized (session) {
                                try {
                                    //Get the values from the form
                                    String searchField = request.getParameter("searchField");
                                    String searchParameterUserName = request.getParameter("user");

                                    String searchParameterPassword = request.getParameter("pass");
                                    //Connect to Mongo DB
                                    MongoClient mongo = new MongoClient("localhost", 27017);
                                    // if database doesn't exists, MongoDB will create it for you
                                    DB db = mongo.getDB("CustomerReviews");
                                    DB db1 = mongo.getDB("Cake");
                                    DBCollection Login = db.getCollection("Login2");

                                    // Find and display 
                                    BasicDBObject searchQuery = new BasicDBObject();
                                    searchQuery.put("user", searchParameterUserName);
                                    searchQuery.put("pass", searchParameterPassword);
                                    DBCollection shop = db1.getCollection("shop");
                                    BasicDBObject searchQuery1 = new BasicDBObject();
                                    searchQuery1.put("title", "MongoDB");
                                    DBCursor cursor = Login.find(searchQuery);
                                    DBCursor cursor1 = shop.find(searchQuery1);
                    %>
                    <%
                if (cursor.count() == 0) {%>

                    <ul class="nav">
                        <li class="active"><a href="flavour.jsp"><b>Cakes by Flavour</b></a></li>
                        <li><a href="theme.jsp"><b>Cakes by Theme</b></a></li>
                        <li><a href="photo.jsp"><b>Photo Cakes</b></a></li>
                        <li><a href="addone.jsp"><b>Add-Ons</b></a></li>
                        <li><a href="userdetails.jsp"><b>Register/Login</b></a></li>

                    </ul>
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
<div class="span4">
                <ul class="nav nav-list">
    <li class="nav-header">What we are?</li>
    <li class="active"><a href="index.html">Home</a></li>
    <li><a href="#">About Us</a></li>
    <li><a href="#">Location & Hours</a></li>
    <li><a href="#">Reviews & Testimonials</a></li>
   
    <li class="nav-header">What we Offer</li>
    <li><a href="addproduct.jsp">Our Cakes</a></li>
    <li><a href="#">Gallery</a></li>
    <li><a href="#">Offers</a></li>
   
</ul>
            </div>
<div class="span8">
                <section class="group6">

                    <h1>There is no such user.</h1>
                    <h2>Please enter the below details to sign-up</h2>
                    <form method="post" action="login.jsp">
                        <table cellpadding="0" cellspacing="5">
                            <tr><td colspan="2"><b>Customer Information</b></td></tr>
                            <tr>
                                <td>First Name</td><td><input type="text" name="firstname" size="20"/></td>
                            </tr>

                            <tr>
                                <td>Last Name</td><td><input type="text" name="lastname" size="30" /></td>
                            </tr>
                            <tr>
                                <td>Username</td><td><input type="text" name="user" size="30" /></td>
                            </tr>
                            <tr>
                                <td>Password</td><td><input type="password" name="pass" size="30" /></td>
                            </tr>
                            <tr>
                                <td>Confirm Password</td><td><input type="password" name="password" size="30" /></td>
                            </tr>

                            <tr>
                                <td>Contact No</td><td><input type="text" name="phonenumber" size="30" /></td>
                            </tr>
                            <tr><td colspan="2"><hr /></td></tr>
                            <tr><td colspan="2"><b>Email Id</b></td></tr>
                            <tr>
                                <td>Email Id</td><td><input type="text" name="emailid" size="50" /></td>
                            </tr>

                            <hr>


                            <tr><td colspan="2"><hr /></td></tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <input type="submit" value="Sign-Up" />
                                    <input type="hidden" name="page_name" value="login" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </section>



            </div>

            <%

            } else {
                    session.setAttribute("user", searchParameterUserName);
                    String user=(String)session.getAttribute("user");
            %>
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
<div class="span4">
                 <form method="post" class="searchform" action="./FindCakes">

	    <ul class="nav nav-list">
            <li><h4><center>SHOP BY</center></h4></li>
            </ul>

            <ul class="nav nav-list">	
               <li>
                    <h4>Category</h4>
                   <ul class="nav nav-list">
                        <li><input type="checkbox" name="queryCheckBox" value="Cream"> Fresh Cream Cakes </li>

                        <li><input type="checkbox" name="queryCheckBox" value="Special"> Special Cakes </li>

                         <li><input type="checkbox" name="queryCheckBox" value="Premium"> Premium Cakes </li>
                          
                           <li><input type="checkbox" name="queryCheckBox" value="Mousse"> Mousse Cakes </li>
 
                          <li><input type="checkbox" name="queryCheckBox" value="Cheese"> Cheese Cakes </li>
                          <li><input type="checkbox" name="queryCheckBox" value="Eggless"> Eggless Cakes </li>



                    </ul>
                </li>

 	
               <li>
                    <h4>Theme</h4>
                    <ul class="nav nav-list">
                        <li><input type="checkbox" name="queryCheckBox" value="TwoTier"> 2 Tier Cakes </li>

                        <li><input type="checkbox" name="queryCheckBox" value="ThreeTier"> 3 Tier Cakes </li>

                         <li><input type="checkbox" name="queryCheckBox" value="Cartoon"> Cartoon Cakes </li>
                          
                           <li><input type="checkbox" name="queryCheckBox" value="Heart"> Heart Cakes </li>
 
                          <li><input type="checkbox" name="queryCheckBox" value="Wedding"> Wedding Cakes </li>
 
                          <li><input type="checkbox" name="queryCheckBox" value="Birthday"> Birthday Cakes </li>


                    </ul>

                </li>


             <li>
                 <h4>Weight</h4>
                    <ul class="nav nav-list">
                         <li><input type="checkbox" name="queryCheckBox" value="0.5"> Half Kg </li>

                          <li><input type="checkbox" name="queryCheckBox" value="1"> 1 Kg </li>

                </ul>

                </li>

<li>
                 <h4>Offers</h4>
                    <ul class="nav nav-list">
                         <li><input type="checkbox" name="queryCheckBox" value="Offers"> Offers </li>

                </ul>

                </li>
<li>
<h4><input type="checkbox" name="queryCheckBox" value="Price">Price </h4>
<ul class="nav nav-list">
<li><input type="text" name="Price" value="0" size=10 /></li>
<li><input type="radio" name="comparePrice" value="EQUALS_TO" checked> Equals</li>
<li><input type="radio" name="comparePrice" value="GREATER_THAN"> Greater Than</li>
<li><input type="radio" name="comparePrice" value="LESS_THAN"> Less Than
</li>
</ul>
</li>                 
                
   <li>
                 <h4>Flavour</h4>
                   <ul class="nav nav-list">
                         <li><input type="checkbox" name="queryCheckBox" value="BlackForest"> Black Forest </li>

                          <li><input type="checkbox" name="queryCheckBox" value="ButterScotch"> Butter Scotch </li>
                        
                          <li><input type="checkbox" name="queryCheckBox" value="Chocolate"> Chocolate </li>

                           <li><input type="checkbox" name="queryCheckBox" value="Pineapple"> Pineapple </li>
                           
                           <li><input type="checkbox" name="queryCheckBox" value="Strawberry"> Strawberry </li>
                         </ul>

                </li> 


                            <li>
                              <ul class="nav nav-list">
                                  <center><li colspan = "4"> 
                                          <input type="hidden" name="user" value="<%=user%>"/>
                                          <input type="submit" value="Search" class="btn btn-info1 active" /> </li></center></ul>
                                
                            </li>             
                
                
                
            </ul>
                          </form>

            </div>
<%session.setAttribute("user", searchParameterUserName);

              //response.sendRedirect("addprod.html");
        String usern = "";
        while (cursor.hasNext()) {

            BasicDBObject obj = (BasicDBObject) cursor.next();

            usern = obj.getString("user");
            if(usern.equals("ADMIN")){
                
                response.sendRedirect("admin.jsp?user="+usern);
            }else{
    %>
    <div class="span8">
        <h2>Welcome <%=usern%>!</h2>
        <%
            int i = 1;
            while (cursor1.hasNext()) {
                BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                String cakename = obj1.getString("cakename");
                String cakeprice = obj1.getString("cakeprice");
                String cakeunit = obj1.getString("cakeunit");
                String cakeimage = obj1.getString("cakeimage");
        %>
        <section class="group<%=i%>">
            <center><a class="photo_hover3"><img src="<%=cakeimage%>" width="120" height="137" alt=""></a></center> 
            <p><%=cakename%></p>
            <p><%=cakeunit%>| US <%=cakeprice%></p>
            <form  method = "post" action = "xboxone.jsp?cakeunit=<%=cakeunit%>&&cakename=<%=cakename%>">
                <input class = "button" type = "submit" name = "cakename" value = "Buy">
            </form>
                 <form  method = "post" action = "rev.jsp?cakeunit=<%=cakeunit%>&&cakename=<%=cakename%>&&user=<%=searchParameterUserName%>&&cakeprice=<%=cakeprice%>">
                <input class = "button" type = "submit" name = "cakename" value = "Review">
            </form>
            </section>
            <%
                    i++;
                    if (i == 4) {
                        i = 1;
                    }
                    
                }
            %>
       
    </div>

    <%}
                    }
                }

            } catch (MongoException e) {
                e.printStackTrace();
            }
        }
    } else {
                 
                    String user=(String)session.getAttribute("user");          
    %>
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
<div class="span4">
                 <form method="post" class="searchform" action="./FindCakes">

	    <ul class="nav nav-list">
            <li><h4><center>SHOP BY</center></h4></li>
            </ul>

            <ul class="nav nav-list">	
               <li>
                    <h4>Category</h4>
                   <ul class="nav nav-list">
                        <li><input type="checkbox" name="queryCheckBox" value="Cream"> Fresh Cream Cakes </li>

                        <li><input type="checkbox" name="queryCheckBox" value="Special"> Special Cakes </li>

                         <li><input type="checkbox" name="queryCheckBox" value="Premium"> Premium Cakes </li>
                          
                           <li><input type="checkbox" name="queryCheckBox" value="Mousse"> Mousse Cakes </li>
 
                          <li><input type="checkbox" name="queryCheckBox" value="Cheese"> Cheese Cakes </li>
                            <li><input type="checkbox" name="queryCheckBox" value="Eggless"> Eggless Cakes </li>


                    </ul>
                </li>

 	
               <li>
                    <h4>Theme</h4>
                    <ul class="nav nav-list">
                        <li><input type="checkbox" name="queryCheckBox" value="TwoTier"> 2 Tier Cakes </li>

                        <li><input type="checkbox" name="queryCheckBox" value="ThreeTier"> 3 Tier Cakes </li>

                         <li><input type="checkbox" name="queryCheckBox" value="Cartoon"> Cartoon Cakes </li>
                          
                           <li><input type="checkbox" name="queryCheckBox" value="Heart"> Heart Cakes </li>
 
                          <li><input type="checkbox" name="queryCheckBox" value="Wedding"> Wedding Cakes </li>
 
                          <li><input type="checkbox" name="queryCheckBox" value="Birthday"> Birthday Cakes </li>


                    </ul>

                </li>

             <li>
                 <h4>Weight</h4>
                    <ul class="nav nav-list">
                         <li><input type="checkbox" name="queryCheckBox" value="0.5"> Half Kg </li>

                          <li><input type="checkbox" name="queryCheckBox" value="1"> 1 Kg </li>

                </ul>

                </li>
<li>
                 <h4>Offers</h4>
                    <ul class="nav nav-list">
                         <li><input type="checkbox" name="queryCheckBox" value="Offers"> Offers </li>

                </ul>

                </li>

<li>
<h4><input type="checkbox" name="queryCheckBox" value="Price">Price </h4>
<ul class="nav nav-list">
<li><input type="text" name="Price" value="0" size=10 /></li>
<li><input type="radio" name="comparePrice" value="EQUALS_TO" checked> Equals</li>
<li><input type="radio" name="comparePrice" value="GREATER_THAN"> Greater Than</li>
<li><input type="radio" name="comparePrice" value="LESS_THAN"> Less Than
</li>
</ul>
</li>                 
                
   <li>
                 <h4>Flavour</h4>
                   <ul class="nav nav-list">
                         <li><input type="checkbox" name="queryCheckBox" value="BlackForest"> Black Forest </li>

                          <li><input type="checkbox" name="queryCheckBox" value="ButterScotch"> Butter Scotch </li>
                        
                          <li><input type="checkbox" name="queryCheckBox" value="Chocolate"> Chocolate </li>

                           <li><input type="checkbox" name="queryCheckBox" value="Pineapple"> Pineapple </li>
                           
                           <li><input type="checkbox" name="queryCheckBox" value="Strawberry"> Strawberry </li>
                         </ul>

                </li> 


                            <li>
                              <ul class="nav nav-list">
                                  <center><li colspan = "4"> 
                                          <input type="hidden" name="user" value="<%=user%>"/>
                                          <input type="submit" value="Search" class="btn btn-info1 active" /> </li></center></ul>
                                
                            </li>             
                
                
                
            </ul>
                          </form>

            </div>

<div class="span8">

    <h2 color="">Welcome <%=session.getAttribute("user")%>!</h2>
    
       
        <%String searchField = request.getParameter("searchField");
                                    String searchParameterUserName = request.getParameter("user");

                                    String searchParameterPassword = request.getParameter("pass");
                                    //Connect to Mongo DB
                                    MongoClient mongo = new MongoClient("localhost", 27017);
                                    // if database doesn't exists, MongoDB will create it for you
                                    DB db = mongo.getDB("CustomerReviews");
                                    DB db1 = mongo.getDB("Cake");
                                    DBCollection Login = db.getCollection("Login2");

                                    // Find and display 
                                    BasicDBObject searchQuery = new BasicDBObject();
                                    searchQuery.put("user", searchParameterUserName);
                                    searchQuery.put("pass", searchParameterPassword);
                                    DBCollection shop = db1.getCollection("shop");
                                    BasicDBObject searchQuery1 = new BasicDBObject();
                                    searchQuery1.put("title", "MongoDB");
                                    DBCursor cursor = Login.find(searchQuery);
                                    DBCursor cursor1 = shop.find(searchQuery1);
                    %>
                    <%
                if (cursor.count() == 0) {}else {
            int i = 1;
            while (cursor1.hasNext()) {
                BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                String cakename = obj1.getString("cakename");
                String cakeprice = obj1.getString("cakeprice");
                String cakeunit = obj1.getString("cakeunit");
                String cakeimage = obj1.getString("cakeimage");
        %>
        <section class="group<%=i%>">
            <a class="photo_hover3"><img src="<%=cakeimage%>" width="120" height="137" alt=""></a> 
            <p><%=cakename%></p>
            <p><%=cakeunit%>| US <%=cakeprice%></p>
            <form  method = "post" action = "xboxone.jsp?cakeunit=<%=cakeunit%>&&cakename=<%=cakename%>">
                <input class = "button" type = "submit" name = "cakename" value = "Buy">
            </form>
                <form  method = "post" action = "rev.jsp?cakeunit=<%=cakeunit%>&&cakename=<%=cakename%>&&user=<%=searchParameterUserName%>&&cakeprice=<%=cakeprice%>">
                <input class = "button" type = "submit" name = "cakename" value = "Review">
            </form>
            </section>
            <%
                    i++;
                    if (i == 4) {
                        i = 1;
                    }
                    
                }}
            %>
  
</div>
         <%
    }

%>
<footer>

    <div class="footer-content">
        <ul>
            <li><h4>Cake Shop</h4></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="#">Delivery Policy</a></li>
            <li><a href="#">Terms & Conditions</a></li>

        </ul>

        <ul>
            <li><h4>Shop</h4></li>
            <li><a href="birthday.jsp">Birthday Cakes</a></li>
            <li><a href="wedding.jsp">Wedding Cakes</a></li>
        </ul>

        <ul>
            <li><h4>Customer Service </h4></li>
            <li><a href="#">About your Order</a></li>
            <li><a href="#">Reviews/Complaints</a></li>

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
