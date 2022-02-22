<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Menu</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <script type="text/javascript" src="slideshowfade.js"></script>

        <link href="styles.css" rel="stylesheet" type="text/css" />
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <style type="text/css">
            #Slideshow1 img {position:absolute; left:15px;top:20px; width:150px;}
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
        <%
                    String sLoginStnCd = request.getParameter("sLoginStnCd");
                    String sLoginStnShrtNm = request.getParameter("sLoginStnShrtNm");
                    String sLoginStnLongNm = request.getParameter("sLoginStnLongNm");
                    String sLoginDeptCd = request.getParameter("sLoginDeptCd");
                    String sLoginDeptShrtNm = request.getParameter("sLoginDeptShrtNm");
                    String sLoginDeptLongNm = request.getParameter("sLoginDeptLongNm");
                    String sLoginEmpCd = request.getParameter("sLoginEmpCd");
                    String sLoginEmpNm = request.getParameter("sLoginEmpNm");

        %>
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
                <div id="logo" style="height: 115px">
                    <h2 style="height: 115px" class="style3">GENERATION DIVISION</h2>                    
                </div>

            </div>
            <h4 style="height: 200px" style="position:absolute; left:200px; top:90px"><i><%= sLoginStnShrtNm %>/<%= sLoginDeptShrtNm %>/<%= sLoginEmpNm %>(<%=sLoginEmpCd %>)</i></h4>
            <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>
        </div>

    </body>
</html>
