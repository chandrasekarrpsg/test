<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml2/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<style type="text/css">
.style1 {
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				text-align: center;
				border: 1px solid #008080;
				background-color: #C0C0C0;
}
.style4 {
                                border: 1px solid #008080;
				border-color: #008080;
				border-width: 1;
}




        .style6 {
				border-width: 1px;
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				text-align: left;
				background-color: #B0E6FF;
}
.style7 {
				border-width: 1px;
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				text-align: left;
}

        .style8 {
				border-width: 1px;
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				text-align: right;
				background-color: #B0E6FF;
}
.style9 {
				border-width: 1px;
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				text-align: right;
}



        </style>
        <script>

    var scrpt_OrderId;
    var scrpt_OrderTp;
    var scrpt_OrderDt;

    function getCheckedRadio(val,typ,dt) {
     /* var radioButtons = document.getElementsByName("rdo");
      for (var x = 0; x < radioButtons.length; x ++) {
        if (radioButtons[x].checked) {
          alert("You checked " + radioButtons[x].id);
        }
      } */
     scrpt_OrderId = val;
     scrpt_OrderTp = typ;
     scrpt_OrderDt = dt;
       
    }



            function pageSubt1(edtmkr,ordid){
                if(edtmkr == 'Y'){
                    formPageSubt.action = "order_entry.jsp";
                    formPageSubt.sOrdId.value=ordid;
                    formPageSubt.submit();
                }
             }

        </script>
    </head>

    <body bgcolor="#ece9d8" >
        <%

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
                    String sPgTyp = request.getParameter("sPgTyp");
                    String sOrdStatus = request.getParameter("sOrdStatus");
                    String sEditmkr = request.getParameter("sEditmkr");



        System.out.println(" SSSSS   "+sOrdStatus);

                    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
                    PreparedStatement ps  = null;
                    ResultSet rs=null;

                try{


                    ps  = mk.con.prepareStatement("select OD.ORDER_NO, to_char(OD.ORDER_DATE,'dd-MON-yyyy'), substr(OD.JOB_DESC,1,90),OD.P1_TOTAL, nvl(substr(OD.VENDOR_NAME,1,55),' '),ORDER_ID,ORDER_TYPE,to_char(OD.ORDER_DATE,'dd/mm/yyyy') "+
                                                  " from  ORBL_ORD_DTL OD    "+
                                                  " where OD.ORD_ORGN_STN = ?    "+
                                                  " and   OD.DEPT = ?   "+
                                                  " and   not exists (select 1 from ORBL_BILL_DTL BL    "+
                                                                    " where OD.ORDER_ID = BL.ORDER_ID)    "+
                                                  " and   ORDER_STATUS = ? "+
                                                  " order by 1 ");


                    ps.setString(1,sLoginStnCd);
                    ps.setString(2,sLoginDeptCd);
                    ps.setString(3,sOrdStatus);

                    rs=ps.executeQuery();
                    int cnt=1;

        %>

        <input type="hidden" name="sPgTyp" value="<%= sPgTyp%>" />
        <input type="hidden" name="sOrdTyp" value="" />

        <form name="formPageSubt" method="post" target="_self">
            <input type="hidden" name="sLoginStnCd" value="<%= sLoginStnCd%>" />
            <input type="hidden" name="sLoginStnShrtNm" value="<%= sLoginStnShrtNm%>" />
            <input type="hidden" name="sLoginStnLongNm" value="<%= sLoginStnLongNm%>" />
            <input type="hidden" name="sLoginDeptCd" value="<%= sLoginDeptCd%>" />
            <input type="hidden" name="sLoginDeptShrtNm" value="<%= sLoginDeptShrtNm%>" />
            <input type="hidden" name="sLoginDeptLongNm" value="<%= sLoginDeptLongNm%>" />
            <input type="hidden" name="sLoginEmpCd" value="<%= sLoginEmpCd%>" />
            <input type="hidden" name="sLoginEmpNm" value="<%= sLoginEmpNm%>" />
            <input type="hidden" name="sLoginEmpDesg" value="<%= sLoginEmpDesg%>" />
            <input type="hidden" name="sLoginEmpLvl" value="<%= sLoginEmpLvl%>" />           
            <input type="hidden" name="sLoginAdmMkr" value="<%= sLoginAdmMkr%>" />
            <input type="hidden" name="sOrdId" value="" />
            <input type="hidden" name="copy" value="" />
        </form>


        <table style="width: 99%; height: 33px;" class="style4">
				<tr>
								
								<td class="style1" style="width: 15px">
								</td>

								<td class="style1" style="width: 21px">Sl
								</td>
								
								<td class="style1">Order Number
								</td>
								
								<td class="style1" style="width: 80px">Order Date
								</td>
								
								<td class="style1" style="width: 500px">Order Description
								</td>
								
								<td class="style1" style="width: 66px">Order Amount
								</td>
								
								<td class="style1">Vendor Name
								</td>
								
				</tr>
<%
                             while(rs.next())
                                {
                                  if(cnt%2==0)
                                  {
%>
				<tr>
								<td class="style1" style="width: 15px">
    <input id="Radio1" type="radio" name="test" value="<%= rs.getString(6) %>" onclick="getCheckedRadio('<%= rs.getString(6) %>','<%= rs.getString(7) %>','<%= rs.getString(8) %>');" />
								</td>

								<td class="style6" style="width: 21px"><%= cnt %>
								</td>
								
								<td class="style6"><%= rs.getString(1) %>
								</td>
								
								<td class="style6" style="width: 80px"><%= rs.getString(2) %>
								</td>
								
								<td class="style6" style="width: 500px" onclick="pageSubt1('<%= sEditmkr %>','<%= rs.getString(6) %>');" onmouseover="JavaScript:this.style.cursor='hand' " ><%= rs.getString(3) %>
								</td>
								
								<td class="style8" style="width: 66px"><%= rs.getString(4) %>
								</td>
								
								<td class="style6"><%= rs.getString(5) %>
								</td>
								
				</tr>
<%
                                   }
                                   else
                                   {
%>
				<tr>

								<td class="style1" style="width: 15px">
    <input id="Radio1" type="radio" name="test" value="<%= rs.getString(6) %>" onclick="getCheckedRadio('<%= rs.getString(6) %>','<%= rs.getString(7) %>','<%= rs.getString(8) %>');" />
								</td>

								<td class="style7" style="width: 21px"><%= cnt %>
								</td>
								
								<td class="style7"><%= rs.getString(1) %>
								</td>
								
								<td class="style7" style="width: 80px"><%= rs.getString(2) %>
								</td>
								
								<td class="style7" style="width: 500px" onclick="pageSubt1('<%= sEditmkr %>','<%= rs.getString(6) %>');" onmouseover="JavaScript:this.style.cursor='hand' " ><%= rs.getString(3) %>
								</td>
								
								<td class="style9" style="width: 66px"><%= rs.getString(4) %>
								</td>
								
								<td class="style7"><%= rs.getString(5) %>
								</td>
								
				</tr>
<%
                                 }
                                cnt++;
                                }
                             rs.close();
                             ps.close();
%>
        </table>
<%
             }catch(Exception e){System.out.println(e); }
              finally{
                       if(ps!=null){
                          ps.close();
                       }
                       if(rs!=null){
                          rs.close();
                       }
                       if(mk.con!=null)
                          {
                          mk.con.close();
                          System.out.println("    CLOSED !!!!!");
                          }
                     }
%>

    </body>
</html>