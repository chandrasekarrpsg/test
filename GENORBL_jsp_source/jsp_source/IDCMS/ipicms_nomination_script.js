/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function lock_controls(stat) {
    for(i=0; i<document.forms[0].elements.length;i++)
    {
        var el=document.forms[0].elements[i];
        if (el.type=="text"||el.type=="textarea"||el.type=="password")
            el.readOnly=stat;
        else if(el.type=="select-one"||el.type=="checkbox"||el.type=="radio")
            el.disabled=stat;
    }
    edit_btn.value=(stat==1?"Edit":"Save");

//document.forms[0].del_btn.value=(stat==1?"Delete":"Cancel");
}

function lock_controls_sendBack(stat) {
    for(i=0; i<document.forms[1].elements.length;i++)
    {
        var el=document.forms[1].elements[i];
        if (el.type=="text"||el.type=="textarea"||el.type=="password")
            el.readOnly=stat;
        else if(el.type=="select-one"||el.type=="checkbox"||el.type=="radio")
            el.disabled=stat;
    }
}

function lock_controls_cancel(stat) {
    for(i=0; i<document.forms[2].elements.length;i++)
    {
        var el=document.forms[2].elements[i];
        if (el.type=="text"||el.type=="textarea"||el.type=="password")
            el.readOnly=stat;
        else if(el.type=="select-one"||el.type=="checkbox"||el.type=="radio")
            el.disabled=stat;
    }
}



function edit_onclick(url){

    if(edit_btn.value=="Edit"){
        lock_controls(0);
        someFldReadOnly();
    }else
    if(validate_form()==1){
        f1.sCallNm.value="insUpdIpicms";
        submit_form(url);
    }
}

function submit_form(url){

    document.forms[0].method="POST";
    //document.forms[0].action=url;
    document.forms[0].submit();
}

function someFldReadOnly(){


    
    /*document.forms[0].sBudgHead.readOnly = true;
    document.forms[0].sBudgHeadDesc.readOnly = true;
    document.forms[0].sCapexSchmeNo.readOnly = true;
    document.forms[0].sCapexSchmeDesc.readOnly = true;
    document.forms[0].sBudgHead.readOnly = true;
    document.forms[0].sVndrNm.readOnly = true;
    document.forms[0].sVndrNm_1.readOnly = true;
    document.forms[0].sVndrNm_2.readOnly = true;

    if(f1.sOrdId.value != "" && f1.sEnvExp.checked == 0 && f1.sSafetyExp.checked == 0 && f1.sHealthExp.checked == 0){
        f1.sNoneOfThese.checked = 1;
        f1.sEnvExp.disabled = true ;
        f1.sSafetyExp.disabled = true ;
        f1.sHealthExp.disabled = true ;
    }*/

    document.forms[0].sContestMnthYr.readOnly = true;

    return true;
}



function back() {
    window.history.back ();
}
function oevfx (x) {
    var y = "s"+x;
    var sy = document.getElementById (y);
    if (sy.value == "o") {

        animatedcollapse.show('divNm_' + x + '1');
        //alert(f1.sSaluteCd_1.selectedIndex);
        document.getElementById("sSaluteCd_"+x).value = ' ';
        animatedcollapse.show('divNm_' + x + '2');
        document.getElementById("divNm_" + x + '2').innerHTML = "";
        animatedcollapse.hide('divNm_' + x + '3');
        document.getElementById("sVndrNm_"+x).value = '';
        animatedcollapse.hide('divCd_' + x + '1');
        document.getElementById("divCd_" + x + '1').innerHTML = "";
        animatedcollapse.show('divCd_' + x + '2');
        document.getElementById("sCd_"+x).value = '';
        animatedcollapse.show('divDesg_' + x + '1');
        document.getElementById("divDesg_"+x + '1').innerHTML = "Officer";
        animatedcollapse.hide('divDesg_' + x + '2');      
        document.getElementById("sDesgCd_"+x).value = '';
        document.getElementById("sDesgDesc_"+x).value = '';
        animatedcollapse.hide('divDesg_' + x + '3');
        document.getElementById("sVndrDesgCd_"+x).value = ' ';
        animatedcollapse.show('divDept_' + x + '1');
        document.getElementById("divDept_"+x + '1').innerHTML="";
        animatedcollapse.hide('divDept_' + x + '2');
        document.getElementById("sVndrCoNm_"+x).value=""
        animatedcollapse.hide('divDept_' + x + '3');
        document.getElementById("sDeptCd_"+x).value = ' ';
        
        document.getElementById("sVndrCd_" + x).value = "";
        
    }
    else  if (sy.value == "e") {

        animatedcollapse.show('divNm_' + x + '1');
        document.getElementById("sSaluteCd_"+x).value = ' ';
        animatedcollapse.show('divNm_' + x + '2');
        document.getElementById("divNm_" + x + '2').innerHTML = "";
        animatedcollapse.hide('divNm_' + x + '3');
        document.getElementById("sVndrNm_"+x).value = '';
        animatedcollapse.hide('divCd_' + x + '1');
        document.getElementById("divCd_" + x + '1').innerHTML = "";
        animatedcollapse.show('divCd_' + x + '2');
        document.getElementById("sCd_"+x).value = '';
        animatedcollapse.hide('divDesg_' + x + '1');
        document.getElementById("divDesg_"+x + '1').innerHTML = "";
        animatedcollapse.show('divDesg_' + x + '2');
        document.getElementById("sDesgDesc_"+x).value = '';
        document.getElementById("sDesgCd_"+x).value = '';
        animatedcollapse.hide('divDesg_' + x + '3');
        document.getElementById("sVndrDesgCd_"+x).value = ' ';
        animatedcollapse.hide('divDept_' + x + '1');
        document.getElementById("divDept_"+x + '1').innerHTML="";
        animatedcollapse.hide('divDept_' + x + '2');
        document.getElementById("sVndrCoNm_"+x).value=""
        animatedcollapse.show('divDept_' + x + '3');
        document.getElementById("sDeptCd_"+x).value = ' ';

        document.getElementById("sVndrCd_" + x).value = "";

        
    } else if (sy.value == "v") {
        /*if (window.XMLHttpRequest) {
            xmlhttp = new XMLHttpRequest ();
        } else {
            xmlhttp = new ActiveXObject ("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            var ready = xmlhttp.readyState;
            if (ready == 4) { //response ready (state 4)
                document.getElementById("dc"+y).innerHTML = xmlhttp.responseText;
                document.getElementById("ds"+y).innerHTML = "vendor";
            } else {
                
            }
        }
        xmlhttp.open ("POST", "vendlist.jsp?r="+x, true);
        xmlhttp.send ();*/

        animatedcollapse.show('divNm_' + x + '1');
        document.getElementById("sSaluteCd_"+x).value = ' ';
        animatedcollapse.hide('divNm_' + x + '2');
        document.getElementById("divNm_" + x + '2').innerHTML = "";
        animatedcollapse.show('divNm_' + x + '3');
        document.getElementById("sVndrNm_"+x).value = '';
        animatedcollapse.show('divCd_' + x + '1');
        document.getElementById("divCd_" + x + '1').innerHTML = "";
        animatedcollapse.hide('divCd_' + x + '2');
        document.getElementById("sCd_"+x).value = '';
        animatedcollapse.hide('divDesg_' + x + '1');
        document.getElementById("divDesg_"+x + '1').innerHTML = "";
        animatedcollapse.hide('divDesg_' + x + '2');
        document.getElementById("sDesgCd_"+x).value = '';
        document.getElementById("sDesgDesc_"+x).value = '';
        animatedcollapse.show('divDesg_' + x + '3');
        document.getElementById("sVndrDesgCd_"+x).value = ' ';
        animatedcollapse.hide('divDept_' + x + '1');
        document.getElementById("divDept_"+x + '1').innerHTML="";
        animatedcollapse.show('divDept_' + x + '2');
        document.getElementById("sVndrCoNm_"+x).value=""
        animatedcollapse.hide('divDept_' + x + '3');
        document.getElementById("sDeptCd_"+x).value = ' ';

        document.getElementById("sVndrCd_" + x).value = "";

    //document.getElementById("nm"+y).innerHTML = "<input type=\"text\" name=\"" + "name" + x + "\" size=\"15\"/>";
    //document.getElementById("dc"+y).innerHTML = "<input type=\"text\" name=\"" + "vendor" + x + "\" size=\"15\"/>";
    }else{    
        animatedcollapse.hide('divNm_' + x + '1');
        document.getElementById("sSaluteCd_"+x).value = ' ';
        animatedcollapse.show('divNm_' + x + '2');
        document.getElementById("divNm_" + x + '2').innerHTML = "";
        animatedcollapse.hide('divNm_' + x + '3');
        document.getElementById("sVndrNm_"+x).value = '';
        animatedcollapse.show('divCd_' + x + '1');
        document.getElementById("divCd_" + x + '1').innerHTML = "";
        animatedcollapse.hide('divCd_' + x + '2');
        document.getElementById("sCd_"+x).value = '';
        animatedcollapse.show('divDesg_' + x + '1');
        document.getElementById("divDesg_"+x + '1').innerHTML = "";
        animatedcollapse.hide('divDesg_' + x + '2');
        document.getElementById("sDesgCd_"+x).value = '';
        document.getElementById("sDesgDesc_"+x).value = '';
        animatedcollapse.hide('divDesg_' + x + '3');
        document.getElementById("sVndrDesgCd_"+x).value = ' ';
        animatedcollapse.show('divDept_' + x + '1');
        document.getElementById("divDept_"+x + '1').innerHTML="";
        animatedcollapse.hide('divDept_' + x + '2');
        document.getElementById("sVndrCoNm_"+x).value=""
        animatedcollapse.hide('divDept_' + x + '3');
        document.getElementById("sDeptCd_"+x).value = ' ';

        document.getElementById("sVndrCd_" + x).value = "";
    }
}
function showNames(x, y) {
    if (y=="")  return;
    var a = document.getElementById("s"+x).value;
    if (a=="") {
        //document.getElementById("nms"+x).innerHTML = "";
        //document.getElementById("dss"+x).innerHTML = "";
        //document.getElementById("dcs"+x).innerHTML = "";
        alert ("msg from IPICMS\nselect contestant type for entry no." + x);
        return;
    }

    if(a == 'o'){

        var xmldiffrnciator = Math.floor(Math.random()*100000);
        var parameter = "sCallNm=getOffDtls" ;
        parameter += "&sOffCd="+y;
        parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
        var url = "IpicmsProcessServlet?" + parameter ;
        //alert(url);
        var myval = new Object();
        var offDtlXML ;
        try{
            offDtlXML = new ActiveXObject("Msxml2.XMLHTTP");
        }catch(e){
            try{
                offDtlXML = new ActiveXObject("Microsoft.XMLHTTP");
            }catch(e){
                offDtlXML = new XMLHttpRequest();
            }
        }
        offDtlXML.open('POST',url,true);
        offDtlXML.send('');
        offDtlXML.onreadystatechange = function(){
            if(offDtlXML.readyState == 4){
                //alert(offDtlXML.responseText);
                myval = offDtlXML.responseXML.getElementsByTagName("OFF");
                offDtls = myval[0].childNodes[0].nodeValue.split("|");

                document.getElementById("divNm_" + x + '2').innerHTML = offDtls[0] ;
                //document.getElementById("sVndrNm_"+x).value = '';
                //document.getElementById("divCd_" + x + '1').innerHTML = "";
                document.getElementById("divDesg_"+x + '1').innerHTML = offDtls[2];
                document.getElementById("sDesgCd_"+x).value = offDtls[1];
                document.getElementById("sDesgDesc_"+x).value = offDtls[2];
                document.getElementById("divDept_"+x + '1').innerHTML=offDtls[4];
                //document.getElementById("sVndrCoNm_"+x).value=""
                document.getElementById("sDeptCd_"+x).value = offDtls[3];
            //document.getElementById("sVndrCd_" + x).value = "";

            }
        }
    }else if(a == 'e'){

        var xmldiffrnciator = Math.floor(Math.random()*100000);
        var parameter = "sCallNm=getEmpDtls" ;
        parameter += "&sEmpCd="+y;
        parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
        var url = "IpicmsProcessServlet?" + parameter ;
        //alert(url);
        var myval = new Object();
        var empDtlXML ;
        try{
            empDtlXML = new ActiveXObject("Msxml2.XMLHTTP");
        }catch(e){
            try{
                empDtlXML = new ActiveXObject("Microsoft.XMLHTTP");
            }catch(e){
                empDtlXML = new XMLHttpRequest();
            }
        }
        empDtlXML.open('POST',url,true);
        empDtlXML.send('');
        empDtlXML.onreadystatechange = function(){
            if(empDtlXML.readyState == 4){
                //alert(offDtlXML.responseText);
                myval = empDtlXML.responseXML.getElementsByTagName("EMP");
                empDtls = myval[0].childNodes[0].nodeValue;

                document.getElementById("divNm_" + x + '2').innerHTML = empDtls;
                //document.getElementById("sVndrNm_"+x).value = '';
                //document.getElementById("divCd_" + x + '1').innerHTML = "";
                document.getElementById("divDesg_"+x + '1').innerHTML = "Employee";
            //document.getElementById("sDesgCd_"+x).value = "";
            //document.getElementById("divDept_"+x + '1').innerHTML="";
            //document.getElementById("sVndrCoNm_"+x).value=""
            //document.getElementById("sDept_"+x).value = "";
            //document.getElementById("sVndrCd_" + x).value = "";

            }
        }

    }
/*

    url="ipicms_getname.jsp?t="+a+"&c=" + y;
    alert(url);
    
    if(a == 'o')xmlhttp.open ("POST", "IpicmsProcessServlet?sCallNm=getOffDtls&sOffCd="+ y, true);
    xmlhttp.send ();
    xmlhttp.onreadystatechange = function() {
        var ready = xmlhttp.readyState;
        if (ready == 4) { //response ready (state 4)
            alert(xmlhttp.responseText);
            if (!(a=="v")) {
                if(a == 'o'){

                }


                document.getElementById("nms"+x).innerHTML = xmlhttp.responseText;
                document.getElementById("dss"+x).innerHTML = (a=="o")?"officer":"employee";
                document.getElementById("dcs"+x).innerHTML = document.forms["n_form"]["department"].value;
            } else {
                document.getElementById("dss"+x).innerHTML = "vendor";
            }
        }
    }*/
    
}

function checkDate (x) {
    //if empty string
    if (x == "") return false;
    
    //if not properly formatted
    if (x.indexOf("/") == -1) return false;
    var date = x.slice (0,x.indexOf("/"));
    var rest = x.slice (x.indexOf("/")+1, x.length);
    var month = rest.slice(0,rest.indexOf("/"));
    var year = rest.slice (rest.indexOf("/")+1, rest.length);
    var exp = "0123456789";
    var len = date.length;
    if (len > 2) return false; //date cannot be more than 2 digit
    len = month.length;
    if (len > 2) return false;
    len = year.length;
    if (len  != 4) return false;
    //if date, month, year has non neumeric char
    var dateval = 0;
    for (var i=0; i<date.length; i++) {
        if (exp.indexOf(date.slice(i,(i+1))) == -1) return false;
        else {
            dateval += Math.pow(10,(date.length-i-1)) * exp.indexOf(date.slice(i,(i+1)));
        }
    }
    var monthval = 0;
    for (i=0; i<month.length; i++) {
        if (exp.indexOf(month.slice(i,(i+1))) == -1) return false;
        else {
            monthval += Math.pow(10,(month.length-i-1)) * exp.indexOf(month.slice(i,(i+1)));
        }
    }
    var yearval = 0;
    for (i=0; i<4; i++) {
        if (exp.indexOf(year.slice(i,(i+1))) == -1) return false;
        else {
            yearval += Math.pow(10,(year.length-i-1)) * exp.indexOf(year.slice(i,(i+1)));
        }
    }
    var maxdate = 0;
    if (monthval!=2 && monthval!=4 && monthval!=6 && monthval!=9 && monthval!=11)    maxdate = 31;
    else if (monthval !=2)  maxdate = 30;
    else if (monthval == 2){  //if february
        if (yearval%400 == 0) maxdate=29;
        else if (yearval%4==0 && yearval%100!=0) maxdate=29;
        else maxdate = 28;
    }
    if (dateval>maxdate) return false;
    if (monthval>12) return false;
    if (yearval<1900 || yearval>3000) {
        alert ("msg from IPICMS\nabsurd year:" + year);
        return false;
    }
    
    //if all ok
    return true;
}

function validate_form() {
    return true;
    // check for contestant entry errors
    var i;
    for (i=2; i<6; i++) {
        var x = document.forms["n_form"]["oev"+i].value;
        if (x == "") {
            break
        };
        x = document.getElementById("nms"+i);
        var y = document.getElementById("dcs"+i);
        var z = document.getElementById("dss"+i);
        if (x.innerHTML == "" || y.innerHTML == "" || z.innerHTML == "") {
            alert ("msg from IPICMS\ncode number of contestant entry no." + i + " not present in the system");
            return false;
        }
    }
    var q = confirm ("registering " + (i-1) + " contestant(s). are you sure?");
    if (q == false) return q;
    
    //check for general entry errors
    if (document.forms["n_form"]["title"].value == "") {
        var q1 = confirm ("leave \"title\" blank?");
        if (q1 == false) return q1;
    }
    if (document.forms["n_form"]["analysis"].value == "") {
        var q2 = confirm ("leave \"problem/initial status/analysis\" blank?");
        if (q2 == false) return q3;
    }
    if (document.forms["n_form"]["action"].value == "") {
        var q3 = confirm ("leave \"action\" blank?");
        if (q3 == false) return q3;
    }
    if (document.forms["n_form"]["result"].value == "") {
        var q4 = confirm ("leave \"results\" blank?");
        if (q4 == false) return q4;
    }
    if (document.forms["n_form"]["gain"].value == "") {
        var q5 = confirm ("leave \"gain/cost savings\" blank?");
        if (q5 == false) return q5;
    }
    
    //check for start and end date
    var d1 = checkDate (document.forms["n_form"]["startdate"].value);
    if (d1 == false) {
        alert ("msg from IPICMS\nstart date (DD/MM/YYYY) not valid. why don't you use the calender?");
        return d1;
    }
    var d2 = checkDate (document.forms["n_form"]["enddate"].value);
    if (d2 == false) {
        alert ("msg from IPICMS\nend date (DD/MM/YYYY) not valid. why don't you use the calender?");
        return d2;
    }
    
    //check for contest month and year
    var mm = document.forms["n_form"]["contestmonth"].value;
    var yy = document.forms["n_form"]["contestyear"].value;
    if (mm == "XX") {
        alert ("msg from IPICMS\nselect contest month");
        return false;
    }
    var y1 = checkDate ("1/1/" + yy); //tricky approach
    if (y1 == false) {
        alert ("msg from IPICMS\ncontest year not valid");
        return y1;
    }
    
    //all checks passed
    return true;
}

function setvcode (x, y) {
    document.forms["n_form"]["code"+x].value = y;
}

function getVndrDtls(nm){

    x = nm.substring(10);

    //if(document.forms[1].edit_btn.value == 'Edit')return false;
    var url="vndrAddr_3.jsp?sVndrNmLike=";
    if(nm == 'sVndrNm'){
    //window.f1.sVndrNm.value="Please wait.........."
    }else if(nm == 'sVndrNm_1'){
    //window.f1.sVndrNm_1.value="Please wait.........."
    }else if(nm == 'sVndrNm_2'){
    //window.f1.sVndrNm_2.value="Please wait.........."
    }
    window.status="Opening Vendor Details Menu !. Please wait....................."
    var o=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");
    window.status=" "

    var frstParam = o.frstParam;
    var secondParam = o.secondParam ;
    var thirdParam = o.thirdParam ;

    //alert(frstParam+"-"+secondParam);

    while(frstParam=="recall"){

        url="vndrAddr_3.jsp?sVndrNmLike="+secondParam;
        o=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");

        frstParam = o.frstParam;
        secondParam = o.secondParam ;
        thirdParam = o.thirdParam ;

    }

    if(frstParam != "close"){
        /*if(nm == 'sVndrNm_1'){
            //iFrstTime = 1;
            //document.f1.sVndrCd.value=frstParam
            document.getElementById("divCd_"+x+'1').innerHTML = frstParam;
            document.f1.sVndrNm_1.value=secondParam
        //document.f1.sWageLiab.value=thirdParam
        //alert(document.f1.sWageLiab.value);
        //chkVndrCdNm();
        //getVndrDocDtl(frstParam);
        }else if(nm == 'sVndrNm_2'){
            document.getElementById("divCd_"+x+'1').innerHTML = frstParam;
            document.f1.sVndrNm_2.value=secondParam
        }else if(nm == 'sVndrNm_3'){
            document.getElementById("divCd_"+x+'1').innerHTML = frstParam;
            document.f1.sVndrNm_3.value=secondParam
        }else if(nm == 'sVndrNm_4'){
            document.getElementById("divCd_"+x+'1').innerHTML = frstParam;
            document.f1.sVndrNm_4.value=secondParam
        }else if(nm == 'sVndrNm_5'){
            document.getElementById("divCd_"+x+'1').innerHTML = frstParam;
            document.f1.sVndrNm_5.value=secondParam
        }*/
    
    
        
        //document.getElementById("divNm_" + x + '1').innerHTML = "";
        document.getElementById("divCd_" + x + '1').innerHTML = frstParam;
        //document.getElementById("sCd_" + x).value = "";
        document.getElementById("divDesg_"+x + '1').innerHTML = "Vendor";
        //document.getElementById("sDesgCd_"+x).value = "";
        //document.getElementById("divDept_"+x + '1').innerHTML="";
        document.getElementById("sVndrCoNm_"+x).value=secondParam;
        //document.getElementById("sDeptCd_"+x).value = "";
        document.getElementById("sVndrCd_" + x).value = frstParam;
        

    }
}

function butnDisplay(){
    sLoginEmpKaizenMkr = f1.sLoginEmpKaizenMkr.value;
    sStg = f1.sStg.value;

    if(f1.sEditPermit.value == 'true'){
        if((sLoginEmpKaizenMkr == '1' || sLoginEmpKaizenMkr == '2' || sLoginEmpKaizenMkr == '3' || sLoginEmpKaizenMkr == '4') && sStg == ''){

            animatedcollapse.show('divButnEdit');
            //animatedcollapse.hide('divButnSentBack');
            animatedcollapse.hide('divButnConfirm');
        //animatedcollapse.hide('divButnReject');

        //edit_onclick();
        }else if(sLoginEmpKaizenMkr == '1' && sStg == '1'){
            animatedcollapse.show('divButnEdit');
            //animatedcollapse.hide('divButnSentBack');
            animatedcollapse.show('divButnConfirm');
        //animatedcollapse.hide('divButnReject');

        }else if(sLoginEmpKaizenMkr == '2' && sStg == '2'){
            animatedcollapse.show('divButnEdit');
            //animatedcollapse.show('divButnSentBack');
            animatedcollapse.show('divButnConfirm');
        //animatedcollapse.show('divReject');
        //animatedcollapse.hide('divButnReject');
        }else if(sLoginEmpKaizenMkr == '3' && sStg == '3'){
            animatedcollapse.show('divButnEdit');
            //animatedcollapse.show('divButnSentBack');
            animatedcollapse.show('divButnConfirm');
        //animatedcollapse.show('divReject');
        //animatedcollapse.hide('divButnReject');
        }else if(sLoginEmpKaizenMkr == '4' && sStg == '5'){
            animatedcollapse.show('divButnEdit');
            //animatedcollapse.show('divButnSentBack');

            if(f1.sCatgTypTmp.value != ''){
                animatedcollapse.show('divButnConfirm');
            }else{
                animatedcollapse.hide('divButnConfirm');
            }

        //animatedcollapse.show('divReject');
        //animatedcollapse.hide('divButnReject');
        }else{
            animatedcollapse.hide('divButnEdit');
            //animatedcollapse.hide('divButnSentBack');
            animatedcollapse.hide('divButnConfirm');
        //animatedcollapse.hide('divReject');
        //animatedcollapse.hide('divButnReject');
        }
    }else{
        animatedcollapse.hide('divButnEdit');
        //animatedcollapse.hide('divButnSentBack');
        animatedcollapse.hide('divButnConfirm');
    //animatedcollapse.hide('divReject');
    //animatedcollapse.hide('divButnReject');
    }

    //Send Back Block



    if(f1.sLoginEmpKaizenMkr.value == '1' && f1.sStg.value == '1' && f2.sSendBackMkr.value == 'Y'){
        animatedcollapse.show('divSendBack');
        lock_controls_sendBack(1);
        animatedcollapse.hide('divButnSendBack');
    }else if(f1.sLoginEmpKaizenMkr.value == '2' && f1.sStg.value == '2'){

        if(f1.sEditPermit.value == 'false'){
            animatedcollapse.show('divSendBack');
            lock_controls_sendBack(1);
            animatedcollapse.hide('divButnSendBack');
        }else if(f2.sSendBackMkr.value == 'Y'){
            animatedcollapse.show('divSendBack');
            animatedcollapse.show('divButnSendBack');
        }else if(f2.sSendBackMkr.value == 'N'){
            animatedcollapse.show('divSendBack');
            animatedcollapse.hide('divButnSendBack');
        }

    }else if(f1.sLoginEmpKaizenMkr.value == '3' && f1.sStg.value == '3'){
        if(f1.sEditPermit.value == 'false'){
            animatedcollapse.show('divSendBack');
            lock_controls_sendBack(1);
            animatedcollapse.hide('divButnSendBack');
        }else if(f2.sSendBackMkr.value == 'Y'){
            animatedcollapse.show('divSendBack');
            animatedcollapse.show('divButnSendBack');
        }else if(f2.sSendBackMkr.value == 'N'){
            animatedcollapse.show('divSendBack');
            animatedcollapse.hide('divButnSendBack');
        }
    }else if(f1.sLoginEmpKaizenMkr.value == '4' && f1.sStg.value == '5'){
        if(f1.sEditPermit.value == 'false'){
            animatedcollapse.show('divSendBack');
            lock_controls_sendBack(1);
            animatedcollapse.hide('divButnSendBack');
        }else if(f2.sSendBackMkr.value == 'Y'){
            animatedcollapse.show('divSendBack');
            animatedcollapse.show('divButnSendBack');
        }else if(f2.sSendBackMkr.value == 'N'){
            animatedcollapse.show('divSendBack');
            animatedcollapse.hide('divButnSendBack');
        }
    }else{
        animatedcollapse.hide('divSendBack');
        animatedcollapse.hide('divButnSendBack');
    }





    //Send Back Block


    if(f1.sCancelPermit.value=='true'){
        animatedcollapse.show('divCancel');
        animatedcollapse.hide('divButnCancel');
    }else{
        animatedcollapse.hide('divCancel');
        animatedcollapse.hide('divButnCancel');
    }

    return true;
}


function chkSStDt(){
    if(f1.sStDt.value == ''){
        alert('Start Date field can not be left blank !');
        f1.sStDt.focus();
        f1.sStDt.select();
        return false;
    }
    if(!isDate(f1.sStDt))return false;

    if(date_compare(f1.sStDt,f1.sSysDt,'Start Date','System Date','<=',f1.sStDt)){}
    else return false;

    return true;
}

function chkSEndDt(){
    if(f1.sEndDt.value == ''){
        alert('Start Date field can not be left blank !');
        f1.sEndDt.focus();
        f1.sEndDt.select();
        return false;
    }

    if(!isDate(f1.sEndDt))return false;

    if(date_compare(f1.sEndDt,f1.sSysDt,'End Date','System Date','<=',f1.sEndDt)){}
    else return false;

    return true;
}

function chkSStDtEndDt(){


    if(date_compare(f1.sStDt,f1.sEndDt,'Start Date','End Date','<=',f1.sStDt)){}
    else return false;


    return true;
}

function chkSKaizenForDeptCd(){

    if(f1.sKaizenForDeptCd.value == ''){
        alert('Pl. Select a Department !');
        f1.sKaizenForDeptCd.focus();
        return false;
    }

    return true;
}

function chkSContestMnthYr(){

    if(f1.sContestMnthYr.value == ''){
        alert('Contest For Month/Year can not be left blank !');
        f1.sContestMnthYr.focus();
        return false;
    }

    return true;
}


function validate_form() {

    if(chkSKaizenForDeptCd() && chkSStDt() && chkSEndDt() && chkSStDtEndDt() && chkSContestMnthYr()){
    }else{
        return false;
    }
    return true;
}