<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPICMS - history</title>
        <link rel="stylesheet" type="text/css" href="history_style.css" />
<script type="text/javascript" src="js/sel_month.js"></script>
<script type="text/javascript">


function search (){
   var parameter='';
   parameter = parameter + '&m='+document.getElementById("job_mnth").value;
   parameter = parameter + '&o='+document.getElementById("office").value;
   parameter = parameter + '&u='+document.getElementById("sLoginEmpCd").value;
   parameter = parameter + '&s='+document.getElementById("stage").value;
   parameter = parameter + '&sLoginStnCd='+document.getElementById("sLoginStnCd").value;
   parameter = parameter + '&sLoginStnShrtNm='+document.getElementById("sLoginStnShrtNm").value;
   parameter = parameter + '&sLoginStnLongNm='+document.getElementById("sLoginStnLongNm").value;
   parameter = parameter + '&sLoginDeptCd='+document.getElementById("sLoginDeptCd").value;
   parameter = parameter + '&sLoginDeptShrtNm='+document.getElementById("sLoginDeptShrtNm").value;
   parameter = parameter + '&sLoginDeptLongNm='+document.getElementById("sLoginDeptLongNm").value;
   parameter = parameter + '&sLoginEmpCd='+document.getElementById("sLoginEmpCd").value;
   parameter = parameter + '&sLoginEmpNm='+document.getElementById("sLoginEmpNm").value;
   parameter = parameter + '&sLoginEmpDesg='+document.getElementById("sLoginEmpDesg").value;
   parameter = parameter + '&sLoginEmpLvl='+document.getElementById("sLoginEmpLvl").value;
   parameter = parameter + '&sLoginAdmMkr='+document.getElementById("sLoginAdmMkr").value;
   parameter = parameter + '&sLoginEmpKaizenMkr='+document.getElementById("sLoginEmpKaizenMkr").value;
   parameter = parameter + '&title='+document.getElementById("title").value;
   
//alert(parameter);
window.open("search.jsp?"+parameter,"_self");
}

</script>
</head>
<body background="Pics/Order/lblue047.gif">
<form name="f1">
<%
        MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
        PreparedStatement ps  = null;
        ResultSet rs          = null;
        String sysdate   = new String("");
        String your_desg = new String("");
        String empcd     = new String("");
        empcd= request.getParameter("sLoginEmpCd");

                        String sLoginStnCd = request.getParameter("sLoginStnCd");
                        String sLoginStnShrtNm = request.getParameter("sLoginStnShrtNm");
                        String sLoginStnLongNm = request.getParameter("sLoginStnLongNm");
                        String sLoginDeptCd = request.getParameter("sLoginDeptCd");
                        String sLoginDeptShrtNm = request.getParameter("sLoginDeptShrtNm");
                        String sLoginDeptLongNm = request.getParameter("sLoginDeptLongNm");
                        String sLoginEmpCd = request.getParameter("sLoginEmpCd");
                        String sLoginEmpNm = request.getParameter("sLoginEmpNm");
                        String sLoginEmpDesg = request.getParameter("sLoginEmpDesg");
                        String sLoginEmpLvl = request.getParameter("sLoginEmpLvl");
                        String sLoginAdmMkr = request.getParameter("sLoginAdmMkr");
                        String sLoginEmpKaizenMkr = request.getParameter("sLoginEmpKaizenMkr");


try{
            String user = new String (request.getParameter("sLoginEmpCd"));
            String officecode = new String ("");
            String officename = new String ("");

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

<label style="left:350px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Enter Your Keywords Here To Search</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=sLoginEmpNm%> !!!</font></b>
</label>
<br>
<br>
<br>
        <div id="formdiv" align="center">
          Month-Year : &nbsp;&nbsp; 
         <input type="text" name="job_mnth" id="job_mnth" size="6"  onclick="sel_month('f1.job_mnth','js/');"  />
         &nbsp;&nbsp;Station:&nbsp;
            <select id="office">
                <option value="all">ALL</option>
<%

            ps = mk.con.prepareStatement(" SELECT orbl_station_cd,station_sht_desc FROM cd_station "+
                                         " Order by decode(orbl_station_cd,'016','1','014','2','002','3','013','4','019','5','042','6')");
            rs = ps.executeQuery();
            while (rs.next()) {
                officecode = rs.getString(1);
                officename = rs.getString(2);
                %>
                <option value="<%=officecode%>"><%=officename%></option>
<%
               }
            rs.close();
            ps.close();
%>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;
            Stage:&nbsp;
            <select id="stage">
                <option value="all">ALL</option>
<%
            String stagecode = new String ("");
            String stagename = new String ("");

            ps = mk.con.prepareStatement("SELECT * FROM IDCMS_STAGE");
            rs = ps.executeQuery();
            while (rs.next()) {
                stagecode = rs.getString ("STAGE_CODE");
                stagename = rs.getString ("STAGE_DESC");
%>
                <option value="<%=stagecode%>"><%=stagename%></option>
<%
            }
            rs.close ();
            ps.close ();
            %>
            </select>
         &nbsp;&nbsp;
          Title &nbsp;&nbsp;:  
         <input type="text" name="title" id="title" size="10" />
         &nbsp;&nbsp;&nbsp;&nbsp;
            <button onclick="search(<%=user%>);">Go</button>
<input type="hidden" id= "sLoginStnCd" name ="sLoginStnCd" value="<%=sLoginStnCd%>" />
<input type="hidden" id= "sLoginStnShrtNm" name ="sLoginStnShrtNm" value="<%=sLoginStnShrtNm%>" />
<input type="hidden" id= "sLoginStnLongNm" name ="sLoginStnLongNm" value="<%=sLoginStnLongNm%>" />
<input type="hidden" id= "sLoginDeptCd" name ="sLoginDeptCd" value="<%=sLoginDeptCd%>" />
<input type="hidden" id= "sLoginDeptShrtNm" name ="sLoginDeptShrtNm" value="<%=sLoginDeptShrtNm%>" />
<input type="hidden" id= "sLoginDeptLongNm" name ="sLoginDeptLongNm" value="<%=sLoginDeptLongNm%>" />
<input type="hidden" id= "sLoginEmpCd" name ="sLoginEmpCd" value="<%=sLoginEmpCd%>" />
<input type="hidden" id= "sLoginEmpNm" name ="sLoginEmpNm" value="<%=sLoginEmpNm%>" />
<input type="hidden" id= "sLoginEmpDesg" name ="sLoginEmpDesg" value="<%=sLoginEmpDesg%>" />
<input type="hidden" id= "sLoginEmpLvl" name ="sLoginEmpLvl" value="<%=sLoginEmpLvl%>" />
<input type="hidden" id= "sLoginAdmMkr" name ="sLoginAdmMkr" value="<%=sLoginAdmMkr%>" />
<input type="hidden" id= "sLoginEmpKaizenMkr" name ="sLoginEmpKaizenMkr" value="<%=sLoginEmpKaizenMkr%>" />
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
</form>
</body> 
</html>
