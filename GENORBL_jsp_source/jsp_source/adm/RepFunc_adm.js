  function prescript(){
           document.getElementById("s2").focus();
  }

  function prescript1(){
           document.getElementById("s1").focus();
  }

  function DefaultValue(){
         document.getElementById('h1').value=document.getElementById('st_dt').value;
         document.getElementById('h2').value=document.getElementById('end_dt').value;
         document.getElementById('h3').value=document.getElementById('s1').value;
         document.getElementById('h4').value=document.getElementById('s2').value;
  }

  function DefaultValue1(){
         document.getElementById('h1').value=document.getElementById('s1').value;
         document.getElementById('h2').value=document.getElementById('s2').value;
  }

  function DefaultValue3(){
         document.getElementById('h1').value=document.getElementById('st_dt').value;
         document.getElementById('h2').value=document.getElementById('end_dt').value;
         document.getElementById('h3').value=document.getElementById('s1').value;
  }


  function DefaultValue2(){
         val1 = document.getElementById('s1').value;
         val2 = document.getElementById('s2').value;
         val3 = document.getElementById('s3').value;
         val4 = document.getElementById('s4').value;

         if(val1=="NONE" && val2=="NONE" && val3=="NONE" && val4=="NONE")
            document.getElementById('h1').value = "NONE"
         else
            document.getElementById('h1').value=val1+'/'+val2+'/'+val3+'/'+val4;

         val5 = document.getElementById('s5').value;
         val6 = document.getElementById('s6').value;

         if(val5=="NONE" && val6=="NONE")
            document.getElementById('h2').value = "NONE"
         else
            document.getElementById('h2').value=val5+'/'+val6;
   
         val7 = document.getElementById('s7').value;

         if(val7=="NONE")
            document.getElementById('h3').value = "NONE"
         else
            document.getElementById('h3').value=val7;

          document.getElementById('h4').value=val1;
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

