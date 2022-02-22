/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function takeYear1(yr) {
    var y = yr % 100;
    y += (y < 50) ? 2000 : 1900;
    return y;
}
function takeYear2(yr) {
    var y ;
    if(yr == "08")yr = 8;
    if(yr == "09")yr = 9;
    y = (yr < 50) ? 2000 : 1900 ;
    y = parseInt(y) + parseInt(yr);
    return y;
}
function isLeapYear(year){
    actualyear = parseInt(year) + 2000;
    if(actualyear % 4 == 0) return 1;
    else return 0;
}


function isDate(obj){
    var name = obj.name ;
    var mydate = obj.value ;

    if(mydate.length != 10 && mydate.length != 11){
        alert("Invalid date entered. Date must be in dd-mon-yyyy format");
        obj.focus();
        obj.select();
        return false;
    }
    if(mydate.length == 10){
        for(var i = 0 ; i < mydate.length ; i++)
            if( (i < 1 || i > 5) && (mydate.charCodeAt(i) < 48 || mydate.charCodeAt(i) > 57 ) ){
                alert("Invalid date entered. Date must be in dd-mon-yyyy format");
                obj.focus();
                obj.select();
                return false;
            }

        if(mydate.charAt(1) != "-" || mydate.charAt(5) != "-" ){
            alert("Invalid date entered. Date must be in dd-mon-yyyy format");
            obj.focus();
            obj.select();
            return false;
        }
    }else if(mydate.length == 11){
        for(var i = 0 ; i < mydate.length ; i++)
            if( (i < 2 || i > 6) && (mydate.charCodeAt(i) < 48 || mydate.charCodeAt(i) > 57 ) ){
                alert("Invalid date entered. Date must be in dd-mon-yyyy format");
                obj.focus();
                obj.select();
                return false;
            }

        if(mydate.charAt(2) != "-" || mydate.charAt(6) != "-" ){
            alert("Invalid date entered. Date must be in dd-mon-yyyy format");
            obj.focus();
            obj.select();
            return false;
        }
    }

    arr=mydate.split("-");
    var day = arr[0];
    var month = arr[1];
    var year = takeYear1(arr[2]);

    var months=new Array('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC');
    var flag=false;
    for(i = 0 ; i < months.length ; i++)
        if(months[i]==month){
            month_indx = i;
            flag=true;
        }

    if(flag==false){
        alert("Invalid month entered.");
        obj.focus();
        obj.select();
        return false;
    }

    if(isLeapYear(year) == 1)
        days_in_month = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    else
        days_in_month = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

    if(parseInt(day,10) < 1 || parseInt(day,10) > days_in_month[parseInt(month_indx)]){
        alert("Invalid day entered. Day should be between 1 and " + days_in_month[parseInt(month_indx)]);
        obj.focus();
        obj.select();
        return false;
    }

    return true;

}

function date_compare(obj_date_1,obj_date_2,str_name_1,str_name_2,relation,obj_first_date){
    var str_date_1 = obj_date_1.value ;
    if(str_date_1.length == 10)str_date_1 = '0' + str_date_1;
    var str_date_2 = obj_date_2.value ;
    if(str_date_2.length == 10)str_date_2 = '0' + str_date_2;
    var str_day_1 ;
    var str_day_2 ;
    var str_month_1 ;
    var str_month_2 ;
    var str_year_1 ;
    var str_year_2 ;
    var int_day_1 ;
    var int_day_2 ;
    var int_month_1 ;
    var int_month_2 ;
    var int_year_1 ;
    var int_year_2 ;

    var months=new Array('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC');
    
    str_day_1 = str_date_1.substring(0,2) ;
    int_day_1 = parseInt(str_day_1,10) ;
    str_month_1 = str_date_1.substring(3,6) ;
    for(i = 0 ; i < months.length ; i++)
        if(months[i]==str_month_1){
            str_month_1 = parseInt(i,10) + 1;
            break;
        }
    int_month_1 = parseInt(str_month_1,10) ;
    str_year_1 = str_date_1.substring(7,11) ;
    int_year_1 = parseInt(str_year_1) ;

    str_day_2 = str_date_2.substring(0,2) ;
    int_day_2 = parseInt(str_day_2,10) ;
    str_month_2 = str_date_2.substring(3,6) ;
    for(i = 0 ; i < months.length ; i++)
        if(months[i]==str_month_2){
            str_month_2 = parseInt(i,10) + 1;
            break;
        }
    int_month_2 = parseInt(str_month_2,10) ;
    str_year_2 = str_date_2.substring(7,11) ;
    int_year_2 = parseInt(str_year_2) ;

    //alert(int_day_1+'/'+int_month_1+'/'+int_year_1);
    //alert(int_day_2+'/'+int_month_2+'/'+int_year_2);

    if( relation == "<=" ){
        if( int_year_1 > int_year_2 || int_year_1 == int_year_2 && int_month_1 > int_month_2 || int_year_1 == int_year_2 && int_month_1 ==
            int_month_2 && int_day_1 > int_day_2){
            alert(str_name_1 + " can not be greater than " + str_name_2) ;
            obj_first_date.value = "" ;
            obj_first_date.focus() ;
            return false ;
        }
    }else if(relation == "<"){
        if(int_year_1 > int_year_2 || int_year_1 == int_year_2 && int_month_1 > int_month_2 || int_year_1 == int_year_2 && int_month_1 ==
            int_month_2 && int_day_1 > int_day_2 || int_year_1 == int_year_2 && int_month_1 == int_month_2 && int_day_1 == int_day_2){
            alert(str_name_1 + " must be less than " + str_name_2) ;
            obj_first_date.value = "" ;
            obj_first_date.focus() ;
            return false ;
        }
    }
    return true ;
}

function computeDaysDiff(day1,month1,year1,day2,month2,year2){
    if(isLeapYear(year1) == 1)
        days_in_month1 = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    else
        days_in_month1 = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    if(isLeapYear(year2) == 1)
        days_in_month2 = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    else
        days_in_month2 = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var dateDifference = 0 ;

    if(parseInt(year1) == parseInt(year2) && parseInt(month1,10) == parseInt(month2,10) && parseInt(day1,10) == parseInt(day2,10))
        dateDifference = 1 ;
    else if( parseInt(year1) == parseInt(year2) && parseInt(month1,10) == parseInt(month2,10) )
        dateDifference = parseInt(day2,10) - parseInt(day1,10) + 1 ;
    else if(parseInt(year1) == parseInt(year2)){
        for(var i = parseInt(month1,10) ; i <= parseInt(month2,10) ; i++){
            if(i == parseInt(month1,10))
                dateDifference = days_in_month1[i-1] - parseInt(day1,10) + 1 ;
            else if(i == parseInt(month2,10))
                dateDifference = dateDifference + parseInt(day2,10) ;
            else
                dateDifference = dateDifference + days_in_month1[i-1] ;
        }
    }
    else {
        //alert("khgkqh");
        for(i = parseInt(year1) ; i <= parseInt(year2) ; i++){
            if(i == parseInt(year1)){
                for(var j = parseInt(month1,10) ; j <= 12 ; j++){
                    if(j == parseInt(month1,10))
                        dateDifference = days_in_month1[j-1] - parseInt(day1,10) + 1 ;
                    else
                        dateDifference = dateDifference + days_in_month1[j - 1] ;
                }
            }
            else if(i == parseInt(year2)){
                for(j = 1 ; j <= parseInt(month2,10) ; j++){
                    if(j == parseInt(month2,10))
                        dateDifference = dateDifference + parseInt(day2,10) ;
                    else
                        dateDifference = dateDifference + days_in_month2[j-1] ;
                }
            }
            else{
                if(isLeapYear(i) == 1)dateDifference += 366 ;
                else dateDifference += 365 ;
            }
        }
    }
    //alert(dateDifference);

    return dateDifference ;
}


function isAmt(obj){
    var amount = obj.value ;
    var name = obj.name ;

    if(amount == "."){
        alert("Please enter numeric value") ;
        obj.focus() ;
        obj.select() ;
        return false ;
    }
    var myRegExp = /[^\d\.]/g ;
    var i = amount.search(myRegExp) ;
    if(i != -1){
        alert("Please enter numeric value") ;
        obj.focus() ;
        obj.select() ;
        return false ;
    }
    myRegExp = /\./g ;
    var array = amount.match(myRegExp) ;
    if( array != null && array.length > 1){
        alert("Please enter numeric value") ;
        obj.focus() ;
        obj.select() ;
        return false ;
    }
    var float_amount = parseFloat(amount) ;

    if( float_amount > 9999999999.99){
        alert("Amount can not be larger than 999999999.99") ;
        obj.focus() ;
        obj.select() ;
        return false ;
    }

    obj.value = float_amount.toFixed(2) ;

    return true ;
}

function isInt(obj){
    val = obj.value;
    for(i = 0 ; i < val.length ; i++){
        if(val.charCodeAt(i) < 48 || val.charCodeAt(i) > 57){
            alert("Please enter Integer value") ;
            obj.focus() ;
            obj.select() ;
            return false ;
        }
    }
    return true;
}

function menuDisplay(){

    sLoginEmpKaizenMkr = f1.sLoginEmpKaizenMkr.value;
    sStg = f1.sStg.value;
    //sOrdGenStnCd = f1.sOrdGenStnCd.value;
    //alert(f1.bBlEntryPermit.value);

    //if(sOrdGenStnCd == '002' || sOrdGenStnCd == '016' || sOrdGenStnCd == '042'){
    if(f1.sEntryPermit.value == 'true'){
        window.parent.frames[1].document.getElementById("liNomEntry").style.visibility = 'visible';
    }else if(f1.sEntryPermit.value == 'false'){
        window.parent.frames[1].document.getElementById("liNomEntry").style.visibility = 'hidden';
    }


    if(sLoginEmpKaizenMkr == '4'){
        window.parent.frames[1].document.getElementById("liPrntNom").style.visibility = 'visible';
    }else{
        window.parent.frames[1].document.getElementById("liPrntNom").style.visibility = 'hidden';
    }

    //}

    return true;
}
