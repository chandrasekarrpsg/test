<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div>
<%
String action_str = "vendorEntry.jsp";
if(request.getParameter("action_type_h").equals("NAC")){
action_str = "vendor_Name_address_change.jsp";
}
System.out.println(" stn_dept_constrnt : "+request.getParameter("stn_dept_constrnt"));
%>
<form name="srchFrm" action="<%= action_str %>" target="mnfrm1" method="POST" >
           <input type=hidden  name="vndr_cd_h"  value="<%= request.getParameter("vndr_cd_h") %>" />
           <input type=hidden  id= "action_type_h" name="action_type_h"   value="<%= request.getParameter("action_type_h") %>" />
           <input type=hidden  name="stn_dept_constrnt"  value="<%= request.getParameter("stn_dept_constrnt") %>" />
        </form>



<script>
            setTimeout(function() { srchFrm.submit();}, 1000);

        </script>
    </body>
</html>

