<html>
  
<head>
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
             <%
            
                String cakename = request.getParameter("cakename");
                String cakeunit = request.getParameter("cakeunit");
                String user = request.getParameter("user");
                String cakeprice = request.getParameter("cakeprice");
                String cakecategory = request.getParameter("cakecategory");
                String caketype = request.getParameter("caketype");
        %>
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
                <section class="group6">
                    <fieldset>
    <legend><h5>Submit Review</h5></legend>
                    <form method="post" class="searchform" action="review.jsp">

                        <table>

                            
                            <tr>
                                <td> Cake Name: </td>
                                <td>
                                   <b> <%=cakename%></b>
                                </td>
                            </tr>
<tr>
                                <td> Cake Unit: </td>
                                <td>
                                    <b><%=cakeunit%></b>
                                </td>
                            </tr>

                            <tr>
                                <td> Cake Price: </td>
                                <td>
                                    <b> $ <%=cakeprice%></b>
                            </tr>
                            <tr>
                                <td> Delivery Zip code: </td>
                                <td>
                                    <input type="number" name="retailerZipcode" size=10/> </td>
                            </tr>

                            <tr>
                                <td> Delivery City: </td>
                                <td>
                                    <input type="text" name="retailerCity" class="s" /> </td>
                            </tr>

                            <tr>
                                <td> Delivery State: </td>
                                <td>
                                    <input type="text" name="retailerState" class="s" /> </td>
                            </tr>

                           
                            <tr>
                                <td> User ID: </td>
                                <td>
                                    <b> <%=user%></b>
                            </tr>

                            <tr>
                                <td> User Age: </td>
                                <td>
                                    <input type="number" name="userAge" class="s" /> </td>
                            </tr>

                            <tr>
                                <td> User Gender: </td>
                                <td>
                                    <input type="radio" name="userGender" value="Male" /> Male
                                    <input type="radio" name="userGender" value="Female" /> Female</td>
                            </tr>

                            <tr>
                                <td> Review Rating: </td>
                                <td>
                                    <select name="reviewRating">
                                        <option value="1" selected>1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                </td>
                            </tr>

                            <tr>
                                <td> Review Date: </td>
                                <td>
                                    <input type="date" name="reviewDate" size=10/> </td>
                            </tr>

                            <tr>
                                <td> Review Text: </td>
                                <td>
                                    <textarea name="reviewText" rows="4" cols="50"> </textarea>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="hidden" name="cakename" value="<%=cakename%>">
                                    <input type="hidden" name="cakeunit" value="<%=cakeunit%>">
                                    <input type="hidden" name="user" value="<%=user%>">
                                    <input type="hidden" name="cakeprice" value="<%=cakeprice%>">
                                    <input type="hidden" name="cakecategory" value="<%=cakecategory%>">
                                    <input type="hidden" name="caketype" value="<%=caketype%>">
                                    <input type="submit" value="Submit Review" class="btn btn-info1 active" /> </td>
                                <td></td>
                            </tr>

                        </table>
                    </form>
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