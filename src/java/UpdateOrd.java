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
import com.mongodb.WriteResult;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

public class UpdateOrd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	public void init() {
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
		
	}

public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    HttpSession session = request.getSession();

		response.setContentType("text/html");
		
PrintWriter output = response.getWriter();
DB db = mongo.getDB("Cake");
     // If the collection does not exists, MongoDB will create it for you
		DBCollection coll = db.getCollection("order");
		
		BasicDBObject query = new BasicDBObject();
		// Get the form data
String cardname = request.getParameter("cardname");
String cardtype = request.getParameter("cardtype");
String cardno = request.getParameter("cardno");
String cakeprice = request.getParameter("cakeprice");
String cakeunit = request.getParameter("cakeunit");	
//String eggless = request.getParameter("eggless");
String cakename = request.getParameter("cakename");

String searchField = "orderid";
int searchOrderNo = Integer.parseInt(request.getParameter ("orderid"));

boolean noFilter = false;
boolean countOnly = false;
String[] filters = request.getParameterValues("queryCheckBox");

BasicDBObject doc1 = new BasicDBObject();
BasicDBObject doc2 = new BasicDBObject();
BasicDBObject doc3 = new BasicDBObject();
BasicDBObject doc4 = new BasicDBObject();
BasicDBObject doc5 = new BasicDBObject();
BasicDBObject doc6 = new BasicDBObject();
BasicDBObject doc7 = new BasicDBObject();


BasicDBObject searchQuery = new BasicDBObject().append(searchField, searchOrderNo);
DBCursor cursor = coll.find(searchQuery);

 while (cursor.hasNext()) {
					
BasicDBObject obj = (BasicDBObject) cursor.next();	
		if(filters != null)
{
for (int i = 0; i < filters.length; i++)
{
switch (filters[i])
{				
                                case "cardname":
                                doc1.append("$set",new BasicDBObject().append("cardname", cardname ));
				
                                break;
                                case "cardtype":
                                doc2.append("$set",new BasicDBObject().append("cardtype", cardtype ));
                                break;
                                case "cardno":
                                 doc3.append("$set",new BasicDBObject().append("cardno", cardno));
				break;
                                case "cakeprice":
                                 doc4.append("$set",new BasicDBObject().append("cakeprice", cakeprice));
				break;							
                                case "cakeunit":
                                 doc5.append("$set",new BasicDBObject().append("cakeunit", cakeunit));
				break;
                                
                                case "cakename":
                                 doc7.append("$set",new BasicDBObject().append("cakename", cakename));
				break;
                                					
                                                default:
						noFilter = true;
						break;						
					}
                                        }
                                        }
else{			noFilter = true;
			}
 }
WriteResult res = coll.update(searchQuery, doc1);
WriteResult res1 = coll.update(searchQuery, doc2);
WriteResult res2 = coll.update(searchQuery, doc3);
WriteResult res3 = coll.update(searchQuery, doc4);
WriteResult res4 = coll.update(searchQuery, doc5);
WriteResult res6 = coll.update(searchQuery, doc7);

    if(res.getN() == 0 && res1.getN() == 0 && res2.getN() == 0 && res3.getN() == 0 && res4.getN() == 0 && res6.getN() == 0){
				output.println("<h3>There is no such Order found.<br> Please Check your OrderNo Again.<p>");
			}else{
        
        constructPageTop(output);
        cursor = coll.find(query);
        constructDefaultContent(cursor, output, countOnly);
        constructPageBottom(output);
    }}
    
    public void constructPageTop(PrintWriter output){
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
					+ "<li class=\"active\"><a href=\"admin.jsp\"><b>Home</b></a></li>"
					+ "<li><a href=\"existing.html\"><b>Add Customer Order</b></a></li>"
                        + "<li><a href=\"existing.html\"><b>Delete Customer Order</b></a></li>"
                        + "<li><a href=\"existing.html\"><b>Update Customer Order</b></a></li>"
                        + "<li><a href=\"updatecust.html\"><b>Back</b></a></li>"
                        + "<li><a href=\"logout.jsp\"><b>Logout</b></a></li>"
					+ "</ul>"
					+ "</nav>"
					
            +"</form></div></div>"
                        +"<div class=\"span4\">"
                
+"<ul class=\"nav nav-list\">"
            + "<li class=\"active\"><a href=\"admin.jsp\">Home</a></li>"
					+ "<li><a href=\"existing.html\">Add Customer Order</a></li>"
                        + "<li><a href=\"existing.html\">Delete Customer Order</a></li>"
                        + "<li><a href=\"existing.html\">Update Customer Order</a></li>"
                        + "<li><a href=\"updatecust.html\">Back</a></li>"
                        + "<li><a href=\"logout.jsp\">Logout</a></li>"
        + "</ul></div>";
            
		output.println(myPageTop);		
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

	

public void constructDefaultContent(DBCursor cursor, PrintWriter output, boolean countOnly){
		int count = 0;
		String tableData = " ";
		String pageContent = " ";
                int i = 1;
output.print("<div class=\"span8\">");
output.print("<section class=\"group6\">");
		while (cursor.hasNext()) {
                BasicDBObject obj1 = (BasicDBObject) cursor.next();
                String cakename = obj1.getString("cakename");
                String cakeprice = obj1.getString("cakeprice");
                String cakeunit = obj1.getString("cakeunit");
                String cardname = obj1.getString("cardname");
                String cardtype = obj1.getString("cardtype");
                String cardno = obj1.getString("cardno");
                
			 pageContent="<fieldset>"
                                 + "<legend><h4>Updated Order</h4></legend>"
    +"<table border=\"1\">"
        +"<tr>"
        +"<td><h3>Cake Name</h3></td>"
+"<td><h3>"+cakename                         
+"</h3></td></tr>"
+"<tr>"
        +"<td><h3>Cake Unit</h3></td>"
+"<td><h3>"+cakeunit                         
+"</h3></td></tr>"
                                 +"<tr>"
        +"<td><h3>Cake Price</h3></td>"
+"<td><h3>"+cakeprice                         
+"</h3></td></tr>"
                           
                                 +"<tr>"
        +"<td><h3>Card Name</h3></td>"
+"<td><h3>"+cardname                         
+"</h3></td></tr>"
                                 +"<tr>"
        +"<td><h3>Card Type</h3></td>"
+"<td><h3>"+cardtype                        
+"</h3></td></tr>"
                                 +"<tr>"
        +"<td><h3>Card Number</h3></td>"
+"<td><h3>"+cardno                         
+"</h3></td></tr>"
+"</table></fieldset>";
                 output.print(pageContent);
		}
                 output.print("</section></div>");
                 

		
	}
	
	
}