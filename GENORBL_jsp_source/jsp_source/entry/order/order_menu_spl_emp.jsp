<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml2/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title> Stu Nicholls | CSSplay | Professional series #1</title>
        <style type="text/css">
            /*Credits: CSSpplay */
            /*URL: http://www.cssplay.co.uk/menus/pro_one */

            .menu1 {padding:0 0 0 32px; margin:0; list-style:none; height:35px; background:#00f url(Pics/Order/button1.gif); position:relative; border:1px solid #000; border-width:0 1px; border-bottom:1px solid #444;}
            .menu1 li {float:left;}
            .menu1 li a {display:block; float:left; height:35px; line-height:35px; color:#fff; text-decoration:none; font-size:11px; font-family:arial, verdana, sans-serif; font-weight:bold; text-align:center; padding:0 0 0 8px; cursor:pointer;}
            .menu1 li a b {float:left; display:block; padding:0 16px 0 8px;}
            .menu1 li.current a {color:#fff; background:url(Pics/Order/button3.gif);}
            .menu1 li.current a b {background:url(Pics/Order/button3.gif) no-repeat right top;}
            .menu1 li a:hover {color:#fff; background:#000 url(Pics/Order/button2.gif);}
            .menu1 li a:hover b {background:url(Pics/Order/button2.gif) no-repeat right top;}
            .menu1 li.current a:hover {color:#fff; background:#000 url(Pics/Order/button3.gif); cursor:default;}
            .menu1 li.current a:hover b {background:url(Pics/Order/button3.gif) no-repeat right top;}

.style1 {
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				text-align: center;
				border: 1px solid #008080;
				background-color: #C0C0C0;
}
.style2 {
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				border: 1px solid #008080;
				background-color: #43C082;
}
.style4 {
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				border-color: #008080;
				border-width: 0;
}




        .style5 {
				font-family: Arial, Helvetica, sans-serif;
				font-size: x-small;
				text-align: center;
				border: 1px solid #008080;
				background-color: #C0C0C0;
}



        </style>




        <script>

            function pageSubt1(no,sts,edtmkr){
               getOrdId();
                if(no == 6){
                    formPageSubt.action = "order_inbox_dtl.jsp";
                    formPageSubt.sOrdStatus.value=sts;
                    formPageSubt.sEditmkr.value=edtmkr;
                    formPageSubt.submit();
                }
             }
            
            function getOrdId()
            {
            //alert(window.parent.bottom.scrpt_OrderId);
            }
         
            var gbl_i=0;

            function gbl_getCheked()
            {
             // alert('In GBL  ');
              for(var i=0;i<4;i++)
               {
               setTimeout(getCheked(), 15000);
               }

            }


            function pageSubt(no){
                 if(no == 7){
                    //alert(window.parent.sBack.value);

                    var sVarBack = window.parent.sBack.value;

                    var last = sVarBack.substring(sVarBack.length - 1,sVarBack.length);

                    /*if(last == 1){

                        window.parent.open('close.html','_self');
                    }*/

                    window.parent.open('invoke_menu_page.jsp?userid='+formPageSubt.sLoginEmpCd.value,'_self');
                }
           }

function isBeforeDate(str,dt){
                 var mydateinYYYYMMDD = str.substring(6,10)+str.substring(3,5)+str.substring(0,2);
                 var d1 = parseInt(mydateinYYYYMMDD,10);
                 var mydateinYYYYMMDD1 = dt.substring(6,10)+dt.substring(3,5)+dt.substring(0,2);
                 var d2 = parseInt(mydateinYYYYMMDD1,10);

                 var flag=false;
                 if (d1 < d2)
                 {
                    flag = true;
                 }
                 else
                    flag = false;
                    return flag;
         }

            function getPreview(pi)
            {
             var page='';
             var cpp='';
             var ltt='';
             var oid='';

          //  alert(window.parent.bottom.scrpt_OrderDt);

          /*   if(isBeforeDate(window.parent.bottom.scrpt_OrderDt,'19/04/2013')==false)
             {
          */
               if(window.parent.bottom.scrpt_OrderTp=='T'||window.parent.bottom.scrpt_OrderTp=='R')
                {
                 page = "order_not_onetime.jsp";
                }
               if(window.parent.bottom.scrpt_OrderTp=='O'||window.parent.bottom.scrpt_OrderTp=='C'||window.parent.bottom.scrpt_OrderTp=='L')
                {
                page = "sb_onetime_ord.jsp";
                }

                oid=window.parent.bottom.scrpt_OrderId;

             if(document.getElementById('Checkbox4').checked)
               {
                ltt='yes';
               }
             else
               {
                ltt='no';
               }

             if(pi==0)
              {
             if(document.getElementById('Checkbox1').checked)
               {
                cpp='VENDOR';
                window.open(page+'?sOrdId='+oid+'&cpy='+cpp+'&lthd='+ltt,'','toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1');
               }
              }
             if(pi==1)
              {
             if(document.getElementById('Checkbox2').checked)
               {
                cpp='FINANCE';
                window.open(page+'?sOrdId='+oid+'&cpy='+cpp+'&lthd='+ltt,'','toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1');
               }
              }
             if(pi==2)
              {
             if(document.getElementById('Checkbox3').checked)
               {
                cpp='FILE';
                window.open(page+'?sOrdId='+oid+'&cpy='+cpp+'&lthd='+ltt,'','toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1');
               }
              }
             if(pi==3)
              {
             if(document.getElementById('Checkbox5').checked)
               {
                page = "annex_report.jsp";
                window.open(page+'?sOrdId='+oid,'','toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1');
               }
              }

       /*      }
            else
             {
               alert("Orders of earlier date cannot be printed");
             }   
       */
            }




            function getCheked()
            {
             var page='';
             var cpp='';
             var ltt='';
             var oid='';


      /*       if(isBeforeDate(window.parent.bottom.scrpt_OrderDt,'19/04/2013')==false)
             {
      */

               if(window.parent.bottom.scrpt_OrderTp=='T'||window.parent.bottom.scrpt_OrderTp=='R')
                {
                 page = "order_not_onetime_letter.jsp";
                }
            if(window.parent.bottom.scrpt_OrderTp=='O'||window.parent.bottom.scrpt_OrderTp=='C'||window.parent.bottom.scrpt_OrderTp=='L')
                {
                page = "sb_onetime_ord_letter.jsp";
                }

                oid=window.parent.bottom.scrpt_OrderId;

             if(document.getElementById('Checkbox4').checked)
               {
                ltt='yes';
               }
             else
               {
                ltt='no';
               }

             if(gbl_i==0)
              {
             if(document.getElementById('Checkbox1').checked)
               {
                cpp='VENDOR';
                window.open(page+'?sOrdId='+oid+'&cpy='+cpp+'&lthd='+ltt,'','width=100,height=100');
               }
              }
             if(gbl_i==1)
              {
             if(document.getElementById('Checkbox2').checked)
               {
              //  alert(gbl_i);
                cpp='FINANCE';
                window.open(page+'?sOrdId='+oid+'&cpy='+cpp+'&lthd='+ltt,'','width=100,height=100');
               }
              }
             if(gbl_i==2)
              {
             if(document.getElementById('Checkbox3').checked)
               {
              //  alert(gbl_i);
                cpp='FILE';
                window.open(page+'?sOrdId='+oid+'&cpy='+cpp+'&lthd='+ltt,'','width=100,height=100');
               }
              }
             if(gbl_i==3)
              {
             if(document.getElementById('Checkbox5').checked)
               {
              //  alert(document.bulkPrint4.sOrdId.value);
                page = "annex_report_bulkprnt.jsp";
                window.open(page+'?sOrdId='+oid,'','width=100,height=100');
               }
              }
            gbl_i++;

               if(gbl_i<4)
               setTimeout(getCheked, 10000);
               else
                gbl_i=0;

        /*     }
            else
             {
               alert("Orders of earlier date cannot be printed");
             }
        */

            }

            function mmprint()
             {
              window.print();
             }


        </script>
    </head>

    <body bgcolor="#ece9d8" onload="">
        <ul class="menu1">
            <li>
                <div id="liOrdEntry" style ="width : 120px ;visibility : hidden">
                    <a href="javascript:pageSubt(1)"><b>Order&nbsp;Entry</b></a>
                </div>
            </li>
            <li>
                <div id="liOrdSrch" style ="width : 120px ;visibility : hidden">
                    <a href="javascript:pageSubt(2)"><b>Order&nbsp;Search&nbsp;&amp;&nbsp;Update</b></a>
                </div>
            </li>
            <li>
                <div id="liBlEntry" style ="width : 120px ;visibility : hidden">
                    <a href="javascript:pageSubt(3)"><b>Bill&nbsp;Entry</b></a>
                </div>
            </li>
            <li>
                <div id="liBlSrch" style ="width : 120px ;visibility : hidden">
                    <a href="javascript:pageSubt(4)"><b>Bill&nbsp;Search&nbsp;&amp;&nbsp;Update</b></a>
                </div>
            </li>

            <li>
                <div id="liPrntOrd" style ="width : 120px ;" onmouseover="document.getElementById('pBx').style.visibility='visible';document.getElementById('iBx').style.visibility='hidden';">
                    <a href="javascript:pageSubt(5)"><b>Print&nbsp;Order</b></a>
                </div>
            </li>
            <li>
                <div id="liInbox" style ="width : 120px" onmouseover="document.getElementById('iBx').style.visibility='visible';document.getElementById('pBx').style.visibility='hidden';">
                    <a href="javascript:pageSubt(6)"><b>Inbox</b></a>
                </div>
            </li>
            <li>
                <a href="javascript:pageSubt(7)"><b>Back</b></a>
            </li>
        </ul>


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

                    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
                    PreparedStatement ps  = null;
                    ResultSet rs=null;

                try{


                    ps  = mk.con.prepareStatement(" select distinct (select distinct ORDER_STATUS_DESC from ORBL_CD_ORDER_STATUS "+
                                                  " where STATION = A.STN "+
                                                  " and   ORDER_STATUS = A.ST), A.c,A.STN,A.DPT,A.ST, B.EDIT_MKR from  "+
                                                  " (select count(*) c, OD.ORDER_STATUS ST ,OD.ORD_ORGN_STN STN,OD.DEPT DPT "+
                                                  " from  ORBL_ORD_DTL OD "+
                                                  " where OD.ORD_ORGN_STN = ? "+
                                                  " and   OD.DEPT = ? "+
                                                  " and   not exists (select 1 from ORBL_BILL_DTL BL "+
                                                                    " where OD.ORDER_ID = BL.ORDER_ID) "+
                                                  " group by OD.ORDER_STATUS,OD.ORD_ORGN_STN,OD.DEPT) A, "+
                                                  " (select * from ORBL_CD_INBOX_LVL_STATUS "+
                                                  " where STATION = ? "+
                                                  " and   LOGIN_LEVEL = ?) B "+
                                                  " where A.STN = B.STATION "+
                                                  " and   A.ST = B.ORDER_STATUS "+
                                                  " order by 5 ");


                    ps.setString(1,sLoginStnCd);
                    ps.setString(2,sLoginDeptCd);
                    ps.setString(3,sLoginStnCd);
                    ps.setString(4,sLoginEmpLvl);

                    rs=ps.executeQuery();

        %>

        <input type="hidden" name="sPgTyp" value="<%= sPgTyp%>" />
        <input type="hidden" name="sOrdTyp" value="" />

        <form name="formPageSubt" method="post" target="bottom">
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
            <input type="hidden" name="sOrdStatus" value="" />
            <input type="hidden" name="sEditmkr" value="" />
        </form>


        <div id="iBx" style="visibility:hidden; position:absolute; left: 10px; top:50px; ">
        <table style="width: 100%" class="style4">
				<tr>
                                                                <td class="style1" style="width: 10px">
								<input name="Button1" type="button" value="X" style="width: 15px; height: 17px;" onclick="document.getElementById('iBx').style.visibility='hidden'"/>
								</td>
								<td class="style5" style="width: 40px"><strong>Inbox</strong></td>

<%
                             while(rs.next())
                                {

%>
								<td style="width: 220px" class="style2" onclick="pageSubt1(6,'<%= rs.getString(5) %>','<%= rs.getString(6) %>');" onmouseover="JavaScript:this.style.cursor='hand' " ><%= rs.getString(1) %></td>
								<td class="style2" style="width: 10px"><%= rs.getString(2) %></td>
<%
                                }
                             rs.close();
                             ps.close();
%>
				</tr>
        </table>
        </div>


        <div id="pBx" style="visibility:hidden; position:absolute; left: 10px; top:50px; ">
        <table style="width: 100%">
        <tr>
        <td class="style5" style="width: 77px"><strong>Print</strong></td>
        <td class="style2">Vendor's Copy</td>
        <td style="width: 14px" class="style5" >
        <input name="Checkbox1" type="checkbox" checked="checked" value="" />
        </td><td>
        <input name="Button2" type="button" value="VIEW" style="width: 45px; height: 20px;" onclick="getPreview(0);"/>
        </td>
        <td class="style2">Finance Copy</td>
        <td style="width: 14px" class="style5" >
        <input name="Checkbox2" type="checkbox" checked="checked" value=""/>
        </td><td>
        <input name="Button2" type="button" value="VIEW" style="width: 45px; height: 20px;" onclick="getPreview(1);"/>
        </td>
        <td class="style2">File Copy</td>
        <td style="width: 15px" class="style5" >
        <input name="Checkbox3" type="checkbox" checked="checked" value=""/>
        </td><td>
        <input name="Button2" type="button" value="VIEW" style="width: 45px; height: 20px;" onclick="getPreview(2);"/>
        </td>
        <td class="style2">Annexure</td>
        <td style="width: 15px" class="style5" >
        <input name="Checkbox5" type="checkbox" value=""/>
        </td><td>
        <input name="Button2" type="button" value="VIEW" style="width: 45px; height: 20px;" onclick="getPreview(3);"/>
        </td>
        <td class="style2">Include Header & Footer</td>
        <td style="width: 11px" class="style5" >
        <input name="Checkbox4" type="checkbox" checked="checked" value=""/></td>
        <td class="style5" ><input name="Button1" type="button" value="OK" style="width: 30px; height: 20px;" onclick="getCheked();"/></td>
        </tr>
        </table>
        </div>



        <iframe name="prnt1" id="prnt1" style="width: 0px; height: 0px;">
        </iframe>
        <iframe name="prnt2" id="prnt2" style="width: 0px; height: 0px;">
        </iframe>
        <iframe name="prnt3" id="prnt3" style="width: 0px; height: 0px;">
        </iframe>
        <iframe name="prnt4" id="prnt4" style="width: 0px; height: 0px;">
        </iframe>


        <form name="bulkPrint1" method="post" target="prnt1">
            <input type="hidden" name="sOrdId" value="" />
            <input type="hidden" name="copy" value="" />
            <input type="hidden" name="lthd" value="" />
        </form>
        <form name="bulkPrint2" method="post" target="prnt2">
            <input type="hidden" name="sOrdId" value="" />
            <input type="hidden" name="copy" value="" />
            <input type="hidden" name="lthd" value="" />
        </form>
        <form name="bulkPrint3" method="post" target="prnt3">
            <input type="hidden" name="sOrdId" value="" />
            <input type="hidden" name="copy" value="" />
            <input type="hidden" name="lthd" value="" />
        </form>
        <form name="bulkPrint4" method="post" target="prnt4">
            <input type="hidden" name="sOrdId" value="" />
        </form>


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
