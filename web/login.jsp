
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.mongodb.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
         <link rel="stylesheet" href="style.css" type="text/css" />
    </head>
    <body color='#6495ed'>
        <h1 align='center'></br>Login details Saved in to the database</h1></body>
        <%
            try{
			//Get the values from the form
			String Firstname = request.getParameter("firstname");
			String Lastname = request.getParameter("lastname");
			//int rating = Integer.parseInt(request.getParameter("rating"));
			//int Price = Integer.parseInt(request.getParameter("acc_price"));
			String phonenumber = request.getParameter("phonenumber");	
                        String Emailid = request.getParameter("emailid");
                        String User = request.getParameter("user");	
                        String Pass = request.getParameter("pass");
			// Connect to Mongo DB
			MongoClient mongo = new MongoClient("localhost", 27017);
						
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CustomerReviews");
			
			// If the collection does not exists, MongoDB will create it for you
			DBCollection Login = db.getCollection("Login2");
			System.out.println("Collection login selected successfully");
			
			BasicDBObject doc = new BasicDBObject("title", "MongoDB").
				append("firstname", Firstname).
				append("lastname", Lastname).
				append("phonenumber", phonenumber).
                                append("user", User).
                                append("pass", Pass).
			append("emailid", Emailid);
				
			Login.insert(doc);
			
			System.out.println("Document inserted successfully");
                              } catch (MongoException e) {
		e.printStackTrace();
                
	    }response.sendRedirect("userdetails.jsp");
            %>
    <nav>
    	<ul>
        <li class='start selected'><a href='index.html'>
        </br>
        <li class='end'><a href='userdetails.jsp'>Back to Login page
        </a></li>
        </ul>
    </nav>
</html>
