<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div>

  <form name="srchFrm" action="<%= request.getParameter("dest_pg_h") %>" target="<%= request.getParameter("trgt_h") %>" method="POST" >
              <input type="hidden" name="spbil_ref_h" value="<%= request.getParameter("spbil_ref_h") %>" />

        </form>



<script>
            setTimeout(function() { srchFrm.submit();}, 1000);

        </script>
    </body>
</html>

