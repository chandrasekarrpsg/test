<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div>
        
  <form name="srchFrm" action="vendor_search_result.jsp" target="mnfrm1" method="POST" >
              <input type="hidden" name="srch_type_h" value="<%= request.getParameter("srch_type_h") %>" />
             <input type="hidden" name="vndr_nm_p_h" value="<%= request.getParameter("vndr_nm_p_h") %>"  />
            <input type="hidden" name="vndr_cd_p_h" value="<%= request.getParameter("vndr_cd_p_h") %>"  />
            <input type="hidden" name="vndr_sts_p_h" value="<%= request.getParameter("vndr_sts_p_h") %>"  />

        </form>



<script>
            setTimeout(function() { srchFrm.submit();}, 1000);

        </script>
    </body>
</html>

