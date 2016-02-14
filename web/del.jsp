<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.mongodb.*" %>
 <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
         <link rel="stylesheet" href="style.css" type="text/css" />
    </head>
    <body color='#FDF5E6'>
        <nav><ul><li class='start selected'><a href='index.html'>Home
                </br><li class=''><a href='addproduct.jsp'>Back
               <li class='end'><a href='logout.jsp'>Logout</a>
               </br>
               </a></li>
            </ul></nav>
<%
    
    try{
			
   MongoClient mongo = new MongoClient("localhost", 27017);
    	DB db = mongo.getDB("Cake");
			
	DBCollection dhiru = db.getCollection("shop");
        String cakename= request.getParameter("cakename");
        String caketype= request.getParameter("caketype");
       
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("cakename", cakename);
                        searchQuery.put("caketype", caketype);
       DBCursor cursor = dhiru.find(searchQuery);                 
	                      
                      %>
                      
                      <%
                        if(cursor.count() == 0){
                            %>
				<h1>There are no such orders.</h1></tr>
               <%
			}else{
			 dhiru.remove(searchQuery);
              response.sendRedirect("delstore.jsp");
}
                        %>
              
                      
                      
                       <TABLE style=\"width:100%\" ALIGN=\"CENTER\">
                        <TR BGCOLOR=\"#FFDAB9\">
				
  
              </TABLE></body></html> 
        
<%  
                        } catch (MongoException e) {
				e.printStackTrace();
		}
                      
                     
                          %>