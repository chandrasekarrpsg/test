<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GENERATION DIVISION</title>

<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="jquery.innerfade.js"></script>
<script type="text/javascript">
	   $(document).ready(
				function(){
					$('#news').innerfade({
						animationtype: 'slide',
						speed: 750,
						timeout: 2000,
						type: 'random',
						containerheight: '1em'
					});
					
					$('ul#portfolio').innerfade({
						speed: 1000,
						timeout: 5000,
						type: 'sequence',
						containerheight: '220px'
					});
					
					$('.fade').innerfade({
						speed: 1000,
						timeout: 6000,
						type: 'random_start',
						containerheight: '1.5em'
					});
					
					$('.adi').innerfade({
						speed: 'slow',
						timeout: 5000,
						type: 'random',
						containerheight: '150px'
					});

			});
  	</script>

        <link href="stylesnew.css" rel="stylesheet" type="text/css" media="screen" />

		<script type="text/javascript">


       function noenter(obj){
        return !(window.event && window.event.keyCode == 13);
        }

        function isNull(str){
          if(str=='')
            return false;
          return true;
        }


		function chnginput()
		{
		  if(document.getElementById("pwtext").innerHTML=='Change Password')
		   {
		    document.getElementById("chngpw").style.visibility='visible';
		    document.getElementById("lginpad").style.visibility='hidden';
		    document.getElementById("pwtext").innerHTML='Cancel Change Password';
		   }
		  else
		   {
		    document.getElementById("lginpad").style.visibility='visible';
		    document.getElementById("chngpw").style.visibility='hidden';
		    document.getElementById("pwtext").innerHTML='Change Password';
		   }
		  
		}
		
	function shologin()
	 {
	  document.getElementById("lginpad").style.visibility='visible';
	  document.getElementById("contctpad").style.visibility='visible';
          document.getElementById("exitpad").style.visibility='visible';
          document.getElementById("chngpw").style.visibility='hidden';
          document.getElementById("pwtext").innerHTML='Change Password';
          form1.lg1Text1.focus();
	 }
	 
	 function shoabout()
	 {
	  document.getElementById("lginpad").style.visibility='hidden';
	  document.getElementById("contctpad").style.visibility='hidden';
          document.getElementById("exitpad").style.visibility='hidden';
          document.getElementById("chngpw").style.visibility='hidden';
	  document.getElementById("pwtext").innerHTML='Change Password';
       

	 }
	 
	 function shocontact()
	 {
	  document.getElementById("lginpad").style.visibility='hidden';
	  document.getElementById("contctpad").style.visibility='hidden';
          document.getElementById("exitpad").style.visibility='hidden';
	  document.getElementById("chngpw").style.visibility='hidden';
	  document.getElementById("pwtext").innerHTML='Change Password';

	 }
		</script>
		<script type="text/javascript"><!--
document.onselectstart = new Function("return false");

object = new Array();
function zOOm(){
	with (this) {
		k += .1;
		for(i=0;i<obj.length;i++){
			t = mini + maxi + Math.cos(k + i / amp) * maxi;
			with(obj[i].style){
				zIndex = Math.round(t*10);
				top = Math.round(-t/chu);
				fontSize = Math.round(t);
				c = t*200/(2*maxi+mini);
				if(inv)c = 255-c;
				color = "RGB("+Math.round(c*cR)+","+Math.round(c*cG)+","+Math.round(c*cB)+")";
			}
		}
		setTimeout(sto,16);
	}
}

function CObj(N,obj,txt,amp,mini,maxi,cR,cG,cB,inv,chu){
	this.N = N;
	for(i=0;i<txt.length;i++){
		c = txt.charAt(i);
		o = document.createElement("span");
		o.onmousedown = new Function("return false");
		o.style.left = Math.round(mini * i * 0.8);
		b = document.createElement("div");
		b.innerHTML = c;
		b.style.position = "absolute";
		b.style.left = -150;
		b.style.width = 100;
		o.appendChild(b);
		obj.appendChild(o);
	}
	this.obj  = obj.getElementsByTagName("span");
	this.k    = 0;
	this.cR   = cR;
	this.cG   = cG;
	this.cB   = cB;
	this.inv  = inv;
	this.amp  = amp;
	this.mini = mini;
	this.maxi = maxi;
	this.chu  = chu;
	this.sto  = "object["+N+"].zOOm();";
	this.zOOm = zOOm;
	setTimeout(this.sto,32);
}


onload = function() {
	object[0] = new CObj(0,document.getElementById("T1"),"GENERATION", 1.2,55,9,0,3,3,1,0.4);
	object[1] =       new CObj(1,document.getElementById("T2"),"      DIVISION",1.2,55,9,0,3,3,2,0.8);

}
//-->


var url = "get_emp_sts.jsp";
var http = getHTTPObject();
function getHTTPObject() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}

//function getAccess(user,menu,minor,OPN)

function go_to_next_page()
{

  if(!isNull(form1.lg1Text1.value)){
    alert('Please Input Your User Id .......');
    form1.lg1Text1.value='';
    form1.lg1Text1.focus();
    return false;
  }

  if(!isNull(form1.lg1Password1.value)){
    alert('Please Input Your Password.......');
    form1.lg1Password1.value='';
    form1.lg1Password1.focus();
    return false;
  }

  if(form1.lg1Password1.value=="cesc123"){
    alert('Please Change Your Default Password (cesc123) First .......');
    form1.lg1Password1.value='';
    form1.lg1Password1.focus();
    return false;
  }

//var user=document.getElementById("lg1Text1").value;
var user=form1.lg1Text1.value;
//var pwd=document.getElementById("lg1Password1").value;
var pwd=form1.lg1Password1.value;
var utp,unm,genstn,passwd;
var fnm,lnm,dept,desig,genStnCd,adminmkr;

var params = "userid="+user+"&pswd="+pwd;
http.open("POST", url, true);
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.onreadystatechange = function()
   {
        if(http.readyState == 4 && http.status == 200)
        {
             results = http.responseText.split("~");
             unm = results[0];
             genstn = results[1];
             utp = results[2];
             passwd = results[3];
             fnm = results[4];
             lnm = results[5];
             dept = results[6];
             desig = results[7];
             genStnCd = results[8];
             adminmkr = results[9];
             sgenshtdesc = results[10];
             svndlvl = results[11];
             sdptshtdesc = results[12];
             sLoginEmpKaizenMkr = results[13];


             if(utp != "0" && utp != "1" && utp != "2" && utp != "3" && utp != "4" && utp != "5" && utp != "6")
              {
                 alert('INVALID USER')
                 form1.lg1Text1.value='';
                 form1.lg1Password1.value='';
                 form1.lg1Text1.focus();
                 return false;
              }


             if(passwd != pwd)
              {

                 alert('WRONG PASSWORD')
                 form1.lg1Password1.value='';
                 form1.lg1Password1.focus();
                 return false;
              }


              form1.lg1Text1.value='';
              form1.lg1Password1.value='';
           

              window.open("menu1.jsp?usrtp="+utp+"&usrnm="+unm+"&statn="+genstn+"&empcd="+user+"&fnm="+fnm+"&lnm="+lnm+"&dept="+dept+"&desig="+desig+"&genStnCd="+genStnCd+"&adminmkr="+adminmkr+"&sgenshtdesc="+sgenshtdesc+"&sdptshtdesc="+sdptshtdesc+"&svndlvl="+svndlvl+"&sLoginEmpKaizenMkr="+sLoginEmpKaizenMkr,"mainWin","toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1");

              window.open('close.html','_self');


        }
  }
http.send(params);   

}



var url1 = "passwd_upd.jsp";

var http1 = getHTTPObject1();
function getHTTPObject1() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}

function showMsg(prs) {
             if(prs != "@")
               {
                 alert('Password updated successfully')
                 window.open('login.jsp','_self');
               }
             else
               {
                 alert('Wrong User Id and Old Password combination')
                 form2.ChgUserName.value='';
                 form2.Password1.value='';
                 form2.Password2.value='';
                 form2.Password3.value='';
                 form2.ChgUserName.focus();
                 return false;
               }
}

function go_to_next_page1()
{

  if(!isNull(form2.ChgUserName.value)){
    alert('Please Input User Id  .......');
    form2.ChgUserName.value='';
    form2.ChgUserName.focus();
    return false;
  }


  if(!isNull(form2.Password1.value)){
    alert('Please Input Old Password.......');
    form2.Password1.value='';
    form2.Password1.focus();
    return false;
  }

  if(!isNull(form2.Password2.value)){
    alert('Please Input New Password.......');
    form2.Password2.value='';
    form2.Password2.focus();
    return false;
  }

  if(!isNull(form2.Password3.value)){
    alert('Please Confirm New Password.......');
    form2.Password3.value='';
    form2.Password3.focus();
    return false;
  }

if(form2.Password2.value != form2.Password3.value)
  {
    alert('New Passwords are different.......');
    form2.Password2.value='';
    form2.Password3.value='';
    form2.Password2.focus();
    return false;
  }


var chgusr=form2.ChgUserName.value;
var pwd1=form2.Password1.value;
var pwd2=form2.Password2.value;
var pwd3=form2.Password3.value;

var params1 = "chgusr="+chgusr+"&pwd1="+pwd1+"&pwd2="+pwd2+"&pwd3="+pwd3;
var prs1;

http1.open("POST", url1, true);
http1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http1.onreadystatechange = function()
   {
        if(http1.readyState == 4 && http1.status == 200)
        {


             results = http1.responseText.split("~");
             prs1 = results[0];

             showMsg(prs1);


        }
  }

http1.send(params1);   


}



</script>


<style type="text/css">
.style5 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: small;
	color: #000000;
}
.style6 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 40px;
	font-weight: bold;
	color: #FFFFFF;
}
.shohand {
    cursor: hand;
         }
.style7 {
	border: 0 solid #FFFFFF;
	background-color: #FFFFFF;
	text-align: center;
}
.style8 {
	text-align: center;
}
.style9 {
	border-collapse: collapse;
	border-color: #FFFFFF;
}
.newStyle1 {
	padding: 0px;
	margin: 0px;
	border: 0px none #FFFFFF;
	background-image: url('header3.jpg');
}
.style10 {
	font-family: Arial, Helvetica, sans-serif;
//	font-size: small;
	font-size: 18px;
	font-weight: bold;
	color: #FFFFFF;
}
.style11 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: small;
	font-weight: bold;
	//color: #FFFFFF;
	color: #FF0000;
	text-align: left;
}
</style>


<link href="jq_fade.css" rel="stylesheet" type="text/css" />
</head>

<body onload ="jascript:shologin()">
<div id="wrap">
<div id="ribbon">
<h1 id="logo"> 
<span class="black">GENERATION DIVISION </span>
</h1>
<br><br><br>
<img alt="" src="logo-cesc-new.png" style="position:absolute; left:910px; top:10px" width="89" height="47"/>&nbsp;
<div id="intro">
</div>

</div>
<div id="nav">
<ul>


<li><a href="index.jsp"><span>About</span></a></li>
<li class="current"><a href="login.jsp"><span>Login</span></a></li>
<li><a href="gallery.jsp"><span>Gallery</span></a></li>
<li><a href="help.jsp"><span>Tech Details</span></a></li>
<li><a href="contact.jsp"><span>Contact Us</span></a></li>



</ul>

</div>
<div id="homeheader">
<div id="left-column">
<h2></h2>
<p>
User Id is your employee code (6 chars) 
</p>
<p>
Password is your personal password 
</p>
<p>
&nbsp;
</p>
<p>
</p>
<p>
</div>



			<div id="lgin" style="height: 202px; position:absolute; z-index: 2; left:480px; top:370px; width: 422px;visibility:hidden">
				<div class="pad" id="lginpad" style="">
				<form name="form1" method="post">
					<ul class="list2 pad_bot1">
						<li style="width: 212px" class="style10">User Id  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="lg1Text1" type="text" style="width: 100px" size="10"  onkeypress="if(window.event.keyCode==13){ form1.lg1Password1.focus(); } return noenter();" /> 
						</li>
						<li style="width: 212px" class="style10">Password&nbsp;&nbsp;&nbsp;
							<input name="lg1Password1" type="password" style="width: 100px" size="20" onkeypress="if(window.event.keyCode==13){ form1.Submit1.focus(); } return noenter();" /> 
						</li>
						<li><a href="#"></a>
						
							<input name="Submit1" type="button" value="Submit" onclick="go_to_next_page();"/>&nbsp;&nbsp;
							<input name="Reset1" type="reset" value="Reset" onclick="form1.lg1Text1.focus();"/>
						</li>
					</ul>
				</form>
				</div>
			</div>


            <div id="chngpw" style="height: 202px; position:absolute; z-index: 2; left:480px; top:300px; visibility:hidden">
				<div class="pad">
				<form name="form2" method="post">
					<ul class="list2 pad_bot1">
					
						<li style="width: 262px" class="style10">User Id  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="ChgUserName" type="text" style="width: 100px" size="20" onkeypress="if(window.event.keyCode==13){ form2.Password1.focus(); } return noenter();" /> 
						</li>
						<li style="width: 262px" class="style10">Old P/W&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="Password1" type="password" style="width: 100px" size="20" onkeypress="if(window.event.keyCode==13){ form2.Password2.focus(); } return noenter();" /> 
						</li>
						<li style="width: 262px" class="style10">New P/W&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="Password2" type="password" style="width: 100px" size="20" onkeypress="if(window.event.keyCode==13){ form2.Password3.focus(); } return noenter();" /> 
						</li>
						<li style="width: 262px" class="style10">Cnfirm New P/W&nbsp;
							<input name="Password3" type="password" style="width: 100px" size="20" onkeypress="if(window.event.keyCode==13){ form2.Submit1.focus(); } return noenter();" /> 
						</li>
                       
						<li><a href="#" ></a>
							<input name="Submit1" type="button" value="Submit" onclick="go_to_next_page1();"/>&nbsp;&nbsp;
							<input name="Reset1" type="reset" value="Reset" onclick="form2.ChgUserName.focus();" />
						</li>
					</ul>
				</form>
				</div>
			</div>
			<div class="pad"  id="contctpad" style="position:absolute; left:710px; top:430px; visibility:hidden">
					<p class="pad_bot2"><a id="pwtext"  style="font-family: Arial, Helvetica, sans-serif;font-size: 18px;font-weight: bold;color: #FFFFFF;" href="#"  onclick="jascript:chnginput()">
					Change Password</a></p>
			</div>
			<div class="pad"  id="exitpad" style="position:absolute; left:710px; top:460px; visibility:hidden">
					<p><a style="font-family: Arial, Helvetica, sans-serif;font-size: 18px;font-weight: bold;color: #FFFFFF;" href="#" onclick="window.open('close.html','_self');">Exit</a></p>
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
