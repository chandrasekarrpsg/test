<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div>


<form name="vndr_entry_frm" action="doVndrEntry.jsp" method="POST" target="_self" >

<input type="hidden" name="props_dept" value = "<%=  request.getParameter("props_dept")  %>" />
<input type="hidden" name="vndr_name" value = "<%=  request.getParameter("vndr_name")  %>" />
<input type="hidden" name="vndr_addr1" value = "<%=  request.getParameter("vndr_addr1")  %>" />
<input type="hidden" name="vndr_addr2" value = "<%=  request.getParameter("vndr_addr2")  %>" />
<input type="hidden" name="vndr_addr3" value = "<%=  request.getParameter("vndr_addr3")  %>" />
<input type="hidden" name="vndr_addr4" value = "<%=  request.getParameter("vndr_addr4")  %>" />
<input type="hidden" name="vndr_addr5" value = "<%=  request.getParameter("vndr_addr5")  %>" />
<input type="hidden" name="vndr_cntct_persn" value = "<%=  request.getParameter("vndr_cntct_persn")  %>" />
<input type="hidden" name="vndr_mbl" value = "<%=  request.getParameter("vndr_mbl")  %>" />
<input type="hidden" name="vndr_tel" value = "<%=  request.getParameter("vndr_tel")  %>" />
<input type="hidden" name="vndr_fax" value = "<%=  request.getParameter("vndr_fax")  %>" />
<input type="hidden" name="vndr_eml" value = "<%=  request.getParameter("vndr_eml")  %>" />
<input type="hidden" name="vndr_wgliab" value = "<%=  request.getParameter("vndr_wgliab")  %>" />
<input type="hidden" name="vndr_wbst" value = "<%=  request.getParameter("vndr_wbst")  %>" />
<input type="hidden" name="vndr_wrkarea" value = "<%=  request.getParameter("vndr_wrkarea")  %>" />
<input type="hidden" name="props_rmrks" value = "<%=  request.getParameter("props_rmrks")  %>" />
<input type="hidden" name="recmnd_rmrks" value = "<%=  request.getParameter("recmnd_rmrks")  %>" />
<input type="hidden" name="trmn_rmrks" value = "<%=  request.getParameter("trmn_rmrks")  %>" />
<input type="hidden" name="rjct_rmrks" value = "<%=  request.getParameter("rjct_rmrks")  %>" />
<input type="hidden" name="apprv_rmrks" value = "<%=  request.getParameter("apprv_rmrks")  %>" />



<input type="hidden" name="doc_type_h" value = "<%=  request.getParameter("doc_type_h")  %>" />
<input type="hidden" name="doc_name_h" value = "<%=  request.getParameter("doc_name_h")  %>" />
<input type="hidden" name="doc_no_h" value = "<%=  request.getParameter("doc_no_h")  %>" />
<input type="hidden" name="doc_sts_h" value = "<%=  request.getParameter("doc_sts_h")  %>" />
<input type="hidden" name="doc_all_srl_h" value = "<%=  request.getParameter("doc_all_srl_h")  %>" />
<input type="hidden" name="entry_mode_h" value = "<%=  request.getParameter("entry_mode_h")  %>" />
<input type="hidden" name="action_type_h" value = "<%=  request.getParameter("action_type_h")  %>" />
<input type="hidden" name="vndr_cd_h" value = "<%= request.getParameter("vndr_cd_h") %>" />
<input type="hidden" name="termntn_sts_h" value = "<%=  request.getParameter("termntn_sts_h")  %>" />
<input type="hidden" name="sent_back_rmrks_h" value = "<%=  request.getParameter("sent_back_rmrks_h")  %>" />
<input type="hidden" name="sent_back_sts_h" value = "<%=  request.getParameter("sent_back_sts_h")  %>" />

</form>



<script>
            setTimeout(function() { vndr_entry_frm.submit();}, 1000);

        </script>
    </body>
</html>

