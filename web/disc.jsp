
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

            double totalcakeprice =  Double.parseDouble(request.getParameter("totalcakeprice"));
            totalcakeprice = totalcakeprice - (totalcakeprice * 0.1);
         
            
          response.sendRedirect("orderPage.jsp?totalcakeprice="+totalcakeprice);
        }
        %>
    </body>
</html>
