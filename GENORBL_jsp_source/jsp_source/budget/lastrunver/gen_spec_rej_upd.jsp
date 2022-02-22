
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function validate_form(){
if(document.f1.rmks.value==''){
  alert('Please Enter Remarks.');
  document.f1.rmks.focus();
  return false;
}else{
   return true;
}
}

function submit_data(){

if(validate_form()){
document.f1.reject.disabled='true';
  var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.f1.sec_cd.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&remarks='+document.f1.rmks.value;
//alert(parameter);
window.open("gen_spec_rej_upd_insrt.jsp?"+parameter,"_self");
}else{
   return false;
}
}
</script>
</head>
<body background="green1.jpg" onload="">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.PrintWriter; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        String cur_bgt_level  = new String("");
                        String cur_bgt_ver    = new String("");
                        String prev_bgt_level = new String("");
                        String cur_emp_desg   = new String("");
                        String prev_emp_desg  = new String("");
                        String sysdate        = new String("");
                        String your_desg      = new String("");
                        String station        = new String("");
                        String section        = new String("");
                        String arch_bgt_lvl   = new String("");
                        String new_bgt_ver    = new String("");
                        String stn_cd         = request.getParameter("stn_cd");
                        String sec_cd         = request.getParameter("sec_cd");
                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");

                        int iFailureFlag = 0;
                        int update_count = 0;
try{

                             mk = new MakeConnectionGENORBL();
                             mk.con.setAutoCommit(false);



       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select STATION_SHT_DESC from CD_STATION where bgt_station_cd=?");
       ps.setString(1,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            station = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select SECTION_DESC from BGT_CD_SECTION  where section_cd=?");
       ps.setString(1,sec_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            section = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            your_desg = rs.getString(1);
       }
       rs.close();
       ps.close();
       
%>
<form name="f1">

<input type="hidden"  id="stn_cd" name ="stn_cd"  value="<%=stn_cd%>" />
<input type="hidden"  id="sec_cd" name ="sec_cd"  value="<%=sec_cd%>" />
<input type="hidden"  id="finyr" name ="finyr"  value="<%=finyr%>" />
<input type="hidden"  id="finyr1" name ="finyr1"  value="<%=finyr1%>" />
<input type="hidden"  id="empcd" name ="empcd"  value="<%=empcd%>" />

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">STATUS OF <%=section%>(<%=station%>) FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=your_desg%> !!!</font></b>
</label>

<label style="left:10px; top:90px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">Remarks : </font></b> &nbsp;&nbsp;
</label>

<label style="left:30px; top:120px; position: absolute" >
<textarea rows="5" cols="100" id="rmks" name="rmks" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold;" onkeypress=""/>
</textarea>
</label>
<br>
<label style="left:400px; top:250px; position:absolute;"><b>
<input type="button" value="Reject" id="reject" name="reject" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="submit_data();">
<%
}catch(Exception e) {
                    e.printStackTrace();
}finally{
                        if (mk != null) {
                            mk.con.close();
                        }
}

%>
</body>
</html>

