
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
<%@page import="com.mongodb.*"%>
<%@page import="java.util.*"%>
    </head>
    <body>
        <%
        synchronized (session) {

            String count =  request.getParameter("count");
            String test = "numItems"+count;
            String test2 = "cakeprice"+count;
            int numItems = Integer.parseInt(request.getParameter(test));
            float cakeprice = Float.parseFloat(request.getParameter(test2));
            float totalcost = numItems*cakeprice;
             String cakename = request.getParameter("cakename");
             //String totalcost = request.getParameter("totalcost");
     
     String searchField = "cakename";
     String up = "numItems";
     String up1 = "totalcost";
   
    	MongoClient mongo = new MongoClient("localhost", 27017);
                                        // if database doesn't exists, MongoDB will create it for you

                            DB db1 = mongo.getDB("Cake");
                             DBCollection temp_shop = db1.getCollection("temp_shop");

  BasicDBObject doc1 = new BasicDBObject();
  BasicDBObject doc2 = new BasicDBObject();
        
			BasicDBObject searchQuery = new BasicDBObject().append(searchField, cakename);
                        DBCursor cursor = temp_shop.find(searchQuery);
                       
                        while (cursor.hasNext()) {
					
					BasicDBObject obj = 
(BasicDBObject) cursor.next();	

doc1.append("$set",new BasicDBObject().append(up, numItems));
doc2.append("$set",new BasicDBObject().append(up1, totalcost));
}

WriteResult res = temp_shop.update(searchQuery, doc1);
WriteResult res1 = temp_shop.update(searchQuery, doc2);

if(res.getN() == 0 && res1.getN() == 0)
{
BasicDBObject doc = new BasicDBObject("title", "temp_shop").				
append("cakename", cakename).
        append("totalprice", totalcost).
append("numItems", numItems);

temp_shop.insert(doc);
}
                       
            response.sendRedirect("orderPage.jsp?totalcost="+totalcost+"&&count="+count);
        }
        %>
    </body>
</html>
