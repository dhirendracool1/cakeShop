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
			
	DBCollection dhiru = db.getCollection("order");
        //DBCollection dhiru1 = db.getCollection("shop1");
        int orderid= Integer.parseInt(request.getParameter("orderid"));
        //String cakename = request.getParameter("cakename");
			BasicDBObject searchQuery = new BasicDBObject();
                        BasicDBObject searchQuery1 = new BasicDBObject();
			searchQuery.put("orderid", orderid);
                        //searchQuery1.put("cakename", cakename);
       DBCursor cursor = dhiru.find(searchQuery); 
       //DBCursor cursor1 = dhiru.find(searchQuery1); 
	                      
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