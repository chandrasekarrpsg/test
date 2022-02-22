<%-- 
    Document   : upldFl
    Created on : Mar 7, 2013, 5:13:05 PM
    Author     : debasis saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%
    System.out.println("sOrdId : " + request.getParameter("sOrdId"));
    System.out.println(request.getParameter("sIpAddr"));
    %>
    <body bgcolor="#FFFFCC">
        <fieldset>
            <legend>Upload File</legend>
            <form action="UpldFl" method="post" enctype="multipart/form-data" onsubmit="">  
                    <label for="fileName">Select Pdf File: </label>
                    <input name="sOrdId" type="hidden" value ='<%= request.getParameter("sOrdId") %>'/>
                    <input name="sIpAddr" type="hidden" value ='<%= request.getParameter("sIpAddr") %>'/>
                    <input id="fileName" type="file" name="fileName" size="20"/><input type="submit" value="Upload" />
            </form>
        </fieldset>
    </body>
</html>
