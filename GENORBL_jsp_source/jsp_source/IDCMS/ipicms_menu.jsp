<%@page import="Ipicms.IpicmsProcessBeanRemote"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="javax.naming.InitialContext"%>
<%!    IpicmsProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (IpicmsProcessBeanRemote) ic.lookup("java:comp/env/IpicmsProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("ipicms_menu.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml2/DTD/xhtml1-strict.dtd">
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

        </style>
        <script type="text/javascript" src="js/kaizenGenScript.js"></script>
        <script>
            function preScript(){
                if(sPgTyp.value == 'entry'){
                    if(f1.bOrdEntryPermit.value == 'true'){
                        formPageSubt.action = "order_entry.jsp";
                        formPageSubt.submit(); 
                    }
                }else if(sPgTyp.value == 'search'){
                    formPageSubt.action = "search_order.jsp";
                    formPageSubt.submit();
                }else if(sPgTyp.value == 'blReal'){
                    formPageSubt.action = "blRealScrn.jsp";
                    formPageSubt.submit();
                }
                return true;
            }

            function pageSubt(no){
                if(no == 1){
                    //if( formPageSubt.sLoginEmpCd.value == '975109' || formPageSubt.sLoginEmpCd.value == '970819' || formPageSubt.sLoginEmpCd.value == '133455' ){
                        formPageSubt.action = "ipicms_nomEntry_new_ver2.jsp";
                        formPageSubt.submit();
                    //}
                }else if(no == 2){
                    formPageSubt.action = "view_nomination.jsp?";
                    formPageSubt.submit();
                }else if(no == 3){
                    formPageSubt.action = "view_result.jsp";
                    formPageSubt.submit();
                }else if(no == 4){
                    formPageSubt.action = "history.jsp";
                    formPageSubt.submit();
                }else if(no == 5){
                    formPageSubt.action = "print.jsp";
                    formPageSubt.submit();
                }else if(no == 6){
                    /*formPageSubt.copy.value = 'FILE';
                    if(sOrdTyp.value == 'O' || sOrdTyp.value == 'C')formPageSubt.action = "sb_onetime_ord.jsp";
                    else if(sOrdTyp.value == 'T' || sOrdTyp.value == 'R' || sOrdTyp.value == '')formPageSubt.action = "order_not_onetime.jsp";
                    formPageSubt.submit();*/

                    formPageSubt.action = "ipicms_inbox.jsp";
                    formPageSubt.submit();
                }else if(no == 7){
                    formPageSubt.action = "ipicms_mtdytd_rep_ip.jsp";
                    formPageSubt.submit();
                }else if(no == 8){
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

    <body bgcolor="#ece9d8" onload="menuDisplay();">
        <!--body bgcolor="#ece9d8" onload=""-->
        <ul class="menu1">
            <li>
                <div id="liNomEntry" style ="width : 120px">
                    <a href="javascript:pageSubt(1)"><b>Nomination&nbsp;entry</b></a>
                </div>
            </li>
            <li>
                <div id="liViewNom" style ="width : 140px ;">
                    <a href="javascript:pageSubt(2)"><b>View&nbsp;nominations</b></a>
                </div>
            </li>
            <li>
                <div id="liViewRslt" style ="width : 120px ;">
                    <a href="javascript:pageSubt(3)"><b>View&nbsp;results</b></a>
                </div>
            </li>
            <li>
                <div id="liViewHist" style ="width : 120px ;">
                    <a href="javascript:pageSubt(4)"><b>View&nbsp;history</b></a>
                </div>
            </li>

            <li>
                <div id="liPrntNom" style ="width : 80px">
                    <a href="javascript:pageSubt(5)"><b>Print</b></a>
                </div>
            </li>
            <li>
                <div id="liInbox" style ="width : 80px">
                    <a href="javascript:pageSubt(6)"><b>Inbox</b></a>
                </div>
            </li>
            <li>
                <div id="liMtdYtdRep" style ="width : 200px">
                    <a href="javascript:pageSubt(7)"><b>Kaizen Summary Report</b></a>
                </div>
            </li>
            <li>
                <a href="javascript:pageSubt(8)"><b><span id="spanBack">Close</span></b></a>
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
                    String sLoginEmpKaizenMkr = request.getParameter("sLoginEmpKaizenMkr");


                    List rows = null;
                    Iterator iterateOuter = null;
                    Iterator iterateInner = null;
                    Map mapDiffPermit = new HashMap();
                    mapDiffPermit.put("sLoginEmpKaizenMkr", sLoginEmpKaizenMkr);
                    mapDiffPermit.put("sContestId", "");
                    List lstDiffPermit = hRemote.getDiffPermit(mapDiffPermit);
                    iterateOuter = lstDiffPermit.iterator();

                    String sEntryPermit = null;

                    while (iterateOuter.hasNext()) {
                        rows = (List) iterateOuter.next();

                        iterateInner = rows.iterator();
                        while (iterateInner.hasNext()) {
                            sEntryPermit = (String) iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                        }
                    }




        %>

        <form name="f1">
            <input type="hidden" name="sEntryPermit" value="<%= sEntryPermit%>" />
            <input type="hidden" name="sStg" value="" />
            <input type="hidden" name="sLoginEmpKaizenMkr" value="<%= sLoginEmpKaizenMkr%>" />
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
            <input type="hidden" name="sLoginAdmMkr" value="<%= sLoginAdmMkr%>" />
            <input type="hidden" name="sLoginEmpKaizenMkr" value="<%= sLoginEmpKaizenMkr%>" />
            <input type="hidden" name="sContestId" value="" />
            <input type="hidden" name="sMsg" value="" />
            <input type="hidden" name="sMode" value="N" />

        </form>

    </body>
</html>
