<%@ page language="java" import="java.sql.*, java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<html>
<head>
<title> BUDGET MONITORING REPORT 6 </title>
<script type="text/javascript">
    var stnArray = new Array();
    var secArray = new Array();

    function preScript(){
          document.getElementById("stn_cd").disabled = true;
          document.getElementById("sec_cd").disabled = true;
          document.getElementById("rec_tp").disabled = true;
          document.getElementById("submit").disabled = true;

    }

    function loadSection( station ){

          sec_select = document.getElementById("sec_cd");

          sec_select.options.length = 1;

          for(i=0 ; i< stnArray.length; i++){
                  if(stnArray[i] == station || station == "%")
                       sec_select.options[sec_select.options.length] = new Option(secArray[i], secArray[i] );
          }

                       sec_select.options[sec_select.options.length] = new Option("ALL", "%" );

          document.getElementById("sec_cd").disabled = false;
    }
</script>
</head>
<body onLoad="preScript();">
<%

         String qry_struct = new String();
         String qry_inner  = new String();
         String bgt_yr     = new String();
         String bgt_seq    = new String();
         String bgt_mkr    = new String();
         String sec_cd     = new String();
         String stn_cd     = new String();
         String rec_tp     = new String();
         String color1     = new String();
         String color2     = new String();

         String colorB     = new String();

         int    counter    = 0;                 

         PreparedStatement ps_outer = null;
         PreparedStatement ps_innerA= null;
         PreparedStatement ps_innerB= null;
         ResultSet         rs_outer = null;
         ResultSet         rs_innerB= null;
         ResultSet         rs_innerA= null;

         double  budget    = 0;
         double  actual    = 0;

         DecimalFormat df = new DecimalFormat("#########.###");
         df.setMinimumFractionDigits(3);
         df.setMinimumIntegerDigits(1);

         //bgt_yr  = "2013";
         //sec_cd  = "E_I";
         //stn_cd  = "B";

         MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
         mk.con.setAutoCommit(false);



  qry_struct =    " select s.bgt_seq  bs, 	                                  " +
                  "        s.DESC1    des                                         " +
                  " from bgtm_repo6_struc s                                       " +
                  " where ? between bgt_fr_yr and nvl(bgt_to_yr,'9999')           " +
                  " order by  s.SL_NO_ROWORDER, s.BGT_HD_ROWORDER                 " ;
         




//qry_inner = " SELECT  ms.mord, to_char(NVL(a.aamt,0), '9999999990.099') from  " +

qry_inner = " SELECT  ms.mord, NVL(a.aamt,0) from  " +
            " (select         d.mm_order amo, 				     " +
            " 		sum(d.amt) aamt					     " +
            " from bgtm_repo6_data d					     " +
            " where d.bgt_yr =  ?					     " +
            " and   d.SEC_CD like ?	    	             " +
            " and   d.STN_CD like ?			     " +
            " and   d.bgt_mkr = ?					     " +
            " and   d.bgt_seq = ?					     " +
            " and   NVL(d.bgt_typ, '1') = ?					     " +
            " group by d.bgt_seq, d.bgt_mkr, d.MM_VAL||d.yy_val,d.MM_ORDER   " +
            " order by d.bgt_seq desc,  d.mm_order asc, d.bgt_mkr desc	     " +
            " ) a,							  " +
            " (								  " +
            " select mm_val mm,						  " +
            "        mm_order mord					  " +
            " from BGTM_MM_VAL_STRUCT					  " +
            " order by mord 						  " +
            " ) ms								  " +
            " where   ms.mord = a.amo(+)					  " ;


            //" --and   d.yy_val in ('13', '14')				     " +


   try{

       ps_outer = mk.con.prepareStatement( " select station_cd, section_cd from bgt_cd_section order by station_cd"); 

       rs_outer = ps_outer.executeQuery();

       counter = 0;

       while(rs_outer.next()){
%>
       <script>
              stnArray[<%=counter%>] = '<%=rs_outer.getString(1)%>';
              secArray[<%=counter%>] = '<%=rs_outer.getString(2)%>';
       </script>
<%
       counter ++;
       }

       rs_outer.close();
       ps_outer.close();

       ps_outer = mk.con.prepareStatement( "select to_char(sysdate, 'dd-MON-yyyy' ) from dual    ");

       rs_outer = ps_outer.executeQuery();

       while(rs_outer.next()) color1 = rs_outer.getString(1);

        
       rs_outer.close();
       ps_outer.close();


       ps_outer = mk.con.prepareStatement( " select distinct bgt_yr||' - '||to_char(add_months(to_date(bgt_yr,'YYYY'),12),'YYYY'),bgt_yr from bgt_form2b_data order by bgt_yr desc ");

       rs_outer = ps_outer.executeQuery();
 
       ps_innerA = mk.con.prepareStatement( " select BGT_STATION_CD, STATION_SHT_DESC from CD_STATION " );

       rs_innerA = ps_innerA.executeQuery();

        
%>
    
    <table border="1" width="110%">
      <tr bgcolor="#37b0e8">
       <td width="14%" align="center"><font color="white" size="4"><strong><%= color1 %> </strong></font></td>
       <td width="68%" align="center"><font color="white" size="5"><strong>
          STATIONWISE/DEPARTMENTWISE TARGET VS ACTUAL CASH FLOW STATEMENT
         </strong></font>
        </td>
       <td width="18%" align="center" >

<table border=0>
       <tr><td style="align:center" colspan=2><font color="#400040"><b>Legend</b></font></td></tr>
       <tr>
          <td style="background-color:navy">&nbsp;&nbsp;&nbsp;</td>
          <td align="left"><font color="#400040"><b>BUDGET</b></font></td>
       </tr>
       <tr>
          <td style="background-color:green">&nbsp;&nbsp;&nbsp;</td>
          <td align="left"><font color="#400040"><b>ACTUAL</b></font></td>
       </tr>
       <tr>
          <td style="background-color:red">&nbsp;&nbsp;&nbsp;</td>
          <td align="left"><font color="#400040"><b>ACTUAL > BUDGET</b></font></td>
       </tr>
</table>

</td>
      </tr>
    </table>
<form action="" method="get"> 
    <table width="110%" style="background-color:#86aeae">
    <tr>
        <td width="14%"><b>FIN YEAR : </b> 
                 <select name="bgt_yr" id="bgt_yr" onChange = " if(this.value != 'SEL') document.getElementById('stn_cd').disabled = false;
                                                                else{ document.getElementById('stn_cd').disabled = true;
                                                                      document.getElementById('sec_tp').disabled = true;
                                                                      document.getElementById('rec_tp').disabled = true;
                                                                      document.getElementById('submit').disabled = true;}">
           <option value="SEL">SELECT</option>
<%
           while(rs_outer.next()){
%>
           <option value="<%=rs_outer.getString(2)%>"><%=rs_outer.getString(1)%></option>
<%
            }
%>
                 </select>
        </td> 
        <td width="14%"><b>STATION : </b>  
                 <select name="stn_cd" id="stn_cd" onChange = " if(this.value != 'SEL') loadSection(this.value);
                                                                else{ document.getElementById('sec_cd').disabled = true; 
                                                                      document.getElementById('rec_tp').disabled = true;
                                                                      document.getElementById('submit').disabled = true;}">
           <option value="SEL">SELECT</option>
<%
           while(rs_innerA.next()){
%>
           <option value="<%=rs_innerA.getString(1)%>"><%=rs_innerA.getString(2)%></option>
<%
            }
%>
           <option value="%">ALL</option>
                 </select>
        </td>
        <td width="14%"><b>SECTION : </b> 
                 <select name="sec_cd" id="sec_cd" onChange = " if(this.value != 'SEL') document.getElementById('rec_tp').disabled = false;
                                                                else {document.getElementById('rec_tp').disabled = true;
                                                                      document.getElementById('submit').disabled = true;}">
                     <option value="SEL">SELECT</option>
                 </select>
        </td> 
        <td width="35%"><b>MONITORING BASIS : </b> 
                 <select name="rec_tp" id="rec_tp" onChange = " if(this.value != 'SEL') document.getElementById('submit').disabled = false;
                                                                else document.getElementById('submit').disabled = true; ">
                     <option value="SEL">SELECT</option>
                     <option value="1">BILL RELEASE DATE BY STN./DEPT</option>
                     <option value="2">BILL RECIVED DATE BY FINANCE DEPT</option>
                 </select>
        </td> 
        <td width="23%">
           <input type="submit" value="VIEW" name="submit" id="submit">
           <input type="button" value="RESET" name="reset" id="reset" onClick="window.open('bgtm_repo6_report.jsp','_self'); ">
           <input type="button" value="BACK" name="back" id="back" onClick="window.open('submenu_budget_mon_reports_dtl.jsp','_self'); ">
        </td>
    </tr>
    </table>
</form>
<%
          ps_outer.close();
          ps_innerA.close();
          rs_outer.close();
          rs_innerA.close();

          if(request.getParameter("bgt_yr") != null){


           bgt_yr = request.getParameter("bgt_yr");
           stn_cd = request.getParameter("stn_cd");
           sec_cd = request.getParameter("sec_cd");
           rec_tp = request.getParameter("rec_tp");
%>
<script>

          loadSection('<%=stn_cd%>');
          document.getElementById("stn_cd").disabled = false;
          document.getElementById("sec_cd").disabled = false;
          document.getElementById("rec_tp").disabled = false;

        document.getElementById("bgt_yr").value = '<%=bgt_yr%>';
        document.getElementById("stn_cd").value = '<%=stn_cd%>';
        document.getElementById("sec_cd").value = '<%=sec_cd%>';
        document.getElementById("rec_tp").value = '<%=rec_tp%>';

          document.getElementById("stn_cd").disabled = true;
          document.getElementById("sec_cd").disabled = true;
          document.getElementById("rec_tp").disabled = true;
          document.getElementById("bgt_yr").disabled = true;
</script>


    <table border="1" width="110%">
<%

       ps_outer = mk.con.prepareStatement( "                                                     " +
        "  select case 										 " +
	"              when mm_val >=04  then to_char(to_date(mm_val || ?,  'mmyyyy'),'MON-YY')	 " +
	"              when mm_val < 04  then to_char(to_date(mm_val || to_char(add_months(to_date(?,'rrrr'),12),'yy'), 'mmyy'),'MON-YY')	 " +
	"  			end, mm_order							 " +
	"  from BGTM_MM_VAL_STRUCT								 " +
	"  where mm_val <> '13' 								 " +
        "  order by mm_order									 " );

       ps_outer.setString(1,bgt_yr);
       ps_outer.setString(2,bgt_yr);
       rs_outer = ps_outer.executeQuery();

%>
       <tr bgcolor="navy"><td align="center"><font color="#FFFFFF"><b> BUDGET HEAD </b></font></td>
<%

       while(rs_outer.next()){
%>
            <td><font color="#FFFFFF"><b> <%= rs_outer.getString(1) %> </b></font></td>
<%
       }

       rs_outer.close();
       ps_outer.close();
%>
            <td><font color="#FFFFFF"><b> TOTAL </b></font></td>
       </tr>
<%
         


       ps_outer = mk.con.prepareStatement(qry_struct);
       ps_outer.setString(1, bgt_yr );


       rs_outer = ps_outer.executeQuery();


       counter = 0;

       while(rs_outer.next()){

                ps_innerB = mk.con.prepareStatement(qry_inner);
                ps_innerB.setString(1, bgt_yr );
                ps_innerB.setString(2, sec_cd );
                ps_innerB.setString(3, stn_cd );
                ps_innerB.setString(4, "B" );
                ps_innerB.setString(5, rs_outer.getString(1) );
                ps_innerB.setString(6, "1");

                rs_innerB = ps_innerB.executeQuery();


                ps_innerA = mk.con.prepareStatement(qry_inner);
                ps_innerA.setString(1, bgt_yr );
                ps_innerA.setString(2, sec_cd );
                ps_innerA.setString(3, stn_cd );
                ps_innerA.setString(4, "A" );
                ps_innerA.setString(5, rs_outer.getString(1) );
                ps_innerA.setString(6, rec_tp);

                rs_innerA = ps_innerA.executeQuery();

                if( counter == 10 || counter == 24 ){ color2 = "#fff7b2"; color1 = "#cff5f4"; }
                    else { color1 = "#fff7b2"; color2 = "#cff5f4"; }
 

%>
                <tr>
                <td align="left" style="background-color: <%= color1 %>"><b><%=rs_outer.getString(2)%></b></td>        
<%

                while( rs_innerA.next() && rs_innerB.next() ){

                budget = rs_innerB.getDouble(2);
                actual = rs_innerA.getDouble(2);

                if( actual > budget ) colorB = "red";
                           else       colorB = "green";

%>
                     <td align="right" style="background-color: <%= color2 %>">
                            <font color="navy"><%=df.format(budget)%></font>
                            <br>
                            <font color="<%=colorB%>"><%=df.format(actual)%></font>
                      </td>         
<%

                }

%>
          </tr>
<%

                rs_innerA.close();
                rs_innerB.close();
                ps_innerB.close();
                ps_innerA.close();

                counter ++ ;
       }

%>
          </table>
<%
 }

       rs_outer.close();
       ps_outer.close();



   }catch( Exception ee ) { ee.printStackTrace(); }
         finally { mk.con.close(); }


%>
</body>
</html>
