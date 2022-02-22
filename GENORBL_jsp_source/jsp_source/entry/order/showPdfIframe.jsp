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
    </head>
    <body>
        <%
                    String sCallNo = request.getParameter("sCallNo");
                    String sFlNm = request.getParameter("sFlNm");
                    String sIpAddr = request.getParameter("sIpAddr");
                    String sOrdId = request.getParameter("sOrdId");
                    

        %>

        <iframe src="ShowPdf?sFlNm=<%= sFlNm%>&sIpAddr=<%= sIpAddr%>&sOrdId=<%= sOrdId%>" width="1000px" height="650px">
        </iframe>        

    </body>
</html>
