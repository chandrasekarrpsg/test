
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GENERATION DIVISION</title>
<link href="style.css" rel="stylesheet" type="text/css" src="style.css"/>
<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="jquery.innerfade.js"></script>
<script type="text/javascript">
	   $(document).ready(
				function(){
					$('#news').innerfade({
						animationtype: 'slide',
						speed: 500,
						timeout: 2000,
						type: 'random',
						containerheight: '1em'
					});
					
					$('ul#portfolio').innerfade({
						speed: 1000,
						timeout: 6000,
						type: 'sequence',
						containerheight: '220px'
					});
					
					$('.fade').innerfade({
						speed: 2000,
						timeout: 4000,
						type: 'random_start',
						containerheight: '1.5em'
					});
					
					$('.adi').innerfade({
						speed: 500,
						timeout: 5000,
						type: 'random',
						containerheight: '150px'
					});

			});
  	</script>
<link href="jq_fade.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.style5 {
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        color: #000000;
}
</style>

</head>

<body>

<%

String IP = request.getRemoteAddr();

%>

<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<%
      String flag= new String();

      flag="0";

      String suser        = new String();
      String sunm         = new String();
      String sgenstn      = new String();
      String sutp         = new String();
      String spasswd      = new String();
      String sfnm         = new String();
      String slnm         = new String();
      String sdept        = new String();
      String sdesig       = new String();
      String sgenStnCd    = new String();
      String sadminmkr    = new String();
      String sgenshtdesc  = new String();
      String svndlvl      = new String();
      String sdptshtdesc  = new String();
      String sLoginEmpKaizenMkr  = new String();

      MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);

      PreparedStatement ps0  = mk.con.prepareStatement(" SELECT login_id,TRIM(UPPER(emp_fname))||' '||TRIM(UPPER(emp_lname)),UPPER(station_long_desc),emp_level,NVL(enc_dec.decrypt(login_passwd),'@'),emp_fname,emp_lname,NVL(emp_dept,' '),desg_desc,emp_genstn,NVL(login_adm_mkr,'@'),UPPER(station_sht_desc),DECODE(emp_desg,'1200','1','1250','1','1300','1','1400','1','1405','1','1451','1','1503','1','1609','1','0'),dept_sdesc,NVL(kaizen_mkr,'@') FROM ADM_LOGIN_MST,ADM_EMP_MST,CD_STATION,ADM_DESG_MST,ORBL_CD_DEPT_MST "+
                                                       " WHERE  login_vip_ip = ? "+
                                                       " AND    login_id     = emp_code "+
                                                       " AND    emp_genstn   = orbl_station_cd "+
                                                       " AND    emp_desg     = desg_code  "+
                                                       " AND    emp_genstn   = station "+
                                                       " AND    emp_dept     = dept ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );


      ps0.setString(1,IP);

      ResultSet rs0=ps0.executeQuery();

       while(rs0.next())
          {
            suser    =rs0.getString(1);
            sunm     =rs0.getString(2);
            sgenstn  =rs0.getString(3);
            sutp     =rs0.getString(4);
            spasswd  =rs0.getString(5);
            sfnm     =rs0.getString(6);
            slnm     =rs0.getString(7);
            sdept    =rs0.getString(8);
            sdesig   =rs0.getString(9);
            sgenStnCd=rs0.getString(10);
            sadminmkr=rs0.getString(11);
            sgenshtdesc  = rs0.getString(12);
            svndlvl      = rs0.getString(13);
            sdptshtdesc  = rs0.getString(14);
            sLoginEmpKaizenMkr  = rs0.getString(15);

            flag="1";
          }

      rs0.close();
      ps0.close();


      String flag100= new String();

      flag100="0";

      PreparedStatement ps1  = mk.con.prepareStatement(" SELECT NVL(login_adm_mkr,'@') FROM ADM_LOGIN_MST "+
                                                       " WHERE  login_id   = ? "+
                                                       " AND    login_adm_mkr IN ('3','4') ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps1.setString(1,suser);

      ResultSet rs1=ps1.executeQuery();

       while(rs1.next())
          {
             svndlvl      = rs1.getString(1);
             flag100="1";
          }

      rs1.close();
      ps1.close();


      if (flag100=="0")
      {

      PreparedStatement ps2  = mk.con.prepareStatement(" SELECT DISTINCT TRIM(TO_CHAR(bgt_level)) FROM BGT_LEVEL "+
                                                       " WHERE  emp_code   = ?                                   "+
                                                       " AND    sec_cd NOT IN ('CTM')                            "+
                                                       " AND    bgt_level IN ('2')                               ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps2.setString(1,suser);

      ResultSet rs2=ps2.executeQuery();

       while(rs2.next())
          {
             svndlvl      = rs2.getString(1);
             flag100="2";
          }

      rs2.close();
      ps2.close();

      }


      if (flag100=="0")
      {

      PreparedStatement ps3  = mk.con.prepareStatement(" SELECT '2' FROM ADM_EMP_MST  "+
                                                       " WHERE  emp_code   = ?        "+
                                                       " AND    emp_dept IN ('30')    "+
                                                       " AND    emp_desg IN ('1200')  ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps3.setString(1,suser);

      ResultSet rs3=ps3.executeQuery();

       while(rs3.next())
          {
             svndlvl      = rs3.getString(1);
             flag100="3";
          }

      rs3.close();
      ps3.close();

      }



      if (flag=="1")
      {

%>


<script>

var user,utp,unm,genstn,passwd;
var fnm,lnm,dept,desig,genStnCd,adminmkr;
var genshtdesc,vndlvl,dptshtdesc,sLoginEmpKaizenMkr;

user     = "<%= suser %>";
unm      =  "<%= sunm %>";
utp      = "<%= sutp %>";
genstn   = "<%= sgenstn %>";
passwd   = "<%= spasswd %>";
fnm      = "<%= sfnm %>";
lnm      = "<%= slnm %>";
dept     = "<%= sdept %>";
desig    = "<%= sdesig %>";
genStnCd = "<%= sgenStnCd %>";
adminmkr = "<%= sadminmkr %>";
genshtdesc = "<%= sgenshtdesc %>";
vndlvl     = "<%= svndlvl %>";
dptshtdesc = "<%= sdptshtdesc %>";
sLoginEmpKaizenMkr = "<%= sLoginEmpKaizenMkr %>";

window.open("menu1.jsp?usrtp="+utp+"&usrnm="+unm+"&statn="+genstn+"&empcd="+user+"&fnm="+fnm+"&lnm="+lnm+"&dept="+dept+"&desig="+desig+"&genStnCd="+genStnCd+"&adminmkr="+adminmkr+"&genshtdesc="+genshtdesc+"&vndlvl="+vndlvl+"&dptshtdesc="+dptshtdesc+"&sLoginEmpKaizenMkr="+sLoginEmpKaizenMkr,"mainWin","toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1");

window.open('close.html','_self');

</script>


<%

}

      mk.con.close();

%>


<div id="wrap">
<div id="ribbon">
<h1 id="logo"> 
<span class="black">GENERATION DIVISION </span>
<span class="desc">
</span>
</h1>
<br>

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:910px; top:10px" width="89" height="47"/>&nbsp;

<div id="intro">
  <p><strong></strong><br/>
</div>

</div>
<div id="nav">
<ul>

<li class="current"><a href="index.jsp"><span>About</span></a></li>
<li><a href="login.jsp"><span>Login</span></a></li>
<li><a href="gallery.jsp"><span>Gallery</span></a></li>
<li><a href="help.jsp"><span>Tech Details</span></a></li>
<li><a href="contact.jsp"><span>Contact Us</span></a></li>


</ul>

</div>
<div id="homeheader">
<div id="left-column">
<h2>Web-based applications</h2>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for </h2>
<h2>&nbsp;&nbsp; Generation Division</h2>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;developed on</h2>
<h2>&nbsp;&nbsp;Oracle/Java platform.</h2>
<p>
</p>
</div>
<div id="right-column">
<h2>CONTENTS</h2>
<ul id="portfolio">					
					<li><div class="imgholder">
					  <img border="0" width="172" height="155" src="k1118050.jpg"></div>
                      <div class="txtholder1">
                      <h3>The applications deal with</h3>
                      <p>
Order Processing , Billing , Budgeting and Vendor Management for Generation Division. 
                      </p>
                      </div>
        </li>
				<li>
				  <div class="imgholder">
                      <img border="0" width="172" height="155" src="k1451470.jpg"></div>
                      <div class="txtholder1">
                      <h3>The applications deal with</h3>
                      <p>
Order Processing , Billing , Budgeting and Vendor Management for Generation Division. 
                      </p>
                      </div>
        </li>			
					<li>
					  <div class="imgholder">
                      <img src="k7067130.jpg" width="172" height="155" /></div>
                      <div class="txtholder1">

                      <h3>The applications deal with</h3>
                      <p>
Order Processing , Billing , Budgeting and Vendor Management for Generation Division. 
                      </p>

                      </div>
        </li>				

					<li>
					  <div class="imgholder">
                      <img src="k4777200.jpg" width="172" height="155" /></div>
                      <div class="txtholder1">

                      <h3>The applications deal with</h3>
                      <p>
Order Processing , Billing , Budgeting and Vendor Management for Generation Division. 
                      </p>

                      </div>
        </li>				
									
	  </ul>
</div>
</div>
<br><br>
<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="logo-rpg.png">

		  <label style="POSITION: absolute; LEFT: 760px; top:561px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

		  <label style="POSITION: absolute; LEFT: 350px; top:490px"  class="style5" ><b>Screen best viewed with resolution 1024 x 768 pixels and IE 7</b></label>
                  <label style="POSITION: absolute; LEFT: 850px; top:490px"  class="style5" ><a href="Guidelines_ver2.pdf" target="_blank" ><font size="2" color="black"><u><b>IE Settings</b></u></font></a></label>


<div class="clear"></div>
</div>
</div>


</body>
</html>
