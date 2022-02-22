<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div>

<form name="srchFrm" action="spbillEntry.jsp" target="mnfrm1" method="POST" >
           <input type=hidden  name="spbilref_h"  value="<%= request.getParameter("spblref_h") %>" />
           <input type=hidden  id= "action_type_h" name="action_type_h"   value="<%= request.getParameter("action_type_h") %>" />
        </form>

<%
System.out.println("  spbilref_h :   intrmdt   "+request.getParameter("spblref_h"));

%>

<script>
            setTimeout(function() { srchFrm.submit();}, 1000);

        </script>
    </body>
</html>

