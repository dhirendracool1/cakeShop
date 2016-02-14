<%@page import="com.mongodb.MongoException"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.*" %>

<%
    try{
			
   MongoClient mongo = new MongoClient("localhost", 27017);
    	DB db = mongo.getDB("Cake");
			
	DBCollection dhiru = db.getCollection("temp_shop");
       // int orderid= Integer.parseInt(request.getParameter("temp_shop"));
        String cakename = request.getParameter("cakename");
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("cakename", cakename);
       DBCursor cursor = dhiru.find(searchQuery);                 
	                      
                      %>
                      
                      <%
                        if(cursor.count() == 0){
                    	}else{
			 dhiru.remove(searchQuery);
                        response.sendRedirect("orderPage.jsp");
}
                        %>
              
                      
                      
                       </body></html> 
        
<%   //response.sendRedirect("retrievecustomer.jsp");
                        } catch (MongoException e) {
				e.printStackTrace();
		}
                      
                     
                          %>
        
        %>