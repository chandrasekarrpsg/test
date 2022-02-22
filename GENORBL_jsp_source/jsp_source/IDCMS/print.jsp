<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPICMS - prints</title>
        <link rel="stylesheet" type="text/css" href="print_style.css" />
        <script type="text/javascript" src="js/sel_month.js"></script>
        <script>
            function validate(x) {
                x = "form_" + x;
                var y = document.forms[x]["contestmonth"].value;
                var z = document.forms[x]["contestyear"].value;
                if (y == "0") {
                    alert ("msg from IPICMS\nselect valid month please");
                    return false;
                }
                if (z == "") {
                    alert ("msg from IPICMS\nenter year please");
                    return false;
                } else {
                    var exp = "0123456789";
                    var yearval = 0;
                    for (var i=0; i<4; i++) {
                        if (exp.indexOf(z.slice(i,(i+1))) == -1) {
                            alert ("msg from IPICMS\ninvalid year");
                            return false;
                        }
                        else {
                            yearval += Math.pow(10,(z.length-i-1)) * exp.indexOf(z.slice(i,(i+1)));
                        }
                    }
                    if (yearval<1000 || yearval >3000) {
                        alert ("msg from IPICMS\nabsurd year");
                        return false;
                    }
                }
                return true;
            }
        </script>
    </head>
<body background="Pics/Order/lblue047.gif">
<center>
<%
        MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
        PreparedStatement ps  = null;
        ResultSet rs          = null;
        String sysdate   = new String("");
        String your_desg = new String("");
        String empcd     = new String("");
        empcd= request.getParameter("sLoginEmpCd");
        String sLoginEmpNm = request.getParameter("sLoginEmpNm");

        String name = new String ("");
        name = request.getParameter ("sLoginEmpCd");


try{
           ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
           rs = ps.executeQuery();
           while(rs.next()){
                sysdate = rs.getString(1);
           }
           rs.close();
           ps.close();


%>
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:400px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">This Page Prints The Following Documents</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=sLoginEmpNm%> !!!</font></b>
</label>
<br>
<br>
<br>
        <br />
        <h3>Print letter to Finance Department</h3>
        <form method="post" action="print_finance.jsp">
            <input type="hidden" name="currentuser" value="<%=name%>" />
            <input type="submit" 
                   value="Requisition For Prize Money To Finance Dept" />
        </form>
        <br />
        <br />
        <h3>Money Receipt</h3>
        <form method="post" action="print_roster.jsp" name="form_1" onsubmit="" >
          Monthr-Year : &nbsp;&nbsp;
            <input type="text" name="job_mnth" id="job_mnth" size="6"  onclick="sel_month('form_1.job_mnth','js/');"  />
            <input type="hidden" name="currentuser" value="<%=name%>" />
            <input type="submit" value="Print Letter" />
        </form>
        <br />
        <h3>Print Certificates</h3>
        <form action="print_cert.jsp" method="post"  name="form_2" >
          Monthr-Year : &nbsp;&nbsp;
            <input type="text" name="job_mnth" id="job_mnth" size="6"  onclick="sel_month('form_2.job_mnth','js/');"  />
            <input type="hidden" name="currentuser" value="<%=name%>" />
            <input type="submit" value="Get Certificates" />
        </form>
            <br />
        <br />
<%
}catch(Exception e){
    e.printStackTrace();
}finally{
  if(rs!=null){
        rs.close();
     }
     if(ps!=null){
        ps.close();
     }
     if(mk!=null){
        mk.con.close();
     }
}
%>
</center>
</body>
</html>
