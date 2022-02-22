<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Order.*"%>
<%!    OrderProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (OrderProcessBeanRemote) ic.lookup("java:comp/env/OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("order_entry.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

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
            function preScript(){
                if(sPgTyp.value == 'entry'){
                    if(f1.bOrdEntryPermit.value == 'true'){
                        formPageSubt.action = "order_entry.jsp";
                        formPageSubt.submit(); 
                    }
                }else if(sPgTyp.value == 'search'){
                    formPageSubt.action = "search_order_MaxNoBls.jsp";
                    formPageSubt.submit();
                }else if(sPgTyp.value == 'blReal'){
                    formPageSubt.action = "blRealScrn.jsp";
                    formPageSubt.submit();
                }
                return true;
            }

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
               setTimeout(getCheked, 15000);
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

             if(isBeforeDate(window.parent.bottom.scrpt_OrderDt,'19/04/2013')==false)
             {

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

             }
            else
             {
               alert("Orders of earlier date cannot be printed");
             }    
            }



            function getCheked()
            {
            //alert(window.parent.bottom.scrpt_OrderId);
            //alert(window.parent.bottom.scrpt_OrderTp);
            //alert(window.parent.bottom.scrpt_OrderDt);

             var page='';
             var cpp='';
             var ltt='';
             var oid='';


             if(isBeforeDate(window.parent.bottom.scrpt_OrderDt,'19/04/2013')==false)
             {

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
             //   alert(gbl_i);
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

             }
            else
             {
               alert("Orders of earlier date cannot be printed");
             }
            }

            function mmprint()
             {
              window.print();
             }


            function pageSubt(no){
                if(no == 1){
                    formPageSubt.action = "#";
                    formPageSubt.sOrdId.value="";
                    formPageSubt.submit();
                }else if(no == 2){
                    formPageSubt.action = "search_order.jsp";
                    formPageSubt.submit();
                }else if(no == 3){
                    formPageSubt.action = "#";
                    formPageSubt.submit();
                }else if(no == 4){
                    formPageSubt.action = "#";
                    formPageSubt.submit();
                }else if(no == 7){

                    //alert(window.parent.sBack.value);

                    var sVarBack = window.parent.sBack.value;

                    var last = sVarBack.substring(sVarBack.length - 1,sVarBack.length);

                    if(document.getElementById("spanBack").firstChild.data=='Close'){

                        //window.parent.open('close.html','_self');
                        window.parent.open('invoke_menu_page.jsp?userid='+formPageSubt.sLoginEmpCd.value,'_self');
                        return true;
                    }

                    var iIndx = 0 ;
                    var iCnt = 1 ;
                    for(j = sVarBack.length - 2 ; j >= 0 ; j--){
                        if(last == '4' || last == '5'){
                            if(sVarBack.charAt(j) != '4' && sVarBack.charAt(j) != '5'){iIndx = j ; break}
                        }else{
                            if(sVarBack.charAt(j) != last){iIndx = j ; break}
                        }
                        iCnt++ ;
                    }

                    
                    window.parent.sBack.value = sVarBack.substring(0,iIndx + 1);
                    window.parent.sBackClick.value = '1';
                    history.go(-iCnt);

                }
            }
        </script>
    </head>

    <body bgcolor="#ece9d8" onload="preScript();">
        <ul class="menu1">
            <li>
                <a href="javascript:pageSubt(7)"><b><span id="spanBack">Close</span></b></a>
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
                    String sPgTyp = request.getParameter("sPgTyp");
                    String sOrdEntryPermit = new String("true");


                    List rows = null;
                    Iterator iterateOuter = null;
                    Iterator iterateInner = null;
                    Map mapDiffPermit = new HashMap();
                    mapDiffPermit.put("sLoginEmpLvl",sLoginEmpLvl);
                    mapDiffPermit.put("sOrdId","");
                    List lstDiffPermit = hRemote.getDiffPermit(mapDiffPermit);
                    iterateOuter = lstDiffPermit.iterator();

                    while (iterateOuter.hasNext()) {
                        rows = (List) iterateOuter.next();

                        iterateInner = rows.iterator();
                        while (iterateInner.hasNext()) {
                            sOrdEntryPermit = (String) iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                        }
                    }



        %>

        <input type="hidden" name="sPgTyp" value="<%= sPgTyp%>" />
        <input type="hidden" name="sOrdTyp" value="" />

        <form name="f1">
            <input type="hidden" name="sOrdGenStnCd" value="" />
            <input type="hidden" name="sOrdSts" value="" />
            <input type="hidden" name="bOrdEntryPermit" value="<%= sOrdEntryPermit %>" />
        </form> 


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

            <input type="hidden" name="sOrdId" value="" />
            <input type="hidden" name="copy" value="" />
            <input type="hidden" name="sOrdStatus" value="" />
            <input type="hidden" name="sEditmkr" value="" />
        </form>



<%
%>

    </body>
</html>
