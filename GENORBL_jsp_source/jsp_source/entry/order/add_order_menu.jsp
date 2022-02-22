<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Menu</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript" src="slideshowfade.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#Slideshow1 img {position:absolute; left:15px;top:24px; width:150px;}
.style3 {
	font-size: 50px;
}
.style4 {
	text-align: center;
	padding-right: 5px;
	padding-top: 10px;
	font-weight: bold;
	font-size: 12px;
}

</style>
<script type="text/javascript">
  var headArr = new Array();
  var descArr = new Array();
  var desc1Arr = new Array();
  var urlArr = new Array();


function shoheading(n)
 {
   //document.getElementById("hd1").innerHTML=headArr[n];
   //document.getElementById("abouthd").innerHTML=descArr[n];
   //document.getElementById("desc1").innerHTML=desc1Arr[n];
   window.open(urlArr[n],'I1');

 }


</script>
</head>

<body onload="">
    <script type="text/javascript">

      var imgArray = new Array();
      imgArray[0] = "k1118050.jpg";
      imgArray[1] = "k1451470.jpg";
      imgArray[2] = "k4777200.jpg";
      imgArray[3] = "k7067130.jpg";


      slideshowFade('Slideshow1','',imgArray,20,5000);
    
    </script>


<div id="main">
<!-- header begins -->
<div id="header" style="height: 175px">
	<div id="logo" style="height: 106px">
    <h2 style="height: 97px" class="style3">GENERATING STATION SYSTEMS</h2>
    </div>  
 </div>
<!-- header ends -->
        <!-- content begins -->
       			<!--div id="content">
                    <div id="right" style="height: 441px">
                      <h1 id="hd1"></h1>
                         <div class="text">
                          <div class="style4" style="height: 346px"-->
							<!--iframe name="I1" id="I1" src="add_order.jsp" style="height: 250px; width: 500px; float: top;" border="0" frameborder="0">
							</iframe-->
                                                        <%@include  file="add_order.jsp" %>
                          <!--/div>
                        </div>
						
                    </div-->
    <!-- content ends --> 
<!-- footer begins -->
            <!--div id="footer">
		  2012 © Developed by I.T. Department</div-->
        
        <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>
<!--/div-->



</body>
</html>
