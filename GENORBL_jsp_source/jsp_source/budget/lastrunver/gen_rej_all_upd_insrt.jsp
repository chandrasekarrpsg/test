
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
   window.open("budget_dash_main_dtl.jsp?","_self");
}

</script>
</head>
<body background="green1.jpg" onload="">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*,java.util.*; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        String cur_bgt_level  = new String("");
                        String arch_bgt_lvl   = new String("");
                        String cur_bgt_ver    = new String("");
                        String prev_bgt_level = new String("");
                        String new_bgt_ver    = new String("");
                        String sysdate        = new String("");
                        String your_desg      = new String("");
                        String station        = new String("");
                        String section        = new String("");
                        String stn_cd         = request.getParameter("stn_cd");
                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");
                        String totsec         = request.getParameter("totsec");
                        String chkset         = request.getParameter("chkset");
                        String seccdset       = request.getParameter("seccdset");
                        String rmksset        = request.getParameter("rmksset");
                        String curchk         = new String("");
                        String currmks        = new String("");
                        String curseccd       = new String("");
                        String [] chk         = new String[999];
                        String [] rmks        = new String[999];
                        String [] seccd       = new String[999];

                        int update_count = 0;
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
       
       ps = mk.con.prepareStatement("select STATION_LONG_DESC from CD_STATION where bgt_station_cd=?");
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
       
%>
<form name="f1">

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">REJECTION STATUS OF <%=station%> FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=your_desg%> !!!</font></b>
</label>
<%

StringTokenizer st1 = new StringTokenizer(chkset,"|");
          int y=0;
         
          while(st1.hasMoreTokens()){
                chk[y]=(String) st1.nextToken();
                y=y+1;
          }

StringTokenizer st2 = new StringTokenizer(rmksset,"|");
          int z=0;
         
          while(st2.hasMoreTokens()){
                rmks[z]=(String) st2.nextToken();
                z=z+1;
          }

StringTokenizer st3 = new StringTokenizer(seccdset,"|");
          int x=0;
         
          while(st3.hasMoreTokens()){
                seccd[x]=(String) st3.nextToken();
                x=x+1;
          }

while( a < Integer.parseInt(totsec)){

curchk   = chk[a];
currmks  = rmks[a];
curseccd = seccd[a];

System.out.println("curchk:"+curchk);
System.out.println("currmks:"+currmks);
System.out.println("curseccd:"+curseccd);

if(curchk.equals("true")){

if(section.equals("")){
    section=curseccd;
}else{
    section=section+","+curseccd;
}

if(stn_cd.equals("B")){
       
       ps = mk.con.prepareStatement("select max(bgt_ver) from bgt_position where stn_cd=? and sec_cd=? and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_bgt_ver = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement(" insert into bgt_form2b_data_arc "+
                                    " select * from bgt_form2b_data "+
                                    " where stn_cd=? and sec_cd='ALL' and bgt_yr=? ");
       ps.setString(1,stn_cd);
       ps.setString(2,finyr);
       update_count = ps.executeUpdate();
       ps.close();
       
       ps = mk.con.prepareStatement(" insert into bgt_form2b_data_arc "+
                                    " select * from bgt_form2b_data "+
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? ");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(2,finyr);
       update_count = ps.executeUpdate();
       ps.close();

       ps = mk.con.prepareStatement("delete bgt_form2b_data where stn_cd=? and sec_cd='ALL' and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,finyr);
       update_count = ps.executeUpdate();
       ps.close();
       
       ps = mk.con.prepareStatement("delete bgt_form2b_data where stn_cd=? and sec_cd=? and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(3,finyr);
       update_count = ps.executeUpdate();
       ps.close();

       ps = mk.con.prepareStatement("update bgt_position set SEND_TO_LOWER_LEVEL_DT=sysdate, SEND_TO_LOWER_LEVEL_BY=?, "+
                                    "remarks=? where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_level='3' and bgt_ver=?");
       ps.setString(1,empcd);
       ps.setString(2,currmks);
       ps.setString(3,stn_cd);
       ps.setString(4,curseccd);
       ps.setString(5,finyr);
       ps.setString(6,cur_bgt_ver);
       update_count = ps.executeUpdate();
       ps.close();


}else{

       ps = mk.con.prepareStatement("select max(bgt_ver) from bgt_position where stn_cd=? and sec_cd=? and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_bgt_ver = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("cur_bgt_ver:"+cur_bgt_ver);
       
       ps = mk.con.prepareStatement("select max(bgt_level) from bgt_position where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_ver=? and SEND_TO_LOWER_LEVEL_DT is null");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(3,finyr);
       ps.setString(4,cur_bgt_ver);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_bgt_level = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("cur_bgt_level:"+cur_bgt_level);

       ps = mk.con.prepareStatement("select max(bgt_level) from bgt_level where stn_cd=? and sec_cd=? and bgt_level<?");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(3,cur_bgt_level);
       rs = ps.executeQuery();
       while(rs.next()){
            prev_bgt_level = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("prev_bgt_level:"+prev_bgt_level);

       ps = mk.con.prepareStatement(" select min(bgt_level) from bgt_level "+
                                    " where stn_cd=? and sec_cd=? and bgt_level>'1' ");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       rs = ps.executeQuery();
       while(rs.next()){
            arch_bgt_lvl  = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("arch_bgt_lvl:"+arch_bgt_lvl);


       ps = mk.con.prepareStatement("UPDATE BGT_FORM2B_DATA   "+
                                    " set  bgt_level = ?      "+
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_level=?  ");
       ps.setString(1,prev_bgt_level);
       ps.setString(2,stn_cd);
       ps.setString(3,curseccd);
       ps.setString(4,finyr);
       ps.setString(5,cur_bgt_level);
       update_count = ps.executeUpdate();
       ps.close();

        ps = mk.con.prepareStatement("UPDATE BGT_POSITION "+
                                    " set  UPD_DT =sysdate,UPD_BY=?,SEND_TO_LOWER_LEVEL_DT=sysdate,SEND_TO_LOWER_LEVEL_BY=?,remarks=? "+  
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_ver=? and bgt_level=?  ");
       ps.setString(1,empcd);
       ps.setString(2,empcd);
       ps.setString(3,currmks);
       ps.setString(4,stn_cd);
       ps.setString(5,curseccd);
       ps.setString(6,finyr);
       ps.setString(7,cur_bgt_ver);
       ps.setString(8,cur_bgt_level);
       update_count = ps.executeUpdate();
       ps.close();

if(Integer.parseInt(arch_bgt_lvl) == Integer.parseInt(cur_bgt_level)){

System.out.println("herecur_bgt_level:"+cur_bgt_level);
System.out.println("herearch_bgt_level:"+arch_bgt_lvl);

       ps = mk.con.prepareStatement(" INSERT INTO BGT_FORM2B_DATA_ARC "+
                                    " select * from BGT_FORM2B_DATA where stn_cd=? and sec_cd=? and bgt_yr=? ");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(3,finyr);
       update_count = ps.executeUpdate();
       ps.close();

       ps = mk.con.prepareStatement(" UPDATE BGT_FORM2B_DATA "+
                                    " set bgt_ver=bgt_ver+1,crt_dt=sysdate,crt_by=?,publish_mkr='N',upd_dt=null,upd_by=null "+
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? ");
       ps.setString(1,empcd);
       ps.setString(2,stn_cd);
       ps.setString(3,curseccd);
       ps.setString(4,finyr);
       update_count = ps.executeUpdate();
       ps.close();

       ps = mk.con.prepareStatement(" select bgt_ver from BGT_FORM2B_DATA "+
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? ");
       ps.setString(1,stn_cd);
       ps.setString(2,curseccd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            new_bgt_ver  = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement(" INSERT INTO BGT_POSITION(BGT_YR,STN_CD,SEC_CD,BGT_VER,BGT_LEVEL,CRT_DT,CRT_BY) "+
                                    " VALUES(?,?,?,?,'1',sysdate,?)");
       ps.setString(1,finyr);
       ps.setString(2,stn_cd);
       ps.setString(3,curseccd);
       ps.setString(4,new_bgt_ver);
       ps.setString(5,empcd);
       update_count = ps.executeUpdate();
       ps.close();
}
}

}
a=a+1; 
}

mk.con.commit();
mk.con.close();

if(update_count > 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">BUDGET(S) OF SECTION(S) :</font></b><b><font face="Tahoma" color="#FF0000"> <%=section%> </font><font face="Tahoma" color="#800080"> OF :</font></b><b><font face="Tahoma" color="#FF0000"> <%=station%> </font><font face="Tahoma" color="#800080"> FOR FINANCIAL YEAR :</font><font face="Tahoma" color="#FF0000"> <%=finyr1%></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080"> HAVE BEEN REJECTED BY THE </font> <font face="Tahoma" color="#FF0000"> <%=your_desg%> </font> <font face="Tahoma" color="#800080">AND SEND FOR RECONSIDERATION  ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%></font></b></label>
<br>
<%
}
%>
<br>
<label style="left:400px; top:250px; position:absolute;"><b>
<input type="button" value="Back" id="B1" name="B1" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="back_prev();">
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
