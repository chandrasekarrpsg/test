<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Order.*"%>
<%@page import="javax.naming.InitialContext"%>
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
            System.out.println("search_order.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <style>
        .buttonActive{
            font-family      : Courier New ;
            font-size        : 12pt        ;
            font-weight      : bold        ;
            color            : #FFFFFF     ;
            background-color : #274F52     ;
            width            : 100px       ;
            border-style     : outset
        }

        .buttonInactive{
            font-family      : Courier New ;
            font-size        : 12pt        ;
            font-weight      : bold        ;
            color            : #FFFFFF     ;
            background-color : #CDCDCD     ;
            width            : 100px       ;
            border-style     : outset
        }

        .table {
            font-family     : verdana;
            font-size       : 11px;
            text-align      : left;
        }

        .table_thead  {
            cursor : pointer;
        }

        .table_thead_tr {
            background : #ffdd00;
        }

        .table_tfoot_tr {
            background : #ffffff;
        }

        .table_thead_tr_th{
            border-left   : 1pt solid red ;
            border-right   : 1pt solid red ;
            border-top : 1px solid red ;
            border-bottom : 1px solid red ;
        }

        .table_tfoot_tr_th{
            border-left : 1pt solid red ;
            border-right : 1pt solid red ;
            border-top  : 1px solid red ;
            border-bottom : 1pt solid red ;
        }

        .table_tbody_tr_td{
            border-left   : 1pt solid green ;
            border-right   : 1pt solid green ;
            border-top : 1pt solid green ;
            border-bottom   : 1pt solid green ;
        }


    </style>

    <script type="text/javascript" src="./js/sel_date.js"></script>
    <script type="text/javascript" src="js/ordGenScript.js"></script>
    <script>
        function sel_budg()
        {
            var url="budgetOrd.jsp?sLov="+f1.sOrdTyp.value;
            window.f1.sBudgHead.value="Please wait.........."
            window.f1.sBudgHeadDesc.value="Please wait.........."
            window.status="Opening Budget Heads Menu !. Please wait....................."
            var c=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");
            window.status=" "
            if (c!=null) {
                budg = c.split("|");
                document.f1.sSeqNo.value=budg[0]
                document.f1.sBudgHead.value=budg[1]
                document.f1.sBudgHeadDesc.value=budg[2]
            }
            else {
                document.f1.sSeqNo.value=""
                document.f1.sBudgHead.value=""
                document.f1.sBudgHeadDesc.value=""
            }
        }



        function sel_cont(){

            document.f1.sVndrNm.value="";

            var url="contractor_list.jsp?sVndrNmLike="
            var o=showModalDialog(url,0,"dialogWidth:400px;dialogHeight:550px");

            /*var cnarray=c.split("~");
            var frstParam=cnarray[0];
            var secondParam=cnarray[1];
            alert(frstParam+"-"+secondParam);*/

            var frstParam = o.frstParam;
            var secondParam = o.secondParam ;

            //alert(frstParam+"-"+secondParam);
            
            while(frstParam=="recall"){

                url="contractor_list.jsp?sVndrNmLike="+secondParam;
                o=showModalDialog(url,0,"dialogWidth:400px;dialogHeight:550px");
                /*cnarray=c.split("~");
                frstParam=cnarray[0];
                secondParam=cnarray[1];
                alert(frstParam+"-"+secondParam);*/

                frstParam = o.frstParam;
                secondParam = o.secondParam ;

                //alert(frstParam+"-"+secondParam);
            }

            if(frstParam != "close")document.f1.sVndrNm.value=secondParam;
        }

        function add_onclick(){
            f2.action="frame1.jsp"
            f2.method="POST"
            f2.submit()
        }



        function search_onclick(){
            f1.action="order_list.jsp"
            f1.method="POST"
            f1.submit()
        }

        function chkOrdDtFrm(){

            if(f1.sOrdDtFrm.value != ''){
                if(isDate(f1.sOrdDtFrm) && date_compare(f1.sOrdDtFrm,f1.sSysDt,'Order Date From','System Date','<=',f1.sOrdDtFrm)){}
                else return false;
            }
            return true;
        }

        function chkOrdDtTo(){

            if(f1.sOrdDtTo.value != ''){
                if(isDate(f1.sOrdDtTo) && date_compare(f1.sOrdDtTo,f1.sSysDt,'Order Date To','System Date','<=',f1.sOrdDtTo)){}
                else return false;
            }
            return true;
        }

        function getDept(){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=dept" ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            //alert(url);
            var deptXML ;
            try{
                deptXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    deptXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    deptXML = new XMLHttpRequest();
                }
            }
            deptXML.open('POST',url,true);
            deptXML.send('');
            deptXML.onreadystatechange = function(){
                if(deptXML.readyState == 4){
                    //alert(deptXML.responseText);
                    myval = deptXML.responseXML.getElementsByTagName("DEPT");

                    for(i = document.f1.sOrdForDeptCd.options.length - 1 ; i > 0 ; i--){
                        document.f1.sOrdForDeptCd.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[1],cell[0]) ;
                        document.f1.sOrdForDeptCd.add(option) ;

                    }
                }
            }
        }

        function getOrdTyp(){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=ordTyp" ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            //alert(url);
            var unitXML ;
            try{
                ordTypXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    ordTypXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    ordTypXML = new XMLHttpRequest();
                }
            }
            ordTypXML.open('POST',url,true);
            ordTypXML.send('');
            ordTypXML.onreadystatechange = function(){
                if(ordTypXML.readyState == 4){
                    //alert(equipXML.responseText);
                    myval = ordTypXML.responseXML.getElementsByTagName("ORDTYP");

                    for(i = document.f1.sOrdTyp.options.length - 1 ; i > 0 ; i--){
                        document.f1.sOrdTyp.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[1],cell[0]) ;
                        document.f1.sOrdTyp.add(option) ;

                    }
                }
            }
        }

        function chkSOrdForStnCd(){
            //if(f1.sOrdForStnCd.value != ''){
            getDept();
            //}
            return true;
        }

        function chkEmpSOrdForStnCd(){
            if(f1.sOrdForStnCd.value == '-1'){
                alert('Please select a value !');
                f1.sOrdForStnCd.focus();
                return false;
            }
            return true;
        }

        function validate_form(){
            if(f1.sumtSearchOrder.className == 'buttonInactive')return false;

            if(chkEmpSOrdForStnCd() && chkOrdDtFrm() && chkOrdDtTo() && (f1.sOrdDtFrm.value == '' || f1.sOrdDtTo.value == '' || date_compare(f1.sOrdDtFrm,f1.sOrdDtTo,'Order Date From','Order Date To','<=',f1.sOrdDtFrm) ) ){}
            else return false;

            f1.sumtSearchOrder.className = 'buttonInactive';
            document.getElementById("div_img").style.visibility = 'visible';

            return true;
        }
    </script>
</head>

<body background="Pics/Order/lblue047.gif" onload="">
    <jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>
    <jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>


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

                String sOrdForStnCd = new String();
                String sOrdForStnShrtNm = new String();
                String sOrdForStnLongNm = new String();
                String sDeptCd = new String();
                String sDeptShrtNm = new String();

                System.out.println("search order : " + sLoginStnCd);
                System.out.println(sLoginStnShrtNm);
                System.out.println(sLoginStnLongNm);
                System.out.println(sLoginDeptCd);
                System.out.println(sLoginDeptShrtNm);
                System.out.println(sLoginDeptLongNm);
                System.out.println(sLoginEmpCd);
                System.out.println(sLoginEmpNm);
                System.out.println(sLoginEmpDesg);
                System.out.println(sLoginEmpLvl);

                List rows = null;
                Iterator iterateOuter = null;
                Iterator iterateInner = null;
                String sSysDt = new String();
                List lstSysDt = hRemote.getSysDt();
                iterateOuter = lstSysDt.iterator();
                while (iterateOuter.hasNext()) {
                    rows = (List) iterateOuter.next();
                    iterateInner = rows.iterator();
                    while (iterateInner.hasNext()) {
                        sSysDt = (String) iterateInner.next();
                    }
                }



                if (!(sLoginStnCd.equals("019") || sLoginStnCd.equals("042"))) {
                    sOrdForStnCd = sLoginStnCd;
                    sOrdForStnShrtNm = sLoginStnShrtNm;
                    sOrdForStnLongNm = sLoginStnLongNm;
                }

                sDeptCd = sLoginDeptCd;
                sDeptShrtNm = sLoginDeptShrtNm;



                List lstDept = null;
                rows = null;
                iterateOuter = null;
                iterateInner = null;

                lstDept = hRemote.getDept(sOrdForStnCd);

                iterateOuter = lstDept.iterator();

                int iCntDept = 0;

                while (iterateOuter.hasNext()) {
                    rows = (List) iterateOuter.next();

                    iterateInner = rows.iterator();
                    while (iterateInner.hasNext()) {
                        iCntDept = iCntDept + 1;
                        iterateInner.next();
                        iterateInner.next();
                    }
                }



    %>


    <b>
        <!--p align="center">
            <font size="5" face="Verdana" color="#0000ff">
                Orders&nbsp;:&nbsp;Search&nbsp;
            </font>
        </p>
        <br><br-->
        <form name="f1" action="order_list_MaxNoBls.jsp" method="post" onsubmit="return validate_form();">
            <input type="hidden" name="sLoginStnCd" value="<%= sLoginStnCd%>">
            <input type="hidden" name="sLoginStnShrtNm" value="<%= sLoginStnShrtNm%>">
            <input type="hidden" name="sLoginStnLongNm" value="<%= sLoginStnLongNm%>">
            <input type="hidden" name="sLoginDeptCd" value="<%= sLoginDeptCd%>">
            <input type="hidden" name="sLoginDeptShrtNm" value="<%= sLoginDeptShrtNm%>">
            <input type="hidden" name="sLoginDeptLongNm" value="<%= sLoginDeptLongNm%>">
            <input type="hidden" name="sLoginEmpCd" value="<%= sLoginEmpCd%>">
            <input type="hidden" name="sLoginEmpNm" value="<%= sLoginEmpNm%>">
            <input type="hidden" name="sLoginEmpDesg" value="<%= sLoginEmpDesg%>">
            <input type="hidden" name="sLoginEmpLvl" value="<%= sLoginEmpLvl%>">
            <input type="hidden" name="sSysDt" value="<%= sSysDt%>">
            <input type="hidden" name="sSeqNo" value="">
            <input type="hidden" name="sBudgHead" value="">
            <input type="hidden" name="sOrdSts" value=""/>
            <input type="hidden" name="bOrdEntryPermit" value="false"/>
            <div align="center">
                <b><font face="Times New Roman" size="5" color="mediumblue">SEARCH&nbsp;&nbsp;&nbsp;ORDER&nbsp;&nbsp;&nbsp;SCREEN</font></b>
                <table cellspacing="1" cellpadding="2" class="table" id="" width="70%" style="border-collapse: collapse ; border:1pt solid mediumblue">
                    <tbody> 
                        <tr>
                            <td width="28%" ><font face="Times New Roman" color="#80080" size="3"><b>Order For Station</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>

                            <%    if (sLoginStnCd.equals("019")) {

                            %>
                            <td colspan="4">
                                <b><font face="Times New Roman" color="#FFFFFF">
                                        <select name="sOrdForStnCd" size="1" onchange="chkSOrdForStnCd();getOrdTyp()">
                                            <option value="-1">SELECT</option>
                                            <!--option value="">ALL</option-->
                                            <option value="016">BBGS</option>
                                            <option value="019">CTM</option>
                                            <option value="013">NCGS</option>
                                            <option value="002">SGS</option>
                                            <option value="014">TGS</option>
                                        </select>
                                    </font></b>
                            </td>

                            <%    } else if (sLoginStnCd.equals("042")) {

                            %>
                            <td colspan="4">
                                <b><font face="Times New Roman" color="#FFFFFF">
                                        <select name="sOrdForStnCd" size="1" onchange="chkSOrdForStnCd();getOrdTyp()">
                                            <option value="-1">SELECT</option>
                                            <!--option value="">ALL</option-->
                                            <option value="016">BBGS</option>
                                            <option value="019">CTM</option>
                                            <option value="042">ED(G)E</option>
                                            <option value="013">NCGS</option>
                                            <option value="002">SGS</option>
                                            <option value="014">TGS</option>
                                        </select>
                                    </font></b>
                            </td>

                            <%                                    } else {

                            %>
                    <input type="hidden" name="sOrdForStnCd" value="<%=sOrdForStnCd%>"/>
                    <td colspan="4" align="center" bgcolor="#b7dafd"><font face="Tahoma" color="#000000"><b><%= sOrdForStnLongNm%></b></font></td>
                    <%
                                }

                    %>
                    </td>
                    </tr>

                    <tr>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;For&nbsp;Dept.</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>

                        <%

                                    //if (iCntDept <= 1) {

                        %>
                    <!--input type="hidden" name="sOrdForDeptCd" value="<%=sDeptCd%>"/>

                    <td width="24%" align="center" bgcolor="#b7dafd"><font face="Tahoma" color="#000000"><b><sDeptShrtNm></b></font></td-->


                        <%
                                    //} else {
%>

                        <td width="24%">
                            <select name="sOrdForDeptCd" size="1">
                                <option value="">ALL</option>
                                <%
                                            rows = null;
                                            iterateOuter = null;
                                            iterateInner = null;
                                            sDeptCd = null;
                                            String sDeptDesc = null;

                                            //System.out.println(sOrdForStnCd);
                                            //System.out.println(sOrdForDeptCd);
                                            iterateOuter = lstDept.iterator();

                                            while (iterateOuter.hasNext()) {
                                                rows = (List) iterateOuter.next();

                                                iterateInner = rows.iterator();
                                                while (iterateInner.hasNext()) {
                                                    sDeptCd = (String) iterateInner.next();
                                                    sDeptDesc = (String) iterateInner.next();

                                %>
                                <option value="<%= sDeptCd%>"><%= sDeptDesc%></option>

                                <%
                                                }
                                            }
                                %>

                            </select>
                        </td>

                        <%
                                    // }
%>

                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;No.</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="24%" align="left">
                            <input type="test" name="sOrdNo" size="21" value="" />
                        </td>

                    </tr>

                    <tr>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;Date&nbsp;From</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="24%" align="left">
                            <input name="sOrdDtFrm" size="11" value="" onclick="sel_date_cls('f1.sOrdDtFrm','js/')"/>
                        </td>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;Date&nbsp;To</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="24%" align="left">
                            <input name="sOrdDtTo" size="11" value="" onclick="sel_date_cls('f1.sOrdDtTo','js/')"/>
                        </td>

                    </tr>

                    <tr>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;Type</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="24%" align="left">
                            <select name="sOrdTyp" onchange="">
                                <option value="">ALL</option>
                                <%

                                            List lstOrdTyp = null;
                                            rows = null;
                                            iterateOuter = null;
                                            iterateInner = null;


                                            lstOrdTyp = hRemote.getOrdTyp(sOrdForStnCd);
                                            iterateOuter = lstOrdTyp.iterator();

                                            while (iterateOuter.hasNext()) {
                                                rows = (List) iterateOuter.next();

                                                iterateInner = rows.iterator();
                                                while (iterateInner.hasNext()) {

                                %>
                                <option value="<%= (String) iterateInner.next()%>"><%= (String) iterateInner.next()%></option>

                                <%
                                                }
                                            }
                                %>


                            </select>
                        </td>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Job&nbsp;Type</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="24%" align="left">
                            <b><font face="Times New Roman" color="#FFFFFF">
                                    <select name="sJobTyp" size="1" onchange="getPlant();">
                                        <option value="">ALL</option>
                                        <option value="M">Maintenance</option>
                                        <option value="O">Operational</option>
                                    </select>
                                </font></b>
                        </td>
                    </tr>

                    <tr>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Budget&nbsp;Head</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="24%" align="left">
                            <input type = "text" name="sBudgHeadDesc" size="20" value="" onclick="sel_budg();"/>
                        </td>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Party</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="24%" align="left">
                            <input type="text" name="sVndrNm" size="35" onclick="sel_cont('')"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="24%"><font face="Times New Roman" color="#80080" size="3"><b>Job&nbsp;Desc</b></font></td>
                        <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td colspan="4" align="left">
                            <input name="sJobDesc" size="60" value=""/>
                        </td>
                    <tr>
                        <td colspan="6" align="center" >
                            <input type="submit" name="sumtSearchOrder" value="Search Order" class="buttonActive" style="width : 180px" onclick="" />
                        </td>

                    </tr>
                    </tbody>
                </table>
            </div>

            <br>
            <div id="div_img" style="visibility : hidden">
                <center><img src="Pics/Order/ajax-loader10.gif" /></center>
            </div>


        </form>
    </b>
    <script>
      
        if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '3';
        window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Close';
        
        window.parent.sBackClick.value = '0';
    </script>
</body>
</html>
