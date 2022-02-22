  function prescript(){
           document.getElementById("s1").focus();
  }

  function prescript_exp(){
           document.getElementById("st_dt").focus();
  }

  function DefaultValue(){

         var GS1 = f1.document.getElementById('h6').value;
         //alert(GS1);

         if(GS1 == "002" || GS1 == "013" || GS1 == "014" || GS1 == "016"){
              f1.document.getElementById('h4').value=GS1;

         }else{
              f1.document.getElementById('h4').value=document.getElementById('s2').value;
         }

          f1.document.getElementById('h1').value=document.getElementById('st_dt').value;
          f1.document.getElementById('h2').value=document.getElementById('end_dt').value;
          f1.document.getElementById('h3').value=document.getElementById('s1').value;
          f1.document.getElementById('h5').value=document.getElementById('s3').value;

         document.getElementById("f1").submit();

  }
   
  function DfltVal_Bl_Pndng(){

         var GS1 = f1.document.getElementById('h5').value;

         if(GS1 == "002" || GS1 == "013" || GS1 == "014" || GS1 == "016"){
              f1.document.getElementById('h4').value=GS1;

         }else{
              f1.document.getElementById('h4').value=document.getElementById('s2').value;
         }

         f1.document.getElementById('h1').value=document.getElementById('st_dt').value;
         f1.document.getElementById('h2').value=document.getElementById('end_dt').value;
         f1.document.getElementById('h3').value=document.getElementById('s1').value;
         f1.document.getElementById('h6').value=document.getElementById('s3').value;
         f1.document.getElementById('h7').value=document.getElementById('s4').value;

         document.getElementById("f1").submit();
  }

  function DfltVal_Bl_Nt_Rcvd(){

         var GS1 = f1.document.getElementById('h5').value;
         //alert(GS1);

         if(GS1 == "002" || GS1 == "013" || GS1 == "014" || GS1 == "016"){
              f1.document.getElementById('h4').value=GS1;

         }else{
              f1.document.getElementById('h4').value=document.getElementById('s2').value;
         }

          f1.document.getElementById('h1').value=document.getElementById('st_dt').value;
          f1.document.getElementById('h2').value=document.getElementById('end_dt').value;
          f1.document.getElementById('h3').value=document.getElementById('s1').value;

         document.getElementById("f1").submit();

  }

  function DfltVal_Delay_Index(){

         var GS1 = f1.document.getElementById('h5').value;
         //alert(GS1);

         if(GS1 == "002" || GS1 == "013" || GS1 == "014" || GS1 == "016"){
              f1.document.getElementById('h4').value=GS1;

         }else{
              f1.document.getElementById('h4').value=document.getElementById('s2').value;
         }

          f1.document.getElementById('h1').value=document.getElementById('st_dt').value;
          f1.document.getElementById('h2').value=document.getElementById('end_dt').value;
          f1.document.getElementById('h3').value=document.getElementById('s1').value;

         document.getElementById("f1").submit();

  }


  function DefaultVal_Mjr_Jobs(){

          // alert("IN DefaultVal_Mjr_Jobs FUNCTION");

           var st_dt  = document.getElementById('st_dt').value;
           var end_dt = document.getElementById('end_dt').value;
           var s1     = document.getElementById('s1').value;
           var s3     = document.getElementById('s3').value;
           var o_amt  = document.getElementById('o_amt').value;
           var GS1;
           var flag = 0;

           if (f1.document.getElementById('h6').value == "002" ||
               f1.document.getElementById('h6').value == "013" ||
               f1.document.getElementById('h6').value == "014" ||
               f1.document.getElementById('h6').value == "016" ){
               GS1 = f1.document.getElementById('h6').value;
           }else{
               GS1 = document.getElementById('s2').value;
           }

           //alert(st_dt + ": " +end_dt + ": " + s1 + ": "+ s3 + " :"+ o_amt+" : "+GS1);

           if(chkFloat(o_amt)){
              flag=1;
             // alert("FLAG :" +flag);
           }else{
              flag=0;
              //alert("FLAG :" +flag);
           }

           if(flag == 1){

              f1.document.getElementById('h1').value= st_dt;
              f1.document.getElementById('h2').value= end_dt;
              f1.document.getElementById('h3').value= s1;
              f1.document.getElementById('h4').value= GS1;
              f1.document.getElementById('h5').value= s3;
              f1.document.getElementById('h7').value= o_amt;
              
              //alert("ST DT :" +f1.document.getElementById('h1').value);
              //alert("END DT :" +f1.document.getElementById('h2').value);
              //alert("GEN STN :" +f1.document.getElementById('h4').value);
              //alert("DEPT :" +f1.document.getElementById('h3').value);
              //alert("BASIS :" +f1.document.getElementById('h5').value);
              //alert("ORD AMT :" +f1.document.getElementById('h7').value);

              document.getElementById("f1").submit();

           }else{

              document.getElementById('o_amt').value  = '';
              document.getElementById('o_amt').focus();
              document.getElementById('st_dt').value  = st_dt;
              document.getElementById('end_dt').value = end_dt;
              document.getElementById('s1').value     = s1;
              document.getElementById('s2').value     = GS1;
              document.getElementById('s3').value     = s3;

           }
  }

 function DefaultValue_Exp(){
          document.getElementById('h1').value = document.getElementById('st_dt').value;
          document.getElementById('h2').value = document.getElementById('end_dt').value;
          document.getElementById('h4').value = document.getElementById('s1').value;
          document.getElementById("f1").submit();
 }

 function func_to_xls(){

         document.getElementById("f2").submit();
 }


 function isNDigit(str){
        //alert("In function isNDigit - str :"+ str);
        var obj  = str;
        //alert("In function isNDigit - obj :"+ obj);
        var flag = 0;
        for(i = 0; i < obj.length; i++){
               // alert("In function isNDigit - obj.charAt(i) :"+ obj.charAt(i));
                if(obj.charAt(i) == '0' || obj.charAt(i) == '1' || obj.charAt(i) == '2' || obj.charAt(i) == '3'
                || obj.charAt(i) == '4' || obj.charAt(i) == '5' || obj.charAt(i) == '6' || obj.charAt(i) == '7'
                || obj.charAt(i) == '8' || obj.charAt(i) == '9'){
                        flag = 1;
                }else{
                        flag = 0;
                        break;
                }
                //alert("In function isNDigit -  flag:"+ flag +" at "+i);
        }
        if(flag == 1)
           return true;
        else 
           return false;
 }


function chkFloat(floatNo){

// This function returns true if a number is 5 digit with 2 digits after decimal, otherwise returns false

//alert("In function chkFloat - floatNo : " +floatNo);

var numLength = floatNo.length;
var decPos    = 0 ;
var decCnt    = 0 ;
 for(var i=0;i<numLength && decCnt < 2;i++){
    if(floatNo.charAt(i) == '.'){
       decCnt++;
       decPos = i;
    }
 
 }

//alert("In function chkFloat - decCnt : " +decCnt);

 if(decCnt > 1 ){
    //alert("Please enter a valid number");
    return false;
 }

 else if(decCnt == 0 ){
    if(numLength > 3 ){
      //alert("In function chkFloat - numLength : " +numLength);
      //alert("Please enter a number with maximum 3 digits before decimal")
      return false;
    }
    else if(!isNDigit(floatNo)){
      //alert("Please enter a valid number");
      return false;
    }
    else
      return true;
 }

 else {

   //alert("In function chkFloat - numLength : " +numLength);
   var str1 = floatNo.substring(0,decPos);
   //alert(str1);
   var str2 = floatNo.substring(decPos+1);
   //alert(str2);

   if(str1.length>3 ){
     //alert("Please enter a number with maximum 3 digits before decimal")
     return false;
   }

   else if(str2.length>2){
     //alert("Please enter a number with maximum 2 digits after decimal")
     return false;
   }
   else if(str2.length==0){
     //alert("Please enter a valid number");
     return false;
   }

   else if(str1.length>0 && !isNDigit(str1)){
     //alert("Please enter a valid number");
     return false;
   }
   else if(str2.length>0 && !isNDigit(str2)){
     //alert("Please enter a valid number");
     return false;
   }
   else
     return true;

 }

}


  function printSpecial()
  {
           var gAutoPrint = true;
           if (document.getElementById != null)
           {
               var html = '<HTML>\n<HEAD>\n';

               if (document.getElementsByTagName != null)
               {
                   var headTags = document.getElementsByTagName("head");
                   if (headTags.length > 0)
                       html += headTags[0].innerHTML;
                   }

                   html += '\n</HEAD>\n<BODY>\n';
                 //alert(html);

                   var printReadyElem = document.getElementById("printReady");

                   if (printReadyElem != null)
                   {
                        /*The above code is customized,changed according to need */

                        html += printReadyElem.innerHTML;
                   }
                   else
                   {
                       alert("Could not find the printReady function");
                       return;
                   }

                   html += '\n</BODY>\n</HTML>';

                   var printWin = window.open("","printSpecial");
                   printWin.document.open();
                   printWin.document.write(html);
                   printWin.document.close();
                   if (gAutoPrint)
                       printWin.print();
               }
               else
               {
                   alert("The print ready feature is only available if you are using an browser. Please update your browser.");
               }
  }


  function getDeptDesc() {
  var stncd = document.getElementById("s2").options[document.getElementById("s2").selectedIndex].value ;


      var xmldiffrnciator = Math.floor(Math.random() * 100000);
      paramater = "stncd=" + stncd + "&switchVar=1&progId=GENORBLREP" ;
      paramater += "&xmldiffrnciator=" + xmldiffrnciator;

      if (stncd != "99999"){
          var url = "genOrblServlet_DEPT?" + paramater;
      }else{
          var url = "genOrblServlet_ALL?" + paramater;
      }

//alert(url) ;

      var myval = new Object();
      try {
          req_copy = new ActiveXObject("Msxml2.XMLHTTP");
      }catch(e){
                try {
                    req_copy = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(E){
                    req_copy = new XMLHttpRequest();
                }
      }
      req_copy.open('GET',url, true);
      req_copy.send('');
      req_copy.onreadystatechange = function(){
			    if(req_copy.readyState == 4){
			       //alert(req_copy.responseText);
				myval = req_copy.responseXML.getElementsByTagName("RECS");
				if(myval != null){
				     for(i = 0; i < myval.length; i++) {
					     var flag = myval[i].childNodes[0].nodeValue;
						     if ( flag == '0' ) {
							 alert('ERROR : NO RECORDS FOUND') ;
						     }
						     else {
							   populateDept(flag) ;
						     }
				     }
				  }
			     }
			  }
    }

    function populateDept(str) {
    var tmpArray = new Array() ;
    var tmpArray1 = new Array() ;
    tmpArray = str.split('@') ;

    document.getElementById("s1").length = tmpArray.length ;

    for ( i=0; i<tmpArray.length; i++ ) {
         tmpArray1=tmpArray[i].split('|') ;
         document.getElementById("s1")[i].text = '' ;
         document.getElementById("s1")[i].value = '' ;
    }
    for ( i=0; i<tmpArray.length-1; i++ ) {
         tmpArray1=tmpArray[i].split('|') ;
         document.getElementById("s1")[i].text = tmpArray1[1] ;
         document.getElementById("s1")[i].value = tmpArray1[0] ;
    }

    }

