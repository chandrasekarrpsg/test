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
						timeout: 6000,
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
<li><a href="login.jsp"><span>Login</span></a></li>
<li><a href="gallery.jsp"><span>Gallery</span></a></li>
<li class="current"><a href="help.jsp"><span>Tech Details</span></a></li>
<li><a href="contact.jsp"><span>Contact Us</span></a></li>


</ul>

</div>
<div id="homeheader">
<div id="left-column">
<h2>TECHNICAL DETAILS</h2>
</div>
<div id="right-column">
<h2></h2>
<ul id="portfolio">					
					<li>
                      <div class="txtholder">
                      <h3>Hardware</h3>
                      <p> Enterprise level servers connected in fail-safe mode and located at Data Center </p>
                      <p> DC-DR setup in place </p>
                      </div>
        </li>
					<li>
                      <div class="txtholder">
                      <h3>Software</h3>
                      <p>State of the art software technology, web-based three tier architecture</p>
                      <p>Browser - Internet Explorer</p>
                      <p>Application Server - Glassfish2</p>
                      <p>Database - Oracle 10g</p>
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

<div class="clear"></div>
</div>
</div>

</body>
</html>
