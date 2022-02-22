<%-- 
    Document   : blank_image
    Created on : Jan 17, 2013, 4:32:11 PM
    Author     : Amalesh_gole
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <script src="js/jquery-latest.js"></script>
     <script src="js/jquery.bpopup-0.7.0.min.js" type="text/javascript"></script>
     <script src="js/jquery.corner.js" type="text/javascript"></script>
     <script type="text/javascript" src="js/jQueryRotate.js"></script>


        <title>JSP Page</title>
    </head>
    <body>
<br/>
 <a href="#" >  <img src="clockimg2.jpg" width="20" height="20"  class="rotation" action_tp="plus"  /></a>
 <a href="#" >  <img src="anticlockimg3.jpg" width="20" height="20"  class="rotation" action_tp="minus"   /></a>
<br/>


        <p><img id="largeImg1" src="<%= request.getParameter("scan_img_src") %>" width="600" height="600" /></p>


<script>
$(window).bind('load', function() {
  newangle =0;  

  $('.rotation').each(function() { $(this).bind('click',function(e) {
    //alert($(this).attr('action_tp'));
    if ($(this).attr('action_tp') == 'minus')
        operation = "-";
    else
        operation = "+";

    //alert(operation)
    var angle = next(operation);
   // alert(" angle "+angle);
                e.preventDefault();
    $("#largeImg1").rotate(angle);
});
});
});



             



 

   
function next(oper) {
   if (oper == "+")
      newangle += 90;
    else
      newangle -= 90;
    
   if (newangle >= 360) newangle = 0;
    
    return newangle;
 
}
 
            


</script>



    </body>
</html>

