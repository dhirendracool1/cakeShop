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
            
                    <%
                       
                            synchronized (session) {
                                try {
                                    //Get the values from the form
                                   // String searchField = request.getParameter("searchField");
                                    //String searchParameterUserName = request.getParameter("user");
String user = (String)session.getAttribute("user");
                                   // String searchParameter = request.getParameter("");
                                    //Connect to Mongo DB
                                    MongoClient mongo = new MongoClient("localhost", 27017);
                                    // if database doesn't exists, MongoDB will create it for you
                                    //DB db = mongo.getDB("CustomerReviews");
                                    DB db1 = mongo.getDB("Cake");
                                    //DBCollection Login = db.getCollection("Login2");

                                    // Find and display 
                                    //BasicDBObject searchQuery = new BasicDBObject();
                                    //searchQuery.put("user", searchParameterUserName);
                                    //searchQuery.put("pass", searchParameterPassword);
                                    DBCollection shop = db1.getCollection("shop");
                                    BasicDBObject searchQuery1 = new BasicDBObject();
                                    searchQuery1.put("cakecategory", "theme");
                                    //DBCursor cursor = Login.find(searchQuery);
                                    DBCursor cursor1 = shop.find(searchQuery1);
                    %>
                    <%
                if (cursor1.count() == 0) {
                    if (user== null){%>
                    <div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav">
                <li class="active"><a href="flavour.jsp"><b>Cakes by Flavour</b></a></li>
                <li><a href="theme.jsp"><b>Cakes by Theme</b></a></li>
                <li><a href="photo.jsp"><b>Photo Cakes</b></a></li>
                <li><a href="addone.jsp"><b>Add-Ons</b></a></li>
                 <li><a href="index.html"><b>Home</b></a></li>
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
                        <H2><I></br>No items in the store...</I></H2></div>
            <%} else{%>
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
                        <H2><I></br>No items in the store...</I></H2></div>
           <% }} else {
                    //session.setAttribute("user", searchParameterUserName);
            %>
<%if (user== null){%>           
<div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav">
                <li class="active"><a href="flavour.jsp"><b>Cakes by Flavour</b></a></li>
                <li><a href="theme.jsp"><b>Cakes by Theme</b></a></li>
                <li><a href="photo.jsp"><b>Photo Cakes</b></a></li>
                <li><a href="addone.jsp"><b>Add-Ons</b></a></li>
                 <li><a href="index.html"><b>Home</b></a></li>
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
<%} else {%>
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
<%}%>

    <div class="span8">
        <%if (user== null){%>
        <h2>Welcome Guest!</h2>
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
            <a class="photo_hover3"><img src="<%=cakeimage%>" width="120" height="137" alt=""></a> 
            <p><%=cakename%></p>
            <p><%=cakeunit%>| US <%=cakeprice%></p>
            <form  method = "post" action = "userdetails.jsp">
                <input class = "button" type = "submit" name = "cakename" value = "Buy">
            </form>
            </section>
            <%
                    i++;
                    if (i == 4) {
                        i = 1;
                    }
                    
                }
            %>  

<%}else {%>
        <h2>Welcome <%=user%>!</h2>
        <%}%>
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
            <a class="photo_hover3"><img src="<%=cakeimage%>" width="120" height="137" alt=""></a> 
            <p><%=cakename%></p>
            <p><%=cakeunit%>| US <%=cakeprice%></p>
            <form  method = "post" action = "xboxone.jsp?cakeunit=<%=cakeunit%>&&cakename=<%=cakename%>">
                <input class = "button" type = "submit" name = "cakename" value = "Buy">
            </form>
                <form  method = "post" action = "rev.jsp?cakeunit=<%=cakeunit%>&&cakename=<%=cakename%>&&user=<%=user%>&&cakeprice=<%=cakeprice%>">
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
