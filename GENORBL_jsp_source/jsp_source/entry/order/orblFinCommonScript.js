function isPosInt(str){
if ( str != "" ) {
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
 return true;
}

function isSplPosInt(str){
if ( str != "" ) {
  var pat="-0123456789."
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
 return true;
}

function isPosInt1(str){
if ( str != "" && str != " ") {
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
 return true;
}

function isHT(str) {
  var val = str.substr(0,2) ;
  if ( val != "09" )
      return false ;
  return true ;
}

function isNull(str){
  if(str=='' || str == ' ' )
    return false;
  return true;
}

function isLength(str){
  if( str.length < 10  )
    return false;
  return true;
}

function mrLength(str){
  if( str.length < 9  )
    return false;
  return true;
}

function isLengthpin(str){
  if( str.length < 6 && str!='')
    return false;
  return true;
}

function isLengthph(str){
  if( str.length < 8 && str!='' )
    return false;
  return true;
}

function noenter(){
   return !(window.event && window.event.keyCode == 13);
}

function chkdgtgen(str) {
    val=0;
    for(i=0;i<9;i++) {
         val=val+str.substring(i,i+1)*(9-i);
    }
    val=val%11;
    if(val != 0 && val != 1)
       val = 11 - val;

    return val;
}

function isValidDate(str)
{
 if  (str != "" && str != " " )  {
  if(str.length!=8)
    return false;
   var d=str.substring(0,2)-0;
   var m=str.substring(3,5)-0;
   var y=str.substring(6,8)-0;
  if(d==0||m==0||y==0){
    return false;
  }
  if(m>12){
    return false;
  }
  if(m==1||m==3||m==5||m==7||m==8||m==10||m==12){
    dmax=31;
  }
  if(m==4||m==6||m==9||m==11){
    dmax=30;
  }
  if ( m==2 ) {
     if((y%400==0||(y%4==0&&y%100!=0)))
      dmax=29;
     else
      dmax=28;
  }
  if(d>dmax){
    return false;
  }
 }
    return true; 
}

function isHigherDate(str) {
if ( str != "" && str != " " ) {
    var myDate = new Date() ;
    var dd = myDate.getDate() ;
    var mm = myDate.getMonth() ;
    var yyyy = myDate.getFullYear() ;
    var sysDate = new Date(yyyy,mm,dd);
    var tmpArray = new Array() ;
    tmpArray = str.split('-') ;
    if ( tmpArray[1] == 'Jan' ) {
          tmpArray[1] = 0 ;
       }
    if ( tmpArray[1] == 'Feb' ) {
          tmpArray[1] = 1 ;
       }
    if ( tmpArray[1] == 'Mar' ) {
          tmpArray[1] = 2 ;
       }
    if ( tmpArray[1] == 'Apr' ) {
          tmpArray[1] = 3 ;
       }
    if ( tmpArray[1] == 'May' ) {
          tmpArray[1] = 4 ;
       }
    if ( tmpArray[1] == 'Jun' ) {
          tmpArray[1] = 5 ;
       }
    if ( tmpArray[1] == 'Jul' ) {
          tmpArray[1] = 6 ;
       }
    if ( tmpArray[1] == 'Aug' ) {
          tmpArray[1] = 7 ;
       }
    if ( tmpArray[1] == 'Sep' ) {
          tmpArray[1] = 8 ;
       }
    if ( tmpArray[1] == 'Oct' ) {
          tmpArray[1] = 9 ;
       }
    if ( tmpArray[1] == 'Nov' ) {
          tmpArray[1] = 10 ;
       }
    if ( tmpArray[1] == 'Dec' ) {
          tmpArray[1] = 11 ;
       }

   var newDate = new Date(tmpArray[2],tmpArray[1],tmpArray[0]) ;
    //alert('New Date = ' + newDate) ;
    //alert('Sys Date = ' + sysDate) ;
   
    if ( newDate > sysDate ) {
        //alert('greater than sysdate');
        return true ;
        }
    else{
        //alert('less than or equal sysdate');
        return false ;
        }
 }
}


function isLowerDate(str) {
 if ( str != "" && str != " " ) {
    var myDate = new Date() ;
    var dd = myDate.getDate() ;
    var mm = myDate.getMonth() ;
    var yyyy = myDate.getFullYear() ;
    var sysDate = new Date(yyyy,mm,dd);
    
    var tmpArray = new Array() ;
    tmpArray = str.split('/') ;
    if ( tmpArray[1] == 1 ) {
        tmpArray[1] = 12 ;
        tmpArray[2] = tmpArray[2] - 1 ;
    }
    else 
         tmpArray[1] = tmpArray[1] - 1 ;
    
    var newDate = new Date(tmpArray[2],tmpArray[1],tmpArray[0]) ;
//    alert('New Date = ' + newDate) ;
//    alert('Sys Date = ' + sysDate) ;
    
    if ( newDate < sysDate )
        return true ;
    else 
        return false ;
 }
}

function compareDate(strA,strB) {
    var tmpArrayA = new Array() ;
    var tmpArrayB = new Array() ;

    if ( strA != '' && strA != ' ' && strB != '' && strB != ' ' ) {
      //alert( ' AAAAA ');
        tmpArrayA = strA.split('-') ;
       if ( tmpArrayA[1] == 'Jan' ) {
          tmpArrayA[1] = 0 ;
       }
       if ( tmpArrayA[1] == 'Feb' ) {
          tmpArrayA[1] = 1 ;
          }
       if ( tmpArrayA[1] == 'Mar' ) {
          tmpArrayA[1] = 2 ;
       }
       if ( tmpArrayA[1] == 'Apr' ) {
          tmpArrayA[1] = 3 ;
       }
       if ( tmpArrayA[1] == 'May' ) {
          tmpArrayA[1] = 4 ;
       }
       if ( tmpArrayA[1] == 'Jun' ) {
          tmpArrayA[1] = 5 ;
       }
       if ( tmpArrayA[1] == 'Jul' ) {
          tmpArrayA[1] = 6 ;
       }
       if ( tmpArrayA[1] == 'Aug' ) {
          tmpArrayA[1] = 7 ;
       }
       if ( tmpArrayA[1] == 'Sep' ) {
          tmpArrayA[1] = 8 ;
       }
       if ( tmpArrayA[1] == 'Oct' ) {
          tmpArrayA[1] = 9 ;
       }
       if ( tmpArrayA[1] == 'Nov' ) {
          tmpArrayA[1] = 10 ;
       }
       if ( tmpArrayA[1] == 'Dec' ) {
          tmpArrayA[1] = 11 ;
       }

        tmpArrayB = strB.split('-') ;
       
       if ( tmpArrayB[1] == 'Jan' ) {
          tmpArrayB[1] = 0 ;
       }
       if ( tmpArrayB[1] == 'Feb' ) {
          tmpArrayB[1] = 1 ;
          }
       if ( tmpArrayB[1] == 'Mar' ) {
          tmpArrayB[1] = 2 ;
       }
       if ( tmpArrayB[1] == 'Apr' ) {
          tmpArrayB[1] = 3 ;
       }
       if ( tmpArrayB[1] == 'May' ) {
          tmpArrayB[1] = 4 ;
       }
       if ( tmpArrayB[1] == 'Jun' ) {
          tmpArrayB[1] = 5 ;
       }
       if ( tmpArrayB[1] == 'Jul' ) {
          tmpArrayB[1] = 6 ;
       }
       if ( tmpArrayB[1] == 'Aug' ) {
          tmpArrayB[1] = 7 ;
       }
       if ( tmpArrayB[1] == 'Sep' ) {
          tmpArrayB[1] = 8 ;
       }
       if ( tmpArrayB[1] == 'Oct' ) {
          tmpArrayB[1] = 9 ;
       }
       if ( tmpArrayB[1] == 'Nov' ) {
          tmpArrayB[1] = 10 ;
       }
       if ( tmpArrayB[1] == 'Dec' ) {
          tmpArrayB[1] = 11 ;
       }

        var newDateA = new Date(tmpArrayA[2],tmpArrayA[1],tmpArrayA[0]) ;
        var newDateB = new Date(tmpArrayB[2],tmpArrayB[1],tmpArrayB[0]) ;
        //alert ( 'newDateA ' + newDateA + ' newDateB ' + newDateB );
        if ( newDateA <= newDateB ) {
            //alert( '  newDateA <= newDateB ');
            return true ;
        }
        else {
            //alert( '  newDateA > newDateB ');
            return false ;
        }
    }
    else if ( strA != '' && strA != ' ' && ( strB == '' || strB == ' ' )) {
      //alert( ' BBBBB ');
             return true ;
    }
    else if (( strA == '' || strA == ' ' ) && strB != '' && strB != ' '  ) {
      //alert( ' CCCCC');
             return false ;
    }
    else if (( strA == '' || strA == ' ' ) && ( strB == '' || strB == ' ' )){
      //alert( ' DDDDD ');
             return true ;
    }
}

    
function isValidDist(str) {
    if ( ( parseInt(str) >= 1 && parseInt(str) <= 76 ) || 
           parseInt(str) == 85 ||
         ( parseInt(str) >= 88 && parseInt(str) <= 90 ) ||
         ( parseInt(str) >= 94 && parseInt(str) <= 96 ) )
        return true ;
    else
        return false ;
}
