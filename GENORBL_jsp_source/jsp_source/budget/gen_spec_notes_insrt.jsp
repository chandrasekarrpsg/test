
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.f1.sec_cd.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&username='+document.f1.empcd.value;
   parameter = parameter + '&stn_long_desc='+document.f1.stn_long_desc.value;
   parameter = parameter + '&bgt_lvl='+document.f1.bgt_lvl.value;

   window.open("gen_stn_spec_notes.jsp?"+parameter,"_self");
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
                        String station        = new String("");
                        String cursrl         = new String("");
                        String curbgthd       = new String("");
                        String curamt         = new String("");
                        String curdesc        = new String("");
                        String notes_exist    = new String("");

                        String stn_cd         = request.getParameter("stn_cd");
                        String sec_cd         = request.getParameter("sec_cd");
                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");
                        String counter        = request.getParameter("counter");
                        String srlset         = request.getParameter("srlset");
                        String bgthdset       = request.getParameter("bgthdset");
                        String amtset         = request.getParameter("amtset");
                        String descset        = request.getParameter("descset");
                        String stn_long_desc  = request.getParameter("stn_long_desc");
                        String bgt_lvl        = request.getParameter("bgt_lvl");
                        descset = descset.replaceAll("amperssion","&");
                        descset = descset.replaceAll("percentspl","%");
 

 
                        String [] srl         = new String[999];
                        String [] bgthd       = new String[999];
                        String [] amt         = new String[999];
                        String [] desc        = new String[999];

                        int update_count = 0;
                        int update_count1 = 0;
                        int a = 0;
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
       
       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            your_desg = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select count(*) from bgt_addl_data where stn_cd=? and sec_cd=? and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            notes_exist = rs.getString(1);
       }
       rs.close();
       ps.close();

if(!notes_exist.equals("0")){

       ps = mk.con.prepareStatement("delete bgt_addl_data where stn_cd=? and sec_cd=? and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       update_count = ps.executeUpdate();
       ps.close();
}
       
%>
<form name="f1">

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">NOTES ENTRY FORM FOR <%=sec_cd%>(<%=station%>) FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=your_desg%> !!!</font></b>
</label>
<%

StringTokenizer st1 = new StringTokenizer(srlset,"|");
          int y=0;
         
          while(st1.hasMoreTokens()){
                srl[y]=(String) st1.nextToken();
                y=y+1;
          }

StringTokenizer st2 = new StringTokenizer(bgthdset,"|");
          int z=0;
         
          while(st2.hasMoreTokens()){
                bgthd[z]=(String) st2.nextToken();
                z=z+1;
          }

StringTokenizer st3 = new StringTokenizer(amtset,"|");
          int x=0;
         
          while(st3.hasMoreTokens()){
                amt[x]=(String) st3.nextToken();
                x=x+1;
          }

StringTokenizer st4 = new StringTokenizer(descset,"|");
          int u=0;
         
          while(st4.hasMoreTokens()){
                desc[u]=(String) st4.nextToken();
                u=u+1;
          }

while( a < Integer.parseInt(counter)){

cursrl    = srl[a];
curbgthd  = bgthd[a];
curamt    = amt[a];
curdesc   = desc[a];

if(!cursrl.equals("@") && !curbgthd.equals("@") && !curamt.equals("@") && !curdesc.equals("@")){

       ps = mk.con.prepareStatement(" insert into bgt_addl_data(BGT_YR,STN_CD,SEC_CD,SRL_NO,BGT_VER,BGT_LEVEL,BGT_HD,AMT,BGT_DESC,CRT_DT,CRT_BY) "+
                                    " values(?,?,?,?,'1','1',?,?,?,sysdate,?)");
       ps.setString(1,finyr);
       ps.setString(2,stn_cd);
       ps.setString(3,sec_cd);
       ps.setString(4,cursrl);
       ps.setString(5,curbgthd);
       ps.setString(6,curamt);
       ps.setString(7,curdesc);
       ps.setString(8,empcd);
       update_count = ps.executeUpdate();
       ps.close();
       
}
a=a+1; 
}
mk.con.commit();
mk.con.close();

if(update_count > 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">NOTE(S) OF SECTION :</font></b><b><font face="Tahoma" color="#FF0000"> <%=sec_cd%>(<%=station%>) </font><font face="Tahoma" color="#800080"> FOR FINANCIAL YEAR :</font><font face="Tahoma" color="#FF0000"> <%=finyr1%></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080"> HAVE BEEN INSERTED SUCCESSFULLY BY </font> <font face="Tahoma" color="#FF0000"> <%=your_desg%> </font> </b></label>
<br>
<%
}
%>
<br>
<label style="left:400px; top:250px; position:absolute;"><b>
<input type="button" value="Back" id="B1" name="B1" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="back_prev();">

<input type="hidden" id= "stn_cd" name = "stn_cd" value="<%=stn_cd%>" />
<input type="hidden" id= "sec_cd" name = "sec_cd" value="<%=sec_cd%>" />
<input type="hidden" id= "finyr" name = "finyr" value="<%=finyr%>" />
<input type="hidden" id= "finyr1" name = "finyr1" value="<%=finyr1%>" />
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "stn_long_desc" name = "stn_long_desc" value="<%=stn_long_desc%>" />
<input type="hidden" id= "bgt_lvl" name = "bgt_lvl" value="<%=bgt_lvl%>" />

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

