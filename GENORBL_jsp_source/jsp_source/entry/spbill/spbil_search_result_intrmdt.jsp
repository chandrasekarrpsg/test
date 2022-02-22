<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div>
        
  <form name="srchFrm" action="spbill_search_result.jsp" target="mnfrm1" method="POST" >
              <input type="hidden" name="srch_type_h" value="<%= request.getParameter("srch_type_h") %>" />
            <input type="hidden" name="spbill_ref_p_h" value="<%= request.getParameter("spbil_ref_h") %>"  />
            <input type="hidden" name="spbil_no_h" value="<%= request.getParameter("spbil_no_h") %>"  />
            <input type="hidden" name="spbil_ref_id_h" value="<%= request.getParameter("spbil_ref_id_h") %>"  />
            <input type="hidden" name="spbil_vendor_h" value="<%= request.getParameter("spbil_vendor_h") %>"  />
            <input type="hidden" name="spbil_urgnt_pmnt_h" value="<%= request.getParameter("spbil_urgnt_pmnt_h") %>"  />
            <input type="hidden" name="spbil_fin_rcvd_sts_p_h" value="<%= request.getParameter("spbil_fin_rcvd_sts_h") %>"  />
            <input type="hidden" name="spbil_cancelled_bill_h" value="<%= request.getParameter("spbil_cancelled_bill_h") %>"  />
            <input type="hidden" name="spbil_bill_frm_dt_p_h" value="<%= request.getParameter("spbil_bill_frm_dt_h") %>"  />
            <input type="hidden" name="spbil_bill_to_dt_p_h" value="<%= request.getParameter("spbil_bill_to_dt_h") %>"  />

        </form>



<script>
            setTimeout(function() { srchFrm.submit();}, 1000);

        </script>
    </body>
</html>

