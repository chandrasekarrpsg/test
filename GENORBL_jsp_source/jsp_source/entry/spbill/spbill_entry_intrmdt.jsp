<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div>


<form name="vndr_entry_frm" action="doSpbillEntry.jsp" method="POST" target="_self" >

<input type="hidden" name="selGenStn" value = "<%=  request.getParameter("selGenStn")  %>" />
<input type="hidden" name="dept_fld" value = "<%=  request.getParameter("dept_fld")  %>" />
<input type="hidden" name="unt_fld" value = "<%=  request.getParameter("unt_fld")  %>" />
<input type="hidden" name="jbTyp_Fld" value = "<%=  request.getParameter("jbTyp_Fld")  %>" />
<input type="hidden" name="ordr_no" value = "<%=  request.getParameter("ordr_no")  %>" />
<input type="hidden" name="ordr_dt" value = "<%=  request.getParameter("ordr_dt")  %>" />
<input type="hidden" name="bill_no" value = "<%=  request.getParameter("bill_no")  %>" />
<input type="hidden" name="bill_dt" value = "<%=  request.getParameter("bill_dt")  %>" />
<input type="hidden" name="bill_rcvd_on" value = "<%=  request.getParameter("bill_rcvd_on")  %>" />
<input type="hidden" name="bill_amt" value = "<%=  request.getParameter("bill_amt")  %>" />
<input type="hidden" name="job_mnth" value = "<%=  request.getParameter("job_mnth")  %>" />
<input type="hidden" name="bill_sts" value = "<%=  request.getParameter("bill_sts")  %>" />
<input type="hidden" name="bill_desc" value = "<%=  request.getParameter("bill_desc")  %>" />
<input type="hidden" name="add_rmrks" value = "<%=  request.getParameter("add_rmrks")  %>" />
<input type="hidden" name="plant_sel" value = "<%=  request.getParameter("plant_sel")  %>" />
<input type="hidden" name="equip_sel" value = "<%=  request.getParameter("equip_sel")  %>" />
<input type="hidden" name="vndr_sel" value = "<%=  request.getParameter("vndr_sel")  %>" />
<input type="hidden" name="bdgt_sel" value = "<%=  request.getParameter("bdgt_sel")  %>" />
<input type="hidden" name="bdgt_sel_seq" value = "<%=  request.getParameter("bdgt_sel_seq")  %>" />
<input type="hidden" name="cncl_rmrks" value = "<%=  request.getParameter("cncl_rmrks")  %>" />



<input type="hidden" name="urgent_basis_h" value = "<%=  request.getParameter("urgent_basis_h")  %>" />
<input type="hidden" name="invoice_attchd_h" value = "<%=  request.getParameter("invoice_attchd_h")  %>" />
<input type="hidden" name="login_dept_h" value = "<%=  request.getParameter("login_dept_h")  %>" />
<input type="hidden" name="entry_mode_h" value = "<%=  request.getParameter("entry_mode_h")  %>" />
<input type="hidden" name="action_type_h" value = "<%=  request.getParameter("action_type_h")  %>" />
<input type="hidden" name="spbill_ref_h" value = "<%=  request.getParameter("spbill_ref_h")  %>" />
<input type="hidden" name="spbill_erp_ac_h" value = "<%=  request.getParameter("spbill_erp_ac_h")  %>" />
<input type="hidden" name="urgent_rmrks_h" value = "<%=  request.getParameter("urgent_rmrks_h")  %>" />

</form>



<script>
            setTimeout(function() { vndr_entry_frm.submit();}, 1000);

        </script>
    </body>
</html>

