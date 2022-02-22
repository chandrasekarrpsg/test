
<html>
<head>




<title>BBGS Budget Heads Menu</title>

</script>

 


<script language="Javascript">
function populate(x){
f1.budg_ac.value=x
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
#menu li a { display: block; padding: 5px 20px; text-decoration: none; color: #000000 ; font : 10pt}

#menu ul { background: #fff; display: none; position: absolute }
#menu ul li { background: #ffffff; border-top: 1px solid #bdd2ff; border-right: 0px solid transparent; float: none }

#menu ul ul { top: -1px; left: 100% }

#menu li.has_child { background-image: url('down_multi_lvl_menu.gif'); background-position: right center; background-repeat: no-repeat; padding-right: 10px }
#menu li.hover  { background-color: #deffdd }

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


<body onload = '' background="Pics/Order/lblue047.gif">


<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>




<!--#include file="budget.inc"-->

<%
  MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;

    try {
		PreparedStatement ps = null ;
		PreparedStatement ps2 = null ;
		PreparedStatement ps3 = null ;
		PreparedStatement ps4 = null ;
		PreparedStatement ps5 = null ;
		PreparedStatement ps6 = null ;
		ResultSet rs = null ;
		ResultSet rs2 = null ;
		ResultSet rs3 = null ;
		ResultSet rs4 = null ;
		ResultSet rs5 = null ;
		ResultSet rs6 = null ;

String itmQry = " select distinct oh.MAIN_MENU , oh.GROUP_NO  from ORBL_HEADS oh where LOV_FOR like '%S%'  order by oh.GROUP_NO ";

String itmBdgtQry = " select  oh.BUDGET_HEAD||'|'||oh.SEQ_NO  from ORBL_HEADS oh where  oh.MAIN_MENU = ? and LOV_FOR like '%S%'   ";

String rowQry = " select distinct oh.SERC_HEAD , oh.SEQ_NO  from ORBL_HEADS oh where oh.MAIN_MENU = ? and oh.SERC_HEAD is not null and LOV_FOR like '%S%'  order by oh.SEQ_NO ";

String rowBdgtQry = " select  oh.BUDGET_HEAD||'|'||oh.SEQ_NO  from ORBL_HEADS oh where  oh.MAIN_MENU = ?  and LOV_FOR like '%S%'   ";

String colQry = " select distinct oh.SUB_MENU , oh.SUB_ACCOUNT  from ORBL_HEADS oh  where oh.MAIN_MENU = ?  and  oh.SUB_MENU  is not null and  LOV_FOR like '%S%'  order by oh.SUB_ACCOUNT ";
String colBdgtQry = " select  oh.BUDGET_HEAD||'|'||oh.SEQ_NO  from ORBL_HEADS oh where  oh.MAIN_MENU = ? and  oh.SUB_MENU = ?  and LOV_FOR like '%S%'  ";


ps = mk.con.prepareStatement(itmQry);
rs = ps.executeQuery();


		%>

<ul id="menu" class="clear">	
	<li><a href="#">SELECT BUGET HEADS</a>
		<ul>

<%
boolean rowExist = false;
boolean colExist = false;
int rowCount = 0;
int colCount = 0;

while(rs.next()){
			     ps3 = null;
	             rs3 = null;
				ps3 = mk.con.prepareStatement(colQry);
				ps3.setString(1,rs.getString(1));
				rs3 = ps3.executeQuery();
				colExist = false;
				colCount = 0;
					while(rs3.next()){
						colExist = true ;
						colCount = colCount+1;
						if(colCount == 1){
						%>
						<li><a href="#"><%= rs.getString(1) %></a></li>
						<ul>
						<%
						}
							ps6 = null;
							rs6 = null;
							ps6 = mk.con.prepareStatement(colBdgtQry);
							ps6.setString(1,rs.getString(1));
							ps6.setString(2,rs3.getString(1));
							rs6 = ps6.executeQuery();
							if(rs6.next()){
							%>
								<li><a href="#" onclick="populate('<%= rs6.getString(1) %>');" ><%= rs3.getString(1) %></a></li>
							<%
							}
							rs6.close();
							ps6.close();

						}
						rs3.close();
						ps3.close();
					if(colCount >= 1){					 
					   %>
					   </ul>
					   <%
					}
				if(!colExist){
					ps5 = null;
					rs5 = null;
					ps5 = mk.con.prepareStatement(rowBdgtQry);
					ps5.setString(1,rs.getString(1));
					rs5 = ps5.executeQuery();
					if(rs5.next()){
					%>
						<li><a href="#" onclick="populate('<%= rs5.getString(1) %>');" ><%= rs.getString(1) %></a></li>
					<%
					}
					rs5.close();
					ps5.close();

				}

				}
				rs.close();
				ps.close();
			%>

			

</ul>





<form name="f1">
  <input type="hidden" name="budg_ac" value=""><table border="0" cellspacing="0"
  cellpadding="0">
    <tr>
      <td></td>
      <td></td>
    </tr>
  </table>
</form>

<%

 }
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
%>


</body>
</html>

