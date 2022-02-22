
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
var parameter='';
   parameter = parameter + 'finyr='+document.f1.finyr.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&station='+document.f1.station.value;
   parameter = parameter + '&type='+document.f1.type.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("add_comment_on_exp.jsp?"+parameter,"_self");

}

</script>
</head>
<body background="green1.jpg" onload="">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*,java.util.*; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        String sysdate        = new String("");
                        String your_desg      = new String("");
                        String finyr          = new String("");
                        String month          = new String("");
                        String station        = new String("");
                        String station_desc   = new String("");
                        String empcd          = new String("");
                        String comments       = new String("");
                        String finyr1         = new String("");
                        String type           = new String("");
                        String exist_flag     = new String("");
                        finyr       = request.getParameter("finyr");
                        finyr1      = request.getParameter("finyr1");
                        month       = request.getParameter("month");
                        station     = request.getParameter("station");
                        empcd       = request.getParameter("empcd");
                        comments    = request.getParameter("comments");
                        type        = request.getParameter("type");
                        comments = comments.replaceAll("amperssion","&");
                        comments = comments.replaceAll("percentspl","%");


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
       
       
       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            your_desg = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement(" select count(*) from BGTM_USER_COMNTS "+ 
                                    " where fin_yr=? and stn_cd=decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') and mm_val=to_char(to_date(?,'Mon'),'MM') and exp_typ=decode(?,'Materials','M','Contracts','C')");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,month);
       ps.setString(4,type);
       rs = ps.executeQuery();
       while(rs.next()){
            exist_flag = rs.getString(1);
       }
       rs.close();
       ps.close();

if(exist_flag.equals("0")){

       ps = mk.con.prepareStatement(" insert into BGTM_USER_COMNTS(FIN_YR,STN_CD,MM_VAL,EXP_TYP,COMNT,CRT_DT,CRT_BY) "+
                                    " values(?,decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E'),to_char(to_date(?,'Mon'),'MM'),decode(?,'Materials','M','Contracts','C'),?,sysdate,?) ");  
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,month);
       ps.setString(4,type);
       ps.setString(5,comments);
       ps.setString(6,empcd);
       update_count = ps.executeUpdate();
       ps.close();
}else{
       ps = mk.con.prepareStatement(" update BGTM_USER_COMNTS set COMNT=?,upd_dt=sysdate,upd_by=? "+
                                    " where fin_yr=? and stn_cd=decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') "+
                                    " and mm_val=to_char(to_date(?,'Mon'),'MM') and exp_typ=decode(?,'Materials','M','Contracts','C')");
       ps.setString(1,comments);
       ps.setString(2,empcd);
       ps.setString(3,finyr1);
       ps.setString(4,station);
       ps.setString(5,month);
       ps.setString(6,type);
       update_count = ps.executeUpdate();
       ps.close();

}

mk.con.commit();
%>
<form name="f1">

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">Monthly Budget Vs Actual Deviation Analysis.(Add Comment if deviation is more than +/-20) </font></b> </label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<%
if(update_count > 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">COMMENTS FOR TYPE :</font></b><b><font face="Tahoma" color="#FF0000"> <%=type%> </font><font face="Tahoma" color="#800080"> FOR THE MONTH :</font></b><b><font face="Tahoma" color="#FF0000"> <%=month%> </font><font face="Tahoma" color="#800080"> <font face="Tahoma" color="#800080"> AND FINANCIAL YEAR: </font><font face="Tahoma" color="#FF0000"> <%=finyr%></font><font face="Tahoma" color="#800080"> FOR STATION :</font></b><b><font face="Tahoma" color="#FF0000"> <%=station%> </font><font face="Tahoma" color="#800080"> HAVE BEEN UPDATED SUCCESSFULLY. </font></b></label> <br>
<%
}
%>
<br>
<label style="left:400px; top:250px; position:absolute;"><b>
<input type="button" value="Back" id="B1" name="B1" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="back_prev();">
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "finyr" name = "finyr" value="<%=finyr%>" />
<input type="hidden" id= "month" name = "month" value="<%=month%>" />
<input type="hidden" id= "type" name = "type" value="<%=type%>" />
<input type="hidden" id= "station" name = "station" value="<%=station%>" />
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

