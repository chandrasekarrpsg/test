var g_maxLength = 6;
var g_lenBefDec = 3;
var g_lenAftDec = 2;

var g_maxrows = 0;

var g_mnths_tot_col = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13");
var g_all_cell_id_array = new Array();
var g_ne_cell_id_array  = new Array();
var g_y_cell_id_array  = new Array();
var g_grp_seq_array1 = new Array();
var g_bgt_seq_updated  = [];
var g_bgt_seq_inserted = new Array();
var g_bgt_mm_val = new Array("04","05","06","07","08","09","10","11","12","01","02","03"," ");
var g_bgt_mm_ordr = new Array("1","2","3","4","5","6","7","8","9","10","11","12","13");
var g_bgt_yy_val = new Array(13);


g_bgt_seq_updated[0] = new Array(4);
g_bgt_seq_updated[0][0] = "XX";
g_bgt_seq_updated[0][1] = "XX";
g_bgt_seq_updated[0][2] = "XX";
g_bgt_seq_updated[0][3] = "XX";

var g_val_of_cell_act = new Array();


var g_alert_hd = "BUDGET SYSTEM :\n\n";

function preScript(){

// alert("In Prescript");
// lockCol('tbl'); 
  
}

function lockCol(tblID) {
 
        //alert(tblID);
	var table = document.getElementById(tblID);
	var button = document.getElementById('toggle');
	var cTR = table.getElementsByTagName('TR');  //collection of rows
 
    for(index=0;index<3;index++){
 
	     	for (i = 0; i < cTR.length; i++){
		     	var tr = cTR.item(i);
			    tr.cells[index].className = 'locked'
		    }
	//	button.innerText = "Unlock First Column";
		//button.innerText = "Lock First Column";
    
    }

}


function enableDisableButtons(disableMkrB1,disableMkrB2,disableMkrB3){

   if(disableMkrB1 == "T"){

      document.getElementById("B1").disabled = true; 

   }else{
 
      document.getElementById("B1").disabled = false;

   }

   if(disableMkrB2 == "T"){

      document.getElementById("B2").disabled = true; 

   }else{
 
      document.getElementById("B2").disabled = false;
   }

/*
   if(disableMkrB3 == "T"){

      document.getElementById("B3").disabled = true; 

   }else{
 
      document.getElementById("B3").disabled = false;
   }
*/


}

function addEventHandler(elem,eventType,handlerFunc) {

 alert("attaching Events");
 if (elem.addEventListener)
     elem.addEventListener (eventType,handlerFunc,false);
 else if (elem.attachEvent)
     elem.attachEvent ('on'+eventType,handlerFunc); 

}

function addBgtSeqforUpd(cell_id,bgt_seq,mm_val,yy_val){

 
   var existFlg = 0;
//   alert(g_bgt_seq_updated.length);
//   alert("cell id"+cell_id+"bgt_seq"+bgt_seq+"mm_val"+mm_val+"yy_val"+yy_val);

   for(var i=0;i<g_bgt_seq_updated.length;i++){

       if(g_bgt_seq_updated[i][0]==cell_id){
         
          existFlg = 1;
          break;
       }

   }

   if(existFlg == 0){

//      alert("kk"+g_bgt_seq_updated.length);
//      alert("kk"+g_bgt_seq_updated[0][0]);
      g_bgt_seq_updated[g_bgt_seq_updated.length] = new Array(4);

      g_bgt_seq_updated[g_bgt_seq_updated.length-1][0] = cell_id;
      g_bgt_seq_updated[g_bgt_seq_updated.length-1][1] = bgt_seq;
      g_bgt_seq_updated[g_bgt_seq_updated.length-1][2] = mm_val;
      g_bgt_seq_updated[g_bgt_seq_updated.length-1][3] = yy_val;

   }


}

function submitForm(form_name){


   document.getElementsByName(form_name)[0].submit();

   return true;

}

function chkBefSubmit(ins_upd_mkr){

  putZeroInYFields();

  document.getElementById("B1").disabled=true;
 // alert(ins_upd_mkr);

  if(checkAllCells()){

     //loadImg();

     if(ins_upd_mkr=='U'){
        if(poplUpdateString()){
           document.INSERT_UPDATE_RECS.insert_string.value="I";
 
           if(submitForm('INSERT_UPDATE_RECS')){

              loadImg();   

           }else{


           }
        }else{

          /*No values entered for Updating */
          submitForm('SELF_SUBMIT');

        }
     }
     if(ins_upd_mkr=='I'){
        if(poplInsertString()){
           document.INSERT_UPDATE_RECS.update_string.value="U";
           if(submitForm('INSERT_UPDATE_RECS')){

              loadImg();

           }
        }else{

         /*No values entered for Inserting */
          submitForm('SELF_SUBMIT');

        }
     }

//     unloadImg();

  }

  putNullInYFields();
  document.getElementById("B2").disabled=false;

  return true;
}


function checkAllCells(){
 
  //alert("In checkAllCells");

  if(g_all_cell_id_array.length == 0){

     //alert("No Cells Populated");

  }else{

     for(var i = 0;i<g_all_cell_id_array.length ; i++){
        var bgt_seq = g_all_cell_id_array[i][14];
        //alert(bgt_seq);
        for(var j= 0;j<(g_all_cell_id_array[i].length)-2 ; j++){

            var cell_id = g_all_cell_id_array[i][j];
            var rowIndex = i;
            var colIndex = j;

            var cur_cell_obj=document.getElementById(cell_id);
            //cur_cell_obj.select();

            if(!checkValue(cur_cell_obj,'A')){

                 return false;

            }

        }

     }     

  } 

  return true;

}

function poplUpdateString(){

  var rowDelim = "$$$";
  var colDelim = "|";
  var updString = "";
  var bgt_cell_id = "";

 // alert("In psoplUpdateString()");

  for(var i=1;i<g_bgt_seq_updated.length;i++){

      var bgt_cell_id_updated = g_bgt_seq_updated[i][0];

      //alert("bgt_cell_id_updated:"+bgt_cell_id_updated);

      for(var j=0;j<(g_bgt_seq_updated[i].length);j++){

          updString = updString+g_bgt_seq_updated[i][j]+colDelim;

      }

      updString = updString+ trimText(document.getElementById(bgt_cell_id_updated).value)+colDelim; 
      updString = updString+rowDelim; 

  }

  //alert('Update_String'+updString);

  if(updString.length!=0){

     document.getElementById('update_string').value=updString;
     return true;

  }else{

     return false;

  }


}

function poplInsertString(){

  var rowDelim = "$$$";
  var colDelim = "|";
  var insString = "";
  var bgt_cell_id = "";
  
  for(var i=0;i<g_bgt_seq_inserted.length;i++){

     for(var j=0; j<g_bgt_seq_inserted[i].length;j++){

         insString = insString + g_bgt_seq_inserted[i][j] + colDelim;

     }

     insString = insString + trimText(document.getElementById(g_bgt_seq_inserted[i][0]).value) + colDelim;
     insString = insString+rowDelim; 
  }

  //alert('Insert_String'+insString);

  if(insString.length!=0){

     document.getElementById('insert_string').value=insString;
     return true;

  }else{

     return false;

  }
}

function checkCell(row_indx,col_indx,bgt_seq,sNEMkr){

   //alert(row_indx+","+col_indx+","+bgt_seq);
   //alert(g_all_cell_id_array.length);
//   alert(g_all_cell_id_array[parseInt(row_indx-0)][parseInt(col_indx-0)]);
//   alert("Target Cell Index"+g_grp_seq_array1[parseInt(row_indx-0)][2]);
   var cur_cell_id = g_all_cell_id_array[parseInt(row_indx-0)][parseInt(col_indx-0)];
   var cur_cell_obj = document.getElementById(g_all_cell_id_array[parseInt(row_indx-0)][parseInt(col_indx-0)]);
   var next_cell_obj ;

   var target_cell_annual_sum = document.getElementById(g_all_cell_id_array[parseInt(row_indx-0)][12]);

   if(parseInt(row_indx-0)+1<g_all_cell_id_array.length){

       next_cell_obj = document.getElementById(g_all_cell_id_array[parseInt(row_indx-0)+1][parseInt(col_indx-0)]);

   }else{

      
      if(parseInt(col_indx-0)+1 == g_mnths_tot_col.length - 1){ 

         next_cell_obj = cur_cell_obj;

      }else{

         next_cell_obj = document.getElementById(g_all_cell_id_array[0][parseInt(col_indx-0)+1]); 

      }

   }

   if(!checkValue(cur_cell_obj,'I')){

       return false;

   }

   addBgtSeqforUpd(cur_cell_id,bgt_seq,g_bgt_mm_val[parseInt(col_indx-0)],g_bgt_yy_val[parseInt(col_indx-0)]);

   putZeroInYFields();
   
   //alert("Target Cell Annual"+g_all_cell_id_array[parseInt(row_indx-0)][12]);
   summationAnnual(g_all_cell_id_array[parseInt(row_indx-0)][12],bgt_seq);

   if(parseInt(row_indx-0)+1<g_all_cell_id_array.length){

      if(sNEMkr=="NE"){
         //summationOfCellVal_1(row_indx,col_indx,bgt_seq);
      }
   }
   
   addBgtSeqforUpd(g_all_cell_id_array[parseInt(row_indx-0)][12],bgt_seq,g_bgt_mm_val[12],g_bgt_yy_val[12]);

   putNullInYFields();

   focusNextObj(next_cell_obj);

   //return true;
   return noEnter();

}

function focusNextObj(next_cell_obj){

   next_cell_obj.select();
   next_cell_obj.focus();

}

function summationOfCellVal_1(row_indx,col_indx,bgt_seq){


   //alert("summationOfCellVal_1");


/*
   alert("length of grpseq array"+g_grp_seq_array1.length);
   alert("length of grpseq array at index 4"+g_grp_seq_array1[4].length);
   alert("value at 3,0"+g_grp_seq_array1[3][0]);
   alert("value at 3,1"+g_grp_seq_array1[3][1]);
   alert("value at 3,2"+g_grp_seq_array1[3][2]);
   alert("value at 3,3"+g_grp_seq_array1[3][3]);

   alert("length of grpseq array at index 1"+g_grp_seq_array1[1].length);
   alert("length of grpseq array at index 2"+g_grp_seq_array1[2].length);
   alert("length of grpseq array at index 3"+g_grp_seq_array1[3].length);
   alert("length of grpseq array at index 5"+g_grp_seq_array1[5].length);
   alert("length of grpseq array at index 6"+g_grp_seq_array1[6].length);

   alert("row_indx"+row_indx);
   alert("col_indx"+col_indx);
   alert("bgt_seq"+bgt_seq);
*/
   var grp_seq_index = parseInt(g_all_cell_id_array[parseInt(row_indx-0)+1][g_mnths_tot_col.length] - 0) ;

   var grp_sum_index = parseInt(g_grp_seq_array1[parseInt(grp_seq_index-0)][2] - 0);
   
   var strt_grp_index = parseInt(g_grp_seq_array1[parseInt(grp_seq_index-0)][0]-0);
   var end_grp_index = parseInt(g_grp_seq_array1[parseInt(grp_seq_index-0)][1]-0);

/*
   alert("grp_seq_index"+grp_seq_index);
   alert("grp_sum_index"+grp_sum_index);
   alert("grp_sum_index val"+g_grp_seq_array1[parseInt(grp_seq_index-0)][2]+"KKK");

   alert("strt_grp_index"+strt_grp_index);
   alert("end_grp_index"+end_grp_index);
*/

   var grp_sum_cell_id        = g_all_cell_id_array[parseInt(grp_sum_index-0)][parseInt(col_indx-0)];
   var annual_grp_sum_cell_id = g_all_cell_id_array[parseInt(grp_sum_index-0)][12];

//   alert("grp_sum_cell_id"+grp_sum_cell_id);

   var grp_sum = 0; 
   var annual_grp_sum = 0; 

   for(var i = strt_grp_index ; i<=end_grp_index; i++){

       grp_sum = grp_sum + parseFloat(document.getElementById(g_all_cell_id_array[i][parseInt(col_indx-0)]).value - 0) ; 

       annual_grp_sum = annual_grp_sum + parseFloat(document.getElementById(g_all_cell_id_array[i][12]).value - 0);
   //    alert("Annual group cell id:"+g_all_cell_id_array[i][12]);

   } 

   grp_sum = grp_sum.toFixed(5);
   annual_grp_sum = annual_grp_sum.toFixed(5);

 //  alert("Sum"+grp_sum);
 //  alert("Annual Group Sum"+annual_grp_sum);

   document.getElementById(grp_sum_cell_id).value = grp_sum ;
   document.getElementById(annual_grp_sum_cell_id).value = annual_grp_sum ;

   addBgtSeqforUpd(grp_sum_cell_id,g_grp_seq_array1[parseInt(grp_seq_index-0)][3],g_bgt_mm_val[parseInt(col_indx-0)],g_bgt_yy_val[parseInt(col_indx-0)]);
   addBgtSeqforUpd(annual_grp_sum_cell_id,g_grp_seq_array1[parseInt(grp_seq_index-0)][3],g_bgt_mm_val[12],g_bgt_yy_val[12]);

}

function putNullInYFields(){

  //alert("g_y_cell_id_array.length"+g_y_cell_id_array.length);
  for(var i=0;i<g_y_cell_id_array.length;i++){

     for(var j=0; j<g_mnths_tot_col.length;j++){

        document.getElementById(g_y_cell_id_array[i][j]).value = "";

     }
  }

}

function putZeroInYFields(){

  for(var i=0;i<g_y_cell_id_array.length;i++){

     for(var j=0; j<g_mnths_tot_col.length;j++){

        document.getElementById(g_y_cell_id_array[i][j]).value = "0.00";

     }
  }

}

function summationOfCellVal(target_bgt_seq,grp_seq_array){

    //alert("length of  arrray:"+grp_seq_array.length);
    //alert("1st elem in arrray:"+grp_seq_array[0]);

    for(var k = 0; k<g_mnths_tot_col.length;k++){
   
        var target_bgt_cell_id = "T_"+target_bgt_seq+"_"+g_mnths_tot_col[k];

        var summ_val = 0;
  
        var grp_val_array = [];
    
        for(var i = 0; i < grp_seq_array.length; i++){

            //alert("Id:"+"T_"+grp_seq_array[i]+"_"+g_mnths_tot_col[k]);
           // alert("Grp value:"+document.getElementById("T_"+grp_seq_array[i]+"_"+g_mnths_tot_col[k]).value);
            grp_val_array.push(document.getElementById("T_"+grp_seq_array[i]+"_"+g_mnths_tot_col[k]).value);

        }
        for(var i = 0; i < grp_val_array.length; i++){

            summ_val = summ_val + parseFloat(grp_val_array[i]-0);

        }

        if(parseFloat(summ_val-0) == 0){

         //  summ_val = "0.00";
           summ_val = "";

        }else{

           summ_val = summ_val.toFixed(5);

        }

        //alert("Group Array Size :"+grp_val_array.length);
        //alert("Summation of Values :"+summ_val);

        document.getElementById(target_bgt_cell_id).value=summ_val;

    }
}

function summationAnnual(target_bgt_cell_Id,bgt_seq){


  //alert("Target Id:"+target_bgt_cell_Id);

  var summ_annual = 0;

  for(var i = 0; i < g_mnths_tot_col.length-1; i++){

     summ_annual = summ_annual + parseFloat(document.getElementById("T_"+bgt_seq+"_"+g_mnths_tot_col[i]).value-0);

  }

  //alert(summ_annual);
  if(parseFloat(summ_annual-0) == 0){

     //summ_annual = "0.00";
     summ_annual = "";

  }else{

     summ_annual = summ_annual.toFixed(3);

  }

  document.getElementById(target_bgt_cell_Id).value = summ_annual;

}

function popl_exstngVal_inCells(target_bgt_cell_id,val){

  //alert("Value at cellId"+target_bgt_cell_id+",val:"+val);
 // try{
     var decPos = 0;
     var decCnt = 0;
 
     var valBefDec = "0";
     var valAftDec = "00";

     val=trimText(val);

     if(val.length==0){

        val = "0.00";
     }

     for(i=0;i<val.length;i++){
     
         if(val.charAt(i)=='.'){
       
            decPos=i;
            decCnt++;         
         }
    
     }
      
     if(decPos==-1){
    
         valBefDec = val.substring(0);
         valAftDec = "00";

      
     }else{
      
         valBefDec = val.substring(0,decPos);
         valAftDec = val.substring(decPos+1);
      
     }

     val = valBefDec+"."+valAftDec ;

     if(parseFloat(val-0)!=0){

        document.getElementById(target_bgt_cell_id).value = val;

     }else{

        document.getElementById(target_bgt_cell_id).value = ' ';

     }

//  }catch (e) {

 //      alert("Value at cellId"+target_bgt_cell_id+",val:"+val);

  //}


}

function goToTimeSheetScreen(){

   document.BACK.submit();

}

function submitRecs(maxRows){

   var concatString = "";
   var field = "";


   for(i=1;i<=maxRows;i++){


       var empCd = document.getElementById("H"+i+"_ECODE").value;

       concatString = concatString+"$$$"+empCd;

       for(j=3;j<=20;j++){

           field = document.getElementById("T"+i+j).value;
         
           concatString = concatString+"|"+field;

       }
    
       field = document.getElementById("H"+i).value;

       concatString = concatString+"|"+field;

       concatString = concatString+"|";


   }

   //alert(concatString);
   document.INSERT_RECS.insert_string.value = concatString;
   document.INSERT_RECS.submit();

}



 
function checkLeave(obj){

   var objId = obj.id;
   var rownum =  parseInt(objId.substr(1,1)-0);
   var colnum =  parseInt(objId.substr(2)-0);

   //alert("ObjId"+objId+",value:"+obj.value+",ASCII:"+obj.value.charCodeAt(0));

   if(!(((obj.value).charCodeAt(0)>=48 && ((obj.value).charCodeAt(0))<=57)||((obj.value).charCodeAt(0)==88))){

       alert("Please Enter The Values of Leave Types as Given in the Upper Right Corner Of the Screen !!");
       obj.focus();
       obj.select();
       return false;

   }

   if((obj.value).charCodeAt(0)==88){


   }else{

       var val = parseInt(obj.value-0);
   
       if(!(val>=0 && val <=9 && val!=5)){
   
           alert("Please Enter The Values of Leave Types as Given in the Upper Right Corner Of the Screen !!");
           obj.focus();
           obj.select();
           return false;
   
       }
   
       var lvType= g_leaveArray[val];

       document.getElementById("TD1"+rownum).value = lvType;
   
       document.getElementById("H"+rownum).value = lvType; 
   }

   var nextObjIdRownum = rownum;
   var nextObjIdColnum = g_colArray[colnum+1] ;
  
   var nextObjId = "T" + nextObjIdRownum + nextObjIdColnum ;
   focusNext(nextObjId);

   return true;
   
}            

function checkValue(obj,ind_all_mrk){

//   alert(obj.id);
   var objId = obj.id;
   var decPos = -1 ;
   var decCnt = 0 ;

   var minusPos = -1 ;
   var minusCnt = 0 ;

   //alert("Obj.value"+obj.value);
   //alert("Obj"+obj);

   obj.value=trimText(obj.value);

   if(obj.value.length==0){

      obj.value = "0.00";
   }

   for(i=0;i<obj.value.length;i++){
     
       if(obj.value.charAt(i)=='.'){
       
          decPos=i;
          decCnt++;         
       }
       if(obj.value.charAt(i)=='-'){
       
          minusPos=i;
          minusCnt++;         
       }
    
   }
      
   if(decCnt>1){
      
      alert(g_alert_hd+"Decimal Point Can Occur AtMost Once!!");
      obj.focus();
      obj.select();
      return false;
      
   }
      
   if(decPos==-1){
     
      var valBefDec = obj.value.substring(0);
      var valAftDec = "00";

      
   }else{
      
      var valBefDec = obj.value.substring(0,decPos);
      var valAftDec = obj.value.substring(decPos+1);
      
   }

   if(minusCnt==0){
      
      if(valBefDec.length>5){
      
         alert(g_alert_hd+"Please Enter Not More Than 5 Digits Before Decimal Part!!");
         obj.select();
         obj.focus();
         return false;
      
      }else{
      
         if (ind_all_mrk == 'I'){
            if(valAftDec.length>3){
         
               alert(g_alert_hd+"Please Enter Not More Than 3 Digits After Decimal Part!!");
               obj.select();
               obj.focus();
               return false;

            }

         }
      
      }

   }else{


      if(valBefDec.length>6){
      
         alert(g_alert_hd+"Please Enter Not More Than 5 Digits Before Decimal Part!!");
         obj.select();
         obj.focus();
         return false;
      
      }else{
      
         if (ind_all_mrk == 'I'){
            if(valAftDec.length>3){
         
               alert(g_alert_hd+"Please Enter Not More Than 3 Digits After Decimal Part!!");
               obj.select();
               obj.focus();
               return false;

            }

         }
      
      }



   }
      
   if(!(checkValPresent(valBefDec)&&checkValPresent(valAftDec))){
      
        obj.value = "0.00";
      
   }
      
   if(!(checkNumber(valAftDec))){
    
        alert(g_alert_hd+"Please Enter Digits After Decimal Part!!");
        obj.select();
        obj.focus();
        return false;
            
   }else{
      
        if(!(checkNumber(valBefDec))){
      
           alert(g_alert_hd+"Please Enter Digits Before Decimal Part!!");
           obj.select();
           obj.focus();
           return false;
   
       }
         
   }
      
   //var paddedValBefDec = lPad(valBefDec,7,'0');
   //var paddedValAftDec = rPad(valAftDec,5,'0');

   var paddedValBefDec = lPad(valBefDec,5,' ');
   var paddedValAftDec = rPad(valAftDec,3,' ');

   var totPaddedVal =  paddedValBefDec+"."+paddedValAftDec ;

   totPaddedVal = trimText(totPaddedVal);

   obj.value = totPaddedVal ;

   return true;
}


function checkValPresent(val){

     var iLength=val.length;
  
     if(iLength==0){

        return false ;

     }
  
     return true;

}


function checkNumber(val){

     var iLength = val.length;
          
     for(i=0;i<iLength;i++){
         if(!((val.charCodeAt(i)>=48 && val.charCodeAt(i)<=57)||(val.charAt(i)=='-'))){
			return false;
		 }
     }
     
     return true;
}




function lPad(val,n,patrn){

  var paddedString = "" ;
  for(i=0;i<n-val.length;i++){
      
      paddedString = paddedString + patrn;
      
  }

  val = paddedString + val ;
  
  return val;

}

function rPad(val,n,patrn){

  var paddedString = "" ;
  for(i=0;i<n-val.length;i++){
      
      paddedString = paddedString + patrn;
      
  }

  val =  val + paddedString  ;
  
  return val;

}

function noEnter() {
    return !(window.event && window.event.keyCode == 13);
}


   
function focusNext(objId){

  // alert("NextobjId"+objId);
   
   document.getElementById(objId).select();
   document.getElementById(objId).focus();
   
}

function onlyFocusNext(objId){

  // alert("NextobjId"+objId);
   
   document.getElementById(objId).focus();
   
}
   
   

function selfSubmit(){

   document.SELF_SUBMIT.submit();

}


function getLeaveTypeIndex(lvType){


   for(i=0;i<g_leaveArray.length;i++){


     if(lvType==g_leaveArray[i]){

         break;

     }

   }

   if(i==g_leaveArray.length){

      return -1;

   }else{

      return i;

   }


}



function checkTTAValue(obj,rownum){

   if(obj.value=="0"){

      document.getElementById("T"+rownum+"4").value = "0";
      document.getElementById("T"+rownum+"20").value = "0";

   }

   if(obj.value=="H"){

      document.getElementById("T"+rownum+"4").value  = "1"; 
      document.getElementById("T"+rownum+"20").value = "0" ; 

   }

   if(obj.value=="L"){

      document.getElementById("T"+rownum+"20").value  = "1"; 
      document.getElementById("T"+rownum+"4").value   = "0" ; 


   }

   focusNext("T"+rownum+"5");

}



function setEqOTValue(rownum){

  var eq_ot_logic_no=document.getElementById("eq_ot_logic_no").value;

  if(eq_ot_logic_no=="1"){

     eqOTLogic1(rownum);

  }

  if(eq_ot_logic_no=="2"){

     eqOTLogic2(rownum);

  }



}

function eqOTLogic1(rownum){

   var actOT = document.getElementById("T"+rownum+"12").value; 
   var d_actOT = parseFloat(actOT-0);
   var d_eqOT = (((d_actOT - 8)*2) + (8*1.5))-0;

   document.getElementById("T"+rownum+"3").value = d_eqOT;
//   alert("Logic 1"+document.getElementById("T"+rownum+"3").value);

}

function eqOTLogic2(rownum){

   var actOT = document.getElementById("T"+rownum+"12").value; 
   var d_actOT = parseFloat(actOT-0);
   var d_eqOT = (d_actOT *2)-0;

   document.getElementById("T"+rownum+"3").value = d_eqOT;
 //  alert("Logic 2"+document.getElementById("T"+rownum+"3").value);

}


function trimText(str) {
    //alert("bef trim"+str.length);
    str = str.replace(/^\s+/, '');
    for (var i = str.length - 1; i >= 0; i--) {
        if (/\S/.test(str.charAt(i))) {
            str = str.substring(0, i + 1);
            break;
        }
    }
    //alert("aft trim"+str.length);
    return str;
}


function loadImg(){

 //alert("Load");
 //document.getElementById("d1").setAttribute("style","width:10px");
 //document.getElementById("d1").setAttribute("style","bottom:50px");
 //document.getElementById("d1").setAttribute("style","left:400px");
 document.getElementById("d1").innerHTML = '<img src="load_img.gif"/>';

}

function unloadImg(){

 //alert("UnLoad");
 document.getElementById("d1").innerHTML = "&nbsp";
 document.getElementById("d1").setAttribute("style","width:0px");

}

function publishBudget(ins_upd_mkr){


var flg=confirm("BUDGET SYSTEM :\n\nPlease ensure that; \n  the last changes have been saved.\n\nTo save the changes;\n  - please press CANCEL to close this dialog box \n  - Please click on SAVE to save the edits.\n  - Please press the PUBLISH button again to Publish.");
if(flg==true){
    submitForm('PUBLISH');
}else{
  return false;
}

}

function sendToSuperior(){

   submitForm('SEND_TO_SUPERIOR');

}

function computeAll(ins_upd_mkr){

  if(chkBefSubmit(ins_upd_mkr)){
     if(submitForm('COMPUTE_ALL')){
 
    //    submitForm('SELF_SUBMIT');
     }
  }
  return true;
}


function publishSuccess(){

  alert(g_alert_hd+"Publishing done");
  return true;

}

function publishFailure(){

  alert(g_alert_hd+"Publishing Not done");
  return true;

}