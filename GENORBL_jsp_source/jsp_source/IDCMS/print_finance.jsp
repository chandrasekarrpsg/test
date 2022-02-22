<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPICMS - print finance request</title>
        <script type="text/javascript" src="js/sel_month.js"></script>
        <script type="text/javascript" >
            function back() {
                window.history.back();
            }
            function validate1 () {
                var a = document.forms["form1"]["refno"].value;
                var b = document.forms["form1"]["finyr"].value;
                var c = document.forms["form1"]["job_mnth"].value;
                
                if (a == "") {
                    alert ("msg from IPICMS\nenter letter referrence number");
                    return false;
                }
                if (b == "" || b == "YYYY-YYYY") {
                    alert ("msg from IPICMS\nenter financial year");
                    return false;
                }
                if (c == "x") {
                    alert ("msg from IPICMS\nselect contest month year");
                    return false;
                }
                return true;
            }
            
               function validate2 () {
                var b = document.forms["form2"]["finyr"].value;
                var c = document.forms["form2"]["job_mnth"].value;
                
                if (b == "" || b == "YYYY-YYYY") {
                    alert ("msg from IPICMS\nenter financial year");
                    return false;
                }
                if (c == "x") {
                    alert ("msg from IPICMS\nselect contest month year");
                    return false;
                }
                
                return true;
            }
        </script>
    </head>
    <body background="Pics/Order/lblue047.gif"> 
        <form style="text-align: right">
            <input type="button" value="back" onclick="back();" /> 
        </form>
        <%
        String name = new String ("");
        name = request.getParameter ("currentuser");
        %>
        <h1>Print a new letter: </h1>
        <form method="post" action="letter.jsp" target="_blank" name="form1"
              style="text-align: center; color: darkblue" onsubmit="return validate1();">
            <input type="hidden" name="currentuser" value="<%=name%>" />
            Letter Ref. No: &nbsp;<input type="text" name="refno" /> <br />
            Financial Year: &nbsp;<input type="text" name="finyr" value="YYYY-YYYY" /> <br />&nbsp;&nbsp;
            Monthr-Year : &nbsp;&nbsp;<input type="text" name="job_mnth" id="job_mnth" size="6"  onclick="sel_month('form1.job_mnth','js/');"  />
                       
<br />
            <input type="submit" value="confirm" />
        </form>
            
        <h1>Re-print:</h1>
        <form method="post" action="letter_reprint.jsp" target="_blank" name="form2"
            style="text-align: center; color: darkblue" onsubmit="return validate2();">
            <input type="hidden" name="currentuser" value="<%=name%>" />
            Financial Year: &nbsp;<input type="text" name="finyr" value="YYYY-YYYY" /> <br />
            Monthr-Year : &nbsp;&nbsp;<input type="text" name="job_mnth" id="job_mnth" size="6"  onclick="sel_month('form2.job_mnth','js/');"  />
           <br />
            <input type="submit" value="confirm" />
        </form>
    </body>
</html>
