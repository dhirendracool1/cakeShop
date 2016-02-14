
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
                          <li class="active"><a href="index.html"><b>Home</b></a></li>
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
    <li><a href="aboutus.html">About Us</a></li>
    <li><a href="aboutus.html">Location & Hours</a></li>
    <li><a href="testimonial.html">Reviews & Testimonials</a></li>
   
    <li class="nav-header">What we Offer</li>
    <li><a href="prod.jsp">Our Cakes</a></li>
    <li><a href="gallery.html">Gallery</a></li>
    
    <li><a href="offers.jsp">Offers</a></li>
   
</ul>
	       	</div>
     
     
            
            
                       
  <div class="span8">
      <section class="group6">
  <fieldset>
    <legend><h5>Login to buy!</h5></legend>
        
                  <img  src = "images/login.jpg" width = "200" height = "137" alt = "Login">
				
                         
				
					<form class = "" method = "post" action = "addproduct.jsp">
                                           
                                            <table>
        <tr>  <td>UserName: </td><td><input type="text" name="user" ></td></tr>
<tr>  <td>Password: </td><td><input type="password" name="pass"></td></tr>
         
<tr><td> Login: </td><td><input type ="submit" value="Submit" class="btn btn-info1 active"/></td></tr>
    
    </table>
         </form>
                  <font size ='5'>New Customer? <a href="signup.html">Start Here!</a></font>
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
 <%
      session.setAttribute("user", null);
      %>
     
        </body>
</html>

