import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import com.mongodb.AggregationOutput;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

public class Testimonial extends HttpServlet {
	

	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	public void init() {
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
		
	}

public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    HttpSession session = request.getSession();

		response.setContentType("text/html");
		
PrintWriter output = response.getWriter();
					
DB db = mongo.getDB("Cake");
                
  
		
		
			// If the collection does not exists, MongoDB will create it for you
DBCollection myReviews = db.getCollection("myReviews");

	
		
		BasicDBObject query = new BasicDBObject();
		DBCursor dbCursor=null;
                
			// Get the form data
			String Cream = request.getParameter("Cream");
 String Special = request.getParameter("Special");
 
String Premium = request.getParameter("Premium");
String Mousse = request.getParameter("Mousse");	
String Cheese = request.getParameter("Cheese");
String Eggless = request.getParameter("Eggless");
String TwoTier = request.getParameter("TwoTier");
String ThreeTier = request.getParameter("ThreeTier");
String Cartoon = request.getParameter("Cartoon");
String Heart = request.getParameter("Heart");
String Wedding = request.getParameter("Wedding");
String Birthday = request.getParameter("Birthday");

String BlackForest = request.getParameter("BlackForest");
String ButterScotch = request.getParameter("ButterScotch");
String Chocolate = request.getParameter("Chocolate");
String Pineapple = request.getParameter("Pineapple");
String Strawberry = request.getParameter("Strawberry");
String comparePrice = request.getParameter("comparePrice");
boolean noFilter = false;
boolean countOnly = false;
String[] filters = request.getParameterValues("queryCheckBox");
		
		if(filters != null)
{
for (int i = 0; i < filters.length; i++)
{
switch (filters[i])
{										
                                case "Cream":						
                                query.put("caketype", "cream");
                                break;
                                case "Special":
				query.put("caketype", "special");
				break;
                                case "Premium":
				query.put("caketype", "premium");
				break;							
                                case "Mousse":
                                query.put("caketype", "mousse");
				break;
                                case "Cheese":
				query.put("caketype", "cheese");
				break;
                                case "TwoTier":
				query.put("caketype", "two_tier");
				break;
                                case "ThreeTier":
				query.put("caketype", "three_tier");
				break;
                                case "Cartoon":
				query.put("caketype", "cartoon");
				break;
                                case "Heart":
				query.put("caketype", "heart");
                                break;               
                                case "Wedding":
				query.put("caketype", "wedding");
				break;
                                case "Birthday":
				query.put("caketype", "birthday");
				break;
                                case "Eggless":			
				query.put("caketype", "eggless");
				break;
                                case "BlackForest":
				query.put("cakename", "Black Forest Cake");
				break;
                                case "ButterScotch":
                                query.put("cakename", "Butter Scotch Cake");
				break;
                                case "Chocolate":
				query.put("cakename", "Chocolate Truffle Cake");
				break;					
                                case "Pineapple":
				query.put("cakename", "Pineapple Cake");
				break;
                                case "Strawberry":
				query.put("cakename", "Strawberry cake");
				break;
                                					
                                                default:
						noFilter = true;
						break;						
					}
                                        }
                                        }
else{			noFilter = true;
			}
			
						
			String sessiontp= (String) session.getAttribute("user");
			//Construct the top of the page
                if((String)session.getAttribute("user")==null)
                {
                    
			constructPageTop1(output);
                        dbCursor = myReviews.find(query);
constructDefaultContent1(dbCursor, output, countOnly);
                }
                else
                {
                    constructPageTop(output, request);
                    dbCursor = myReviews.find(query);
constructDefaultContent(dbCursor, request, output, countOnly);
                }
			//Run the query 
                                
					

					//Construct the bottom of the page
constructPageBottom(output);
	
				
}	
public void constructPageTop(PrintWriter output, HttpServletRequest request){
		String myPageTop = "<!DOCTYPE html>" + "<html lang=\"en\">"
					+ "<head>	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />"
					+ "<title>Cake Shop</title>"
					+ "<link rel=\"stylesheet\" href=\"styles1.css\" type=\"text/css\" />"
					+ "</head>"
					+ "<body>"
					+ "<div id=\"container\">"
                         +"<div class=\"navbar\">"
                +"<div class=\"navbar-inner\">"
					+ "<ul class=\"nav\">"
					+ "<li class=\"active\"><a href=\"flavour.jsp\"><b>Cakes by Flavour</b></a></li>"
					+ "<li><a href=\"theme.jsp\"><b>Cakes by Theme</b></a></li>"
                        + "<li><a href=\"photo.jsp\"><b>Photo Cakes</b></a></li>"
                        + "<li><a href=\"addone.jsp\"><b>Add-Ons</b></a></li>"
                        + "<li><a href=\"trackorder.html\"><b>Track Your Package</b></a></li>"
                       
                        + "<li><a href=\"logout.jsp\"><b>Logout</b></a></li>"
					+ "</ul>"
					+ "</nav>"
					+"<div align=\"right\">"
                +"<a href=\"orderPage.jsp\">"
                        + "<img src=\"images/cart.png\" alt=\"\"/></a></div>"
                        +"<form class=\"search\" action=\"\" method=\"get\">"
+"<b>Search</b> <input type=\"text\" class=\"search-query\" placeholder=\"Enter Keyword here\"/>"
                +"<button type=\"button\" class=\"btn btn-info active\">Go</button>"
            +"</form></div></div>"
                        +"<div class=\"span4\">"
                 +"<form method=\"post\" class=\"searchform\" action=\"FindCakes\">"
+"<ul class=\"nav nav-list\">"
            +"<li><h4><center>SHOP BY</center></h4></li>"
            +"</ul><ul class=\"nav nav-list\"><li>"
                    +"<h4>Category</h4>"
                   +"<ul class=\"nav nav-list\">"
                    +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Cream\"> Fresh Cream Cakes </li>"
+"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Special\"> Special Cakes </li>"
+"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Premium\"> Premium Cakes </li>"
    +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Mousse\"> Mousse Cakes </li>"
 +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Cheese\"> Cheese Cakes </li>"
                   + "</ul></li>"
               +"<li>"
               +"<h4>Theme</h4>"
               +"<ul class=\"nav nav-list\">"
               +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"TwoTier\"> 2 Tier Cakes </li>"
               +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"ThreeTier\"> 3 Tier Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Cartoon\"> Cartoon Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Heart\"> Heart Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Wedding\"> Wedding Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Birthday\"> Birthday Cakes </li>"
                +"</ul></li>"
                
             +"<li>"
                 +"<h4>Weight</h4>"
                 +"<ul class=\"nav nav-list\">"
                 +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"0.5\"> Half Kg </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"1\"> 1 Kg </li>"
                +"</ul></li>"
                        +"<li>"
                 +"<h4>Offers</h4>"
                 +"<ul class=\"nav nav-list\">"
                 +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Offers\"> Offers </li>"
                +"</ul></li>"
             +"<li>"
            +"<h4><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Price\">Price </h4>"    
            +"<ul class=\"nav nav-list\">"
            +"<li><input type=\"text\" name=\"Price\" value=\"0\" size=10 /></li>"
            +"<li><input type=\"radio\" name=\"comparePrice\" value=\"EQUALS_TO\" checked> Equals</li>"
            +"<li><input type=\"radio\" name=\"comparePrice\" value=\"GREATER_THAN\"> Greater Than</li>"
            +"<li><input type=\"radio\" name=\"comparePrice\" value=\"LESS_THAN\"> Less Than</li>"
            +"</ul></li>"                
         +"<li>"
          +"<h4>Flavour</h4>"
          +"<ul class=\"nav nav-list\">"
          +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"BlackForest\"> Black Forest </li>"
        +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"ButterScotch\"> Butter Scotch </li>"
          +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Chocolate\"> Chocolate </li>"
            +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Pineapple\"> Pineapple </li>"
            +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Strawberry\"> Strawberry </li>"
            +"</ul></li>"
        +"<li>"
            +"<ul class=\"nav nav-list\">"
        +"<center><li colspan = \"4\"> <input type=\"submit\" value=\"Search\" class=\"btn btn-info1 active\" /> </li></center>"
        + "</ul></li>" 
               +"</ul></form></div>";
            
		output.println(myPageTop);		
	}


public void constructPageTop1(PrintWriter output){
		String myPageTop1 = "<!DOCTYPE html>" + "<html lang=\"en\">"
					+ "<head>	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />"
					+ "<title>Cake Shop</title>"
					+ "<link rel=\"stylesheet\" href=\"styles1.css\" type=\"text/css\" />"
					+ "</head>"
					+ "<body>"
					+ "<div id=\"container\">"
                         +"<div class=\"navbar\">"
                +"<div class=\"navbar-inner\">"
					+ "<ul class=\"nav\">"
					+ "<li class=\"active\"><a href=\"flavour.jsp\"><b>Cakes by Flavour</b></a></li>"
					+ "<li><a href=\"theme.jsp\"><b>Cakes by Theme</b></a></li>"
                        + "<li><a href=\"photo.jsp\"><b>Photo Cakes</b></a></li>"
                        + "<li><a href=\"addone.jsp\"><b>Add-Ons</b></a></li>"
                        
					+ "</ul>"
					+ "</nav>"
					
                        +"<form class=\"search\" action=\"\" method=\"get\">"
+"<b>Search</b> <input type=\"text\" class=\"search-query\" placeholder=\"Enter Keyword here\"/>"
                +"<button type=\"button\" class=\"btn btn-info active\">Go</button>"
            +"</form></div></div>"
                        +"<div class=\"span4\">"
                 +"<form method=\"post\" class=\"searchform\" action=\"FindCakes\">"
+"<ul class=\"nav nav-list\">"
            +"<li><h4><center>SHOP BY</center></h4></li>"
            +"</ul><ul class=\"nav nav-list\"><li>"
                    +"<h4>Category</h4>"
                   +"<ul class=\"nav nav-list\">"
                    +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Cream\"> Fresh Cream Cakes </li>"
+"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Special\"> Special Cakes </li>"
+"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Premium\"> Premium Cakes </li>"
    +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Mousse\"> Mousse Cakes </li>"
 +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Cheese\"> Cheese Cakes </li>"
                   + "</ul></li>"
               +"<li>"
               +"<h4>Theme</h4>"
               +"<ul class=\"nav nav-list\">"
               +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"TwoTier\"> 2 Tier Cakes </li>"
               +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"ThreeTier\"> 3 Tier Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Cartoon\"> Cartoon Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Heart\"> Heart Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Wedding\"> Wedding Cakes </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Birthday\"> Birthday Cakes </li>"
                +"</ul></li>"
                
             +"<li>"
                 +"<h4>Weight</h4>"
                 +"<ul class=\"nav nav-list\">"
                 +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"0.5\"> Half Kg </li>"
                +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"1\"> 1 Kg </li>"
                +"</ul></li>"
                        +"<li>"
                 +"<h4>Offers</h4>"
                 +"<ul class=\"nav nav-list\">"
                 +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Offers\"> Offers </li>"
                +"</ul></li>"
             +"<li>"
            +"<h4><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Price\">Price </h4>"    
            +"<ul class=\"nav nav-list\">"
            +"<li><input type=\"text\" name=\"Price\" value=\"0\" size=10 /></li>"
            +"<li><input type=\"radio\" name=\"comparePrice\" value=\"EQUALS_TO\" checked> Equals</li>"
            +"<li><input type=\"radio\" name=\"comparePrice\" value=\"GREATER_THAN\"> Greater Than</li>"
            +"<li><input type=\"radio\" name=\"comparePrice\" value=\"LESS_THAN\"> Less Than</li>"
            +"</ul></li>"                
         +"<li>"
          +"<h4>Flavour</h4>"
          +"<ul class=\"nav nav-list\">"
          +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"BlackForest\"> Black Forest </li>"
        +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"ButterScotch\"> Butter Scotch </li>"
          +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Chocolate\"> Chocolate </li>"
            +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Pineapple\"> Pineapple </li>"
            +"<li><input type=\"checkbox\" name=\"queryCheckBox\" value=\"Strawberry\"> Strawberry </li>"
            +"</ul></li>"
        +"<li>"
            +"<ul class=\"nav nav-list\">"
        +"<center><li colspan = \"4\"> <input type=\"submit\" value=\"Search\" class=\"btn btn-info1 active\" /> </li></center>"
        + "</ul></li>" 
               +"</ul></form></div>";
            
		output.println(myPageTop1);		
	}

public void constructPageBottom(PrintWriter output){
		String myPageBottom = "<footer>"
				+"<div class=\"footer-content\">"
        +"<ul>"
            +"<li><h4>Cake Shop</h4></li>"
            +"<li><a href=\"aboutus.html\">About Us</a></li>"
            +"<li><a href=\"aboutus.html\">Contact Us</a></li>"
            +"<li><a href=\"aboutus.html\">Delivery Policy</a></li>"
            +"<li><a href=\"aboutus.html\">Terms & Conditions</a></li></ul>"
          +"<ul>"
            +"<li><h4>Shop</h4></li>"
            +"<li><a href=\"birthday.jsp\">Birthday Cakes</a></li>"
           
            +"<li><a href=\"wedding.jsp\">Wedding Cakes</a></li></ul>"
           +"<ul>"
            +"<li><h4>Customer Service </h4></li>"
            +"<li><a href=\"userdetails.jsp\">About your Order</a></li>"
            +"<li><a href=\"testimonial.html\">Reviews/Complaints</a></li></ul>"
        +"<ul>"
            +"<li><h4>Connect with Us</h4></li>"
            +"<li>"
                +"<img src=\"images/fb.png\" alt=\"\"/>  </li>"
            +"<li><img src=\"images/twitter.jpg\" alt=\"\"/> </li> </ul>"
        +"</div>"
        +"<div class=\"footer-bottom\">"
        +"<p> <span>&copy; 2015 All Rights Reserved </span>&nbsp;&nbsp;|&nbsp;&nbsp; CSP 595 Cake Website by Team 17</p>"
    +"</div>"
       + "</footer>"
					+ "</div>"
					+ "</body>"
					+ "</html>";
		
		output.println(myPageBottom);
	}

	

public void constructDefaultContent(DBCursor dbCursor, HttpServletRequest request, PrintWriter output, boolean countOnly){
		int count = 0;
                int r =0 ;
                int rating = 0;
		String tableData = " ";
		String pageContent = " ";
                int i = 1;
			String ReviewRating = "";
                        String ReviewText = "";
                        String User = "";
                        String user=request.getParameter("user");
                        
                        
output.print("<div class=\"span8\">");

		while (dbCursor.hasNext()) {
                BasicDBObject obj1 = (BasicDBObject) dbCursor.next();
                ReviewRating  = obj1.getString("reviewRating");
                ReviewText = obj1.getString("reviewText");
                rating = Integer.parseInt(ReviewRating);
                User = obj1.getString("user");
               
                tableData =  "<table border=\"1\"><tr><td><font size =\"5\">Review by: <b>     " + User + " </b></font></td></tr>"
						+ "<tr><td><font size =\"5\">Review Rating:<b> " + ReviewRating + "</b></font></td></tr>"
						
						+ "<tr><td><font size =\"5\">Review Text: <b> " + ReviewText + "</b></font></td></tr></table>";
			
                         
                         count++;
                        r= r+rating;
                        
				
				
				pageContent = "<table class = \"query-table\">"+tableData+"</table></br>";		
			    output.println(pageContent);
		}

		//No data found
		if(count == 0){
			pageContent = "<h1>No Data Found</h1><br>Be the First to Review the Cake";
			output.println(pageContent);
		}
		
	
                 output.print("</div>");


		
	}

public void constructDefaultContent1(DBCursor dbCursor, PrintWriter output, boolean countOnly){
		int count = 0;
                int r =0 ;
                int rating = 0;
		String tableData = " ";
		String pageContent = " ";
                int i = 1;
			String ReviewRating = "";
                        String ReviewText = "";
                        String User = "";
                        String CakeName = "";
                        
                        
output.print("<div class=\"span8\">");
output.print("<section group=\"6\">");

		while (dbCursor.hasNext()) {
                BasicDBObject obj1 = (BasicDBObject) dbCursor.next();
                ReviewRating  = obj1.getString("reviewRating");
                ReviewText = obj1.getString("reviewText");
                rating = Integer.parseInt(ReviewRating);
                CakeName = obj1.getString("cakename");
                User = obj1.getString("user");
               
                tableData =  "<table border=\"1\"><tr><td><font size =\"5\">Review by: <b>     " + User + " </b></font></td></tr>"
						+ "<tr><td><font size =\"5\">Review Rating:<b> " + ReviewRating + "</b></font></td></tr>"
						
						+ "<tr><td><font size =\"5\">Review Text: <b> " + ReviewText + "</b></font></td></tr></table>";
			
                         
                         count++;
                        r= r+rating;
                        
				
				//output.println("<h3>Overall Rating:" +r/count+"</h3>");
				pageContent = "<table class = \"query-table\">"+tableData+"</table></br>";		
			    output.println(pageContent);
		}

		//No data found
		if(count == 0){
			pageContent = "<h1>No Data Found</h1><br>Be the First to Review the Cake";
			output.println(pageContent);
		}
		
	output.print("</section>");
                 output.print("</div>");


		
	}
	
}				//Construct the page content

      



