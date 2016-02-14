
<html lang="en" dir="ltr">
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
<div class="span4">
	       		<ul class="nav nav-list">
    <li class="nav-header">What we are?</li>
    <li class="active"><a href="index.html">Home</a></li>
    <li><a href="aboutus.html">About Us</a></li>
    <li><a href="aboutus.html">Location & Hours</a></li>
    <li><a href="testimonial.html">Reviews & Testimonials</a></li>
   
    <li class="nav-header">What we Offer</li>
    <li><a href="addproduct.jsp">Our Cakes</a></li>
    <li><a href="gallery.html">Gallery</a></li>
    <li><a href="userdetails.jsp">Your Order</a></li>
    <li><a href="offers.jsp">Offers</a></li>
   
</ul>
	       	</div>
     <%
     String totalcakeprice = request.getParameter("totalcakeprice");
     
     %>
     
                       
  <div class="span8">
      <section class="group6">
         <fieldset>
    <legend><h5>Checkout</h5></legend> </fieldset>
    <h2>Please enter the details below!</h2>
    <form method="get" action="customer.jsp">
      <table cellpadding="0" cellspacing="5">
        
        <tr><td colspan="2"><b>Delivery Information</b></td></tr>
        
        <tr>
          <td>First Name</td><td><input type="text" name="firstname" size="20"/></td>
        </tr>
        
        <tr>
          <td>Last Name</td><td><input type="text" name="lastname" size="30" /></td>
        </tr>
        <tr>
            <td>Delivery Date</td><td><input type="text" name="deliverydate" placeholder="DD/MM/YYYY" /></td>
        </tr>
        <tr>
            <td>Shipping Address</td><td><input type="text" name="shipadd" size="30" /></td>
        </tr>
        <tr>
            <td>City</td><td><input type="text" name="city" size="30" /></td>
        </tr>
        <tr>
            <td>State</td><td><input type="text" name="state" size="30" /></td>
        </tr>
        <tr>
            <td>Zipcode</td><td><input type="text" name="zipcode" size="30" /></td>
        </tr>
        <tr>
            <td>Country</td><td><input type="text" name="country" size="30" /></td>
        </tr>
        
        <tr>
          <td>Contact No</td><td><input type="text" name="phone" size="30" /></td>
        </tr>
        
        <tr><td colspan="2"><b>Payment Information</b></td></tr>
        <tr>
          <td>Credit Card Name</td><td><input type="text" name="cardname" value="" id="card_number"/>
        </tr>
        <tr>
          <td>Credit Card Type</td><td>
             <input type ="radio" name="cardtype" value="Mastercard"/>MasterCard</br>
                <input type ="radio" name="cardtype" value="Visa"/>Visa</br>
                <input type ="radio" name="cardtype" value="Discover"/>Discover</td>
        </tr>
        <tr>
          <td>Credit Card No</td><td><input type="text" name="cardno" value="" id="card_number" placeholder="xxxx-xxxx-xxxx-xxxx" data-trigger="change" data-validation-minlength="1" data-type="name" data-required="true" data-error-message="Enter Your Credit Card Number"/>
        </tr>
        <tr>
          <td>CVV No</td><td><input type="text" name="cvv" value="" id="cvv" placeholder="xxx">
        </tr>
        <tr>
          <td>Expiration Date</td><td><input type="date" id="pwd" placeholder="DD/MM/YYYY">
        </tr>
        
 
        <tr><td colspan="2"><hr /></td></tr>
        <tr>
          
          <td>
              <input type="text" hidden name="totalcakeprice" id="totalcakeprice" value="<%=totalcakeprice%>">
              
            <input type="submit" value="Finalize Order!" class="btn btn-info1 active"  />
            <input type="hidden" name="page_name" value="login" />
          </td>
        </tr>
      </table>
    </form>
    
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