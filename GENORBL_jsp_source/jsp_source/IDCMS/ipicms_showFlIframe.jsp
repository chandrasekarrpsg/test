<%-- 
    Document   : showPdfIframe
    Created on : Mar 15, 2013, 1:14:22 PM
    Author     : debasis saha
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
 
            function returnVal(ans){
                alert('111');

                window.returnValue = ans ;

            }

        </script>
    </head>
    <body>
        <%
                    String sContest_id = new String("");

                    sContest_id = request.getParameter("sContest_id") == null ? "" : request.getParameter("sContest_id");



        %>

        <iframe src="ipicms_showFl.jsp?sContest_id=<%= sContest_id%>" width="1000px" height="650px">
        </iframe>        

        <script>
            window.returnValue = 'Y' ;
        </script>

    </body>
</html>
