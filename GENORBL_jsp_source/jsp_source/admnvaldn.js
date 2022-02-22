function changefocus(F1,F2,flg,e)
  {
  var unicode=e.charCode? e.charCode : e.keyCode

    if(unicode==13)
      {
   if(flg==1)
            {
            F2.focus();
            }
          else
            {
            F2.focus();
            F2.select();
            }
       }

  }

function chkMtr(F)
  {
    var str=F.value;
    var i=str.indexOf("S");
    if(i==0)
     {
     if(!isShort1(str.substring(i+1),7))
      {
       alert("MTR NO MUST BE OF 8 DIGIT BEGINNING WITH 'S'");
      F.focus();
       return false;
      }
     if(!isPosInt(str.substring(i+1)))
      {
       alert("WRONG ENTRY");
      F.focus();
       return false;
      }
     }
     else
      {
       alert("METER NO SHOULD START WITH 'S'");
      F.focus();
       return false;
      }
      return true;
  }

function chkpoint(F)
   {
   var str=F.value;
   var i,cnt=0;
   var S=str;
     while(true)
      {
     i=S.indexOf(".");
     S=S.substring(i+1);
     if(i==-1||cnt>1)
       break;
       cnt++;
      }
    if(cnt>1)
     {
      alert("WRONG ENTRY");
      F.focus();
      return false;
     }
    var X=str.indexOf(".");
    var Y=str.length-(X+1);
    if(X>4)
     {
     alert("Only Four digits are allowed before/after decimal");
     return false;
     }
    if(Y>4)
     {
     alert("Only Four digits are allowed before/after decimal");
     return false;
     }


      return true;
   }


function rpad(F,n,c)
  {
    var txt='';
    for(i=0;i<n-F.value.length;i++)
      {
         txt=txt+c;
      }
    F.value=F.value + txt;
  }

function lpad_only(v,n,c)
  {
    var txt='';
    for(i=0;i<n-v.length;i++)
      {
         txt=txt+c;
      }
    v=txt+v;
   return v;
  }






function changefocus(F1,F2,flg,e)
  {
  var unicode=e.charCode? e.charCode : e.keyCode

    if(unicode==13)
      { 
   if(flg==1)
            {
            F2.focus();
            }
          else
            {
            F2.focus();
            F2.select();
            }
       }

  }

function rpad(F,n,c)
  {
    var txt='';
    for(i=0;i<n-F.value.length;i++)
      {
         txt=txt+c;
      }
    F.value=F.value + txt;   
  }


function lpad(F,n,c)
  {
    var txt='';
    for(i=0;i<n-F.value.length;i++)
      {
         txt=txt+c;
      }
    F.value=txt+F.value;   
  }

function lpad_N(F,n,c)
  {
    var txt='';
    for(i=0;i<n-F.length;i++)
      {
         txt=txt+c;
      }
    F=txt+F;   
   return F;
  }


function chkdgtgen(str)
   {
       
        val=0;
       for(i=1,j=9;i<=9;i++,j--)
        {
         val=val+str.substring(i,i+1)*j;
        }
        val=val%11;
          if(val != 0 && val != 1)
              val = 11 - val;
      return val;
   }


function mmyychkgen(str)
   {
       
        val=0;
       for(i=0,j=4;i<=3;i++,j--)
        {
         val=val+str.substring(i,i+1)*j;
       
        }
        val=val%10;
       
      return val;
   }



function isPosInt(str){
  var pat="0123456789"
  var i=0;
    do{
    var flag = 0;
    for(var j=0;j<pat.length;j++){
      if(str.charAt(i)==pat.charAt(j)){
        flag = 1;
        break;
      }
      flag = 0;
    }
    i++
  }while(flag==1 && i<str.length)
  if (flag == 1)
    return true;
  return false;
}

function isPosInt1(str){
  var pat="0123456789."
  var i=0;
    do{
    var flag = 0;
    for(var j=0;j<pat.length;j++){
      if(str.charAt(i)==pat.charAt(j)){
        flag = 1;
        break;
      }
      flag = 0;
    }
    i++
  }while(flag==1 && i<str.length)
  if (flag == 1)
    return true;
  return false;
}
function isNull(str){
  if(str=='')
    return false;
  return true;
}

function isShort(str){
  if(str.length < 10)
    return false;
  return true;
}

function isShort1(str,n){
  if(str.length < n)
    return false;
  return true;
}

 function checkDate(fld,fld2,e,f) {
   var unicode=e.keyCode? e.keyCode : e.charCode;
    if(unicode==13)
      {
        if(fld.value!='')
         {
         if(!isPosInt(fld.value)){
          alert('Date must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

  if(!isShort1(fld.value,8)){
    alert('This field must be of 8 digits');
    fld.focus();
    fld.value='';
    return false;
  }

         }
    var mo, day, yr;
    var entry = fld.value;
        day = parseInt(entry.substring(0, 2)-0);
        mo = parseInt(entry.substring(2, 4)-0);
        yr = parseInt(entry.substring(4,8)-0);
 
        var testDate = new Date(yr, mo-1, day);
        
         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );
        
            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

            if((''+parseInt(oneDate.getDate( )-0)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getDate( )-0);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getDate( )-0);
               
         var mm2=''+testDate.getFullYear( );
        
            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);
   
            if((''+parseInt(testDate.getDate( )-0)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getDate( )-0);
               }
             else
               mm2=mm2+''+parseInt(testDate.getDate( )-0);

        if(mm1<mm2 && entry!='        ' && entry!='')
          {
          alert("WRONG DATE ENTERED");
    	  fld.focus();
    	  fld.select();
          return false;
          }
    
    if(entry!='        ' && entry!='')
       {
       if (testDate.getDate( ) == day) 
            {
            if (testDate.getMonth( ) + 1 == mo) 
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    fld2.focus();
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
    	  fld.focus();
    	  fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
    	  fld.focus();
    	  fld.select();
                   return false;
                       }
              } else {
                  alert("There is a problem with the date entry.");
    	  fld.focus();
    	  fld.select();
                  return false;
                     }
         }
       else
         {

       if(f==0)
        {
        fld2.focus();
    	fld2.select();
        }
       else
        fld2.focus();

        return true;              
          }
   }
}



 function checkDate_6(fld,fld2,e,f) {
   var unicode=e.keyCode? e.keyCode : e.charCode;
    if(unicode==13)
      {
        if(fld.value!='')
         {
         if(!isPosInt(fld.value)){
          alert('Date must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

  if(!isShort1(fld.value,6)){
    alert('This field must be of 6 digits');
    fld.focus();
    fld.value='';
    return false;
  }

         }
    var mo, day, yr,yr1;
    var entry = fld.value;
        day = parseInt(entry.substring(0, 2)-0);
        mo = parseInt(entry.substring(2, 4)-0);
        yr1 = lpad_N((parseInt(entry.substring(4,6)-0)+""),2,"0");

        

         if(yr1<50)
           yr="20"+yr1;
         if(yr1>50)
           yr="19"+yr1;

        var testDate = new Date(yr, mo-1, day);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

            if((''+parseInt(oneDate.getDate( )-0)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getDate( )-0);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getDate( )-0);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);
 
            if((''+parseInt(testDate.getDate( )-0)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getDate( )-0);
               }
             else
               mm2=mm2+''+parseInt(testDate.getDate( )-0);

        if(mm1<mm2 && entry!='        ' && entry!='')
          {
          alert("WRONG DATE ENTERED");
          fld.focus();
          fld.select();
          return false;
          }

    if(entry!='        ' && entry!='')
       {
       if (testDate.getDate( ) == day)
            {
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    fld2.focus();
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
                       }
              } else {
                  alert("There is a problem with the date entry.");
          fld.focus();
          fld.select();
                  return false;
                     }
         }
       else
         {

       if(f==0)
        {
        fld2.focus();
        fld2.select();
        }
       else
        fld2.focus();

        return true;
          }
   }
}

 function chk_both_date(fld1,fld2)
        {
         if(fld1.value!=fld2.value)
            {
              alert("DATE MISMATCH !!");
               fld2.focus();
               fld2.select();
               return false;
            }
             return true;
        }

 function gblcheckDate_6(fld) {
        if(fld.value!='')
         {
           if(fld.value!='      ')
             {
         if(!isPosInt(fld.value)){
          alert('Date must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

  if(!isShort1(fld.value,6)){
    alert('This field must be of 6 digits');
    fld.focus();
    fld.value='';
    return false;
  }
            }
         }
       else
         fld.value='      ';

    var mo, day, yr;
    var entry = fld.value;
        day = parseInt(entry.substring(0, 2)-0);
        mo = parseInt(entry.substring(2, 4)-0);
        yr1 = lpad_N((parseInt(entry.substring(4,6)-0)+""),2,"0");

         if(yr1<50)
           yr="20"+yr1;
         if(yr1>50)
           yr="19"+yr1;


        var testDate = new Date(yr, mo-1, day);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

            if((''+parseInt(oneDate.getDate( )-0)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getDate( )-0);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getDate( )-0);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);
  
            if((''+parseInt(testDate.getDate( )-0)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getDate( )-0);
               }
             else
               mm2=mm2+''+parseInt(testDate.getDate( )-0);

        if(mm1<mm2 && entry!='        ' && entry!='')
          {
          alert("WRONG DATE ENTERED");
          fld.focus();
          fld.select();
          return false;
          }

    if(entry!='        ' && entry!='')
       {
       if (testDate.getDate( ) == day)
            {
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
                       }
              } else {
                  alert("There is a problem with the date entry.");
          fld.focus();
          fld.select();
                  return false;
                     }
         }
       else
         {

        return true;
          }
}

 function chkmmyy(fld,fld2,e,f) {
   var unicode=e.keyCode? e.keyCode : e.charCode;
    if(unicode==13)
      {
    
        if(fld.value!='')
         {
         if(!isPosInt(fld.value)){
          alert('Field must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

         if(!isShort1(fld.value,4)){
            alert('This field must be of 4 digits');
            fld.focus();
            fld.value='';
            return false;
                  }

         }
    var mo, yr;
    var entry = fld.value;
        mo = parseInt(entry.substring(0,2)-0);
    //    yr = parseInt(entry.substring(2,4)-0);
        
        yr1 = lpad_N((parseInt(entry.substring(2,4)-0)+""),2,"0");

         if(yr1<50)
           yr="20"+yr1;
         if(yr1>50)
           yr="19"+yr1;   
        
        

        var testDate = new Date(yr, mo-1, 1);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);
  
 
        if(mm1<mm2 && entry!='    ' && entry!='')
          {
          alert("ENTERED MMYY CANNOT BE GREATER THAN CURRENT MMYY");
          fld.focus();
          fld.select();
          return false;
          }

    if(entry!='    ' && entry!='')
       {
 
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                          if(f==0)
		           {
		           fld2.focus();
		           fld2.select();
		           }
		          else
                           fld2.focus();
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
        }
 
         }
       else
         {

       if(f==0)
        {
        fld2.focus();
        fld2.select();
        }
       else
        fld2.focus();

        return true;
          }
   }
}







 function checkBCCD(fld,fld2,e,f) {
   var unicode=e.keyCode? e.keyCode : e.charCode;
    if(unicode==13)
      {
        if(fld.value!='')
         {
         if(!isPosInt(fld.value)){
          alert('Field must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

  if(!isShort1(fld.value,6)){
    alert('This field must be of 6 digits');
    fld.focus();
    fld.value='';
    return false;
  }

         }
    var mo, yr;
    var entry = fld.value;
        mo = parseInt(entry.substring(4, 6)-0);
        yr = parseInt(entry.substring(0,4)-0);

        var testDate = new Date(yr, mo-1, 1);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);
  
        if(mm1<mm2 && entry!='      ' && entry!='')
          {
          alert("WRONG YYYYMM");
          fld.focus();
          fld.select();
          return false;
          }

    if(entry!='      ' && entry!='')
       {
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    fld2.focus();
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
                       }
         }
       else
         {

       if(f==0)
        {
        fld2.focus();
        fld2.select();
        }
       else
        fld2.focus();

        return true;
          }
   }
}



 function checkBCCD_1(fld,fld2,e,f) {
   var unicode=e.keyCode? e.keyCode : e.charCode;
    if(unicode==13)
      {
        if(fld.value!='')
         {
         if(!isPosInt(fld.value)){
          alert('Field must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

  if(!isShort1(fld.value,6)){
    alert('This field must be of 6 digits');
    fld.focus();
    fld.value='';
    return false;
  }

         }
    var mo, yr;
    var entry = fld.value;
        mo = parseInt(entry.substring(4, 6)-0);
        yr = parseInt(entry.substring(0,4)-0);

        var testDate = new Date(yr, mo-1, 1);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);
 

    if(entry!='      ' && entry!='')
       {
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    fld2.focus();
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
                       }
         }
       else
         {

       if(f==0)
        {
        fld2.focus();
        fld2.select();
        }
       else
        fld2.focus();

        return true;
          }
   }
}







 function gblcheckBCCD(fld) {
        if(fld.value!='')
         {
          if(fld.value!='      ')
            {
         if(!isPosInt(fld.value)){
          alert('Field must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

  if(!isShort1(fld.value,6)){
    alert('This field must be of 6 digits');
    fld.focus();
    fld.value='';
    return false;
  }
            }
         }
       else
         fld.value='      ';
    var mo, yr;
    var entry = fld.value;
        mo = parseInt(entry.substring(4, 6)-0);
        yr = parseInt(entry.substring(0,4)-0);

        var testDate = new Date(yr, mo-1, 1);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);
 
        if(mm1<mm2 && entry!='      ' && entry!='')
          {
          alert("WRONG YYYYMM");
          fld.focus();
          fld.select();
          return false;
          }

    if(entry!='      ' && entry!='')
       {
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
                       }
         }
       else
         {
        return true;
          }
}


 function gblcheckBCCD_1(fld) {
        if(fld.value!='')
         {
           if(fld.value!='      ')
               {
         if(!isPosInt(fld.value)){
          alert('Field must be numeric');
          fld.focus();
          fld.select();
          return false;
          }

  if(!isShort1(fld.value,6)){
    alert('This field must be of 6 digits');
    fld.focus();
    fld.value='';
    return false;
  }
              }
         }
       else
         fld.value='      ';
    var mo, yr;
    var entry = fld.value;
        mo = parseInt(entry.substring(4, 6)-0);
        yr = parseInt(entry.substring(0,4)-0);

        var testDate = new Date(yr, mo-1, 1);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);


    if(entry!='      ' && entry!='')
       {
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
                       }
         }
       else
         {
        return true;
          }
}


  function gblchk_NA(F1,n)
    {
        rpad(F1,n,' ');
        return true;
    }


function allspace(F,N)
    {
      var str=F.value;
      
      var flg=0,c=0;
      
      for(m=0;m<str.length;m++)
        {
          if(str.charAt(m)!=' ')
          {
           flg=1;
           break;
          }
          c++;

        }
        
        if(c!=N)
           flg=1;

        if(flg==0)
          return true;
      
         return false;
    }


 function gblcheckDate(fld) {

        if(fld.value!='')
         {
          if(fld.value!='        ')
           {
         if(!isPosInt(fld.value)){
          alert('Date must be numeric');
          fld.focus();
          fld.select();
          return false;
          }
           }
         }
        else
         fld.value='        ';
    var mo, day, yr;
    var entry = fld.value;
        day = parseInt(entry.substring(0, 2)-0);
        mo = parseInt(entry.substring(2, 4)-0);
        yr = parseInt(entry.substring(4,8)-0);

        var testDate = new Date(yr, mo-1, day);

         var oneDate = new Date( );
         var mm1=''+oneDate.getFullYear( );

            if((''+parseInt(oneDate.getMonth( )-0+1)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getMonth( )-0+1);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getMonth( )-0+1);

            if((''+parseInt(oneDate.getDate( )-0)).length==1)
               {
               mm1=mm1+'0'+parseInt(oneDate.getDate( )-0);
               }
               else
               mm1=mm1+''+parseInt(oneDate.getDate( )-0);

         var mm2=''+testDate.getFullYear( );

            if((''+parseInt(testDate.getMonth( )-0+1)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getMonth( )-0+1);
               }
            else
               mm2=mm2+''+parseInt(testDate.getMonth( )-0+1);

            if((''+parseInt(testDate.getDate( )-0)).length==1)
               {
               mm2=mm2+'0'+parseInt(testDate.getDate( )-0);
               }
             else
               mm2=mm2+''+parseInt(testDate.getDate( )-0);

        if(mm1<mm2 && entry!='        ' && entry!='')
          {
          alert("WRONG DATE ENTERED");
          fld.focus();
          fld.select();
          return false;
          }

    if(entry!='        ' && entry!='')
       {
       if (testDate.getDate( ) == day)
            {
            if (testDate.getMonth( ) + 1 == mo)
               {
                if (testDate.getFullYear( ) == yr)
                 {
                    return true;
                 } else {
                    alert("There is a problem with the year entry.");
          fld.focus();
          fld.select();
                     return false;
                        }
                } else {
                   alert("There is a problem with the month entry.");
          fld.focus();
          fld.select();
                   return false;
                       }
              } else {
                  alert("There is a problem with the date entry.");
          fld.focus();
          fld.select();
                  return false;
                     }
         }
       else
         {
        return true;
          }
}
