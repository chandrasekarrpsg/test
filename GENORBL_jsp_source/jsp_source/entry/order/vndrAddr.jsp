<%@page import="java.math.BigDecimal"%>
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
            System.out.println("vndrAddr.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>
<html>
    <head>




        <title>Vendor Selection Menu</title>



        <script language="Javascript">

            function getVndrConf(x){
            var val = x.split("~"); 

            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=ordUpdConf" ;
            parameter += "&sVndrCd="+val[0] ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            //alert(url);
            var ordUpdConfXML ;
            try{
                ordUpdConfXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    ordUpdConfXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    ordUpdConfXML = new XMLHttpRequest();
                }
            }
            ordUpdConfXML.open('POST',url,true);
            ordUpdConfXML.send('');
            ordUpdConfXML.onreadystatechange = function(){
                if(ordUpdConfXML.readyState == 4){
                    //alert(ordUpdConfXML.responseText);
                    myval = ordUpdConfXML.responseXML.getElementsByTagName("CONF");

                    var cell = myval[0].childNodes[0].nodeValue;
                    
                    if(cell == 'Y'){
                        populate(x);
                    }else{
                        flag = confirm('First time order for this vendor in the Present System.Please check Vendor Name & Address');

                        if(flag == true){
                            populate(x);
                        }
                    }
                    
                }
            }
        }


            function populate(x){
                //f1.budg_ac.value=x
                window.returnValue=x;
                window.close();

                //budget_div.style.display="none"
                //tab1.style.position="absolute"
                //tab1.style.top=25
                //tab1.style.left=80
                //over_div.style.display=""
            }

        </script>

        <script type="text/javascript" src="js/jquery-1.4.4_genorbl.js"></script>
        

        <style type="text/css">
            .clear { height: 100% }
            .clear:after { content: ''; display: block; clear: both }

            #menu, #menu ul { list-style: none; margin: 0; padding: 0 }

            #menu li { background: #bdd2ff; border-right: 1px solid #fff; position: relative; float: left; white-space: nowrap }
            #menu li a { display: block; padding: 5px 20px; text-decoration: none; color: #13a }

            #menu ul { background: #fff; display: none; position: absolute }
            #menu ul li { background: #aabde6; border-top: 1px solid #bdd2ff; border-right: 0px solid transparent; float: none }

            #menu ul ul { top: -1px; left: 100% }

            #menu li.has_child { background-image: url('down_multi_lvl_menu.gif'); background-position: right center; background-repeat: no-repeat; padding-right: 10px }
            #menu li.hover  { background-color: #cfdeff }

            #menu ul { -webkit-box-shadow: 3px 3px 4px #999; -moz-box-shadow: 3px 3px 4px #999; box-shadow: 3px 3px 4px #999 }
        </style>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#menu').menu();
            });

            var ie = $.browser.msie && $.browser.version < 8.0;
 
            $.fn.menu = function() {
                $(this).find('li').each(function() {
                    if ($(this).find('> ul').size() > 0) {
                        $(this).addClass('has_child');
                    }
                });

                var closeTimer = null;
                var menuItem = null;
	
                function cancelTimer() {
                    if (closeTimer) {
                        window.clearTimeout(closeTimer);
                        closeTimer = null;
                    }
                }
	
                function close() {
                    $(menuItem).find('> ul ul').hide();
                    ie ? $(menuItem).find('> ul').fadeOut() : $(menuItem).find('> ul').slideUp(250);
                    menuItem = null;
                }
	
                $(this).find('li').hover(function() {
                    cancelTimer();
		
                    var parent = false;
                    $(this).parents('li').each(function() {
                        if (this == menuItem) parent = true;
                    });
                    if (menuItem != this && !parent) close();
		
                    $(this).addClass('hover');
                    ie ? $(this).find('> ul').fadeIn() : $(this).find('> ul').slideDown(250);
                }, function() {
                    $(this).removeClass('hover');
                    menuItem = this;
                    cancelTimer();
                    closeTimer = window.setTimeout(close, 500);
                });
	
                if (ie) {
                    $(this).find('ul a').css('display', 'inline-block');
                    $(this).find('ul ul').css('top', '0');
                }
            }
        </script>

        <style>
            body{
                font-size:10px;
                font-weight:bold;
            }
        </style>



    </head>


    <body bgcolor="ghostwhite" onload = '' >


        <%@ page import="java.sql.*,javax.servlet.jsp.*" %>
        <%@ page import="java.util.*" %>
        <%@ page import="genOrblJavaPackage.*" %>




        <!--#include file="budget.inc"-->

        <ul id="menu" class="clear">
            <li><a href="#">SELECT VENDOR</a>
                <ul>

                <%

                            try {
                                List rows = null;
                                Iterator iterateOuter = null;
                                Iterator iterateInner = null;
                                List lstVndrDtls = hRemote.getVndrDtls_2("");
                                iterateOuter = lstVndrDtls.iterator();
                                String sVndrCd = new String();
                                String sVndrNm = new String();
                                String sVndrAddr_1 = new String();
                                String sVndrAddr_2 = new String();
                                String sVndrAddr_3 = new String();
                                String sVndrAddr_4 = new String();
                                String sVndrAddr_5 = new String();
                                String sWageLiab = new String();
                                int iIndx = 0;
                                while (iterateOuter.hasNext()) {
                                    rows = (List) iterateOuter.next();

                                    iterateInner = rows.iterator();
                                    while (iterateInner.hasNext()) {
                                        iIndx = iIndx + 1;
                                        sVndrCd = "" + ((BigDecimal) iterateInner.next()).intValue();
                                        sVndrNm = (String) iterateInner.next();
                                        sVndrAddr_1 = (String) iterateInner.next();
                                        sVndrAddr_2 = (String) iterateInner.next();
                                        sVndrAddr_3 = (String) iterateInner.next();
                                        sVndrAddr_4 = (String) iterateInner.next();
                                        sVndrAddr_5 = (String) iterateInner.next();
                                        sWageLiab = (String) iterateInner.next();


                %>
                
                    <li onclick="getVndrConf('<%= sVndrCd %>~<%= sVndrNm %>~<%= sWageLiab %>')"><a href="#"><%= sVndrNm.replace("\\'","'")%></a>
                        <ul>

                            <li><%= sVndrAddr_1%></li>
                            <li><%= sVndrAddr_2%></li>
                            <li><%= sVndrAddr_3%></li>
                            <li><%= sVndrAddr_4%></li>
                            <li><%= sVndrAddr_5%></li>
                        </ul>
                    </li>

                



                <%
                                                    }
                                                }
                %>
                </ul>
            </li>
        </ul>

        <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                    }
        %>



    </body>
</html>

