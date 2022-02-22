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
#Slideshow1 img {position:absolute; left:15px;top:77px; width:150px;}
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

if (n != 100)

{
   document.getElementById("hd1").innerHTML=headArr[n];
   document.getElementById("abouthd").innerHTML=descArr[n];
   document.getElementById("desc1").innerHTML=desc1Arr[n];

   var empcd = document.getElementById("empcd").value ;
   var empfnm = document.getElementById("empfnm").value ;
   var emplnm = document.getElementById("emplnm").value ;
   var genstndesc = document.getElementById("genstndesc").value ;
   var genstncode = document.getElementById("genstncode").value ;
   var deptcode = document.getElementById("deptcode").value ;
   var deptdesc = document.getElementById("deptdesc").value ;
   var emplevel = document.getElementById("emplevel").value ;
   var genshtdesc = document.getElementById("genshtdesc").value ;
   var empdesig = document.getElementById("empdesig").value ;
   var usertype = document.getElementById("usertype").value ;
   var username = document.getElementById("username").value ;
   var adminmkr = document.getElementById("adminmkr").value ;
   var kaizenmkr = document.getElementById("kaizenmkr").value ;

   var url = null ;
   var param = null ;
   var ops_tp = null ;
   var oldgenstncode = null ;
   var oldgenstndesc = null ;

       param = 'empcd='+empcd+'&empfnm='+empfnm+'&emplnm='+emplnm+'&genstndesc='+genstndesc+'&genstncode='+genstncode+
               '&deptcode='+deptcode+'&deptdesc='+deptdesc+'&emplevel='+usertype+'&genshtdesc='+genshtdesc+'&empdesig='+empdesig+
               '&usertype='+usertype+'&username='+username+'&adminmkr='+adminmkr+'&kaizenmkr='+kaizenmkr+'&olddeptdesc='+deptdesc+
               '&ops_type=0&oldgenstncode='+genstncode+'&oldgenstndesc='+genstndesc ;



   if ( headArr[n] == 'DEFECT MANAGEMENT' ) {
       if(deptdesc=='MMD'||deptdesc=='FMD'||deptdesc=='FAO'||deptdesc=='CTM')
       {
       var newDescval=showModalDialog("deft_interface.jsp?dept_desc="+deptdesc,0,"dialogWidth:450px;dialogHeight:300px");
       
       if(newDescval==null||newDescval=='undefined'||newDescval=='')
       {
         alert('YOU MUST HAVE TO SELECT AN OPTION FROM DROP DOWN');
       }
       else
       {

       if(newDescval=='1'||newDescval=='2')
       {
       ops_tp = newDescval; 
       newDescval = deptdesc; 
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }
       else
       if(newDescval=='016'||newDescval=='014'||newDescval=='002')
       {
         oldgenstndesc = genstndesc;
         if(newDescval=='016')
          {
            genstndesc = 'BUDGE BUDGE GENERATING STATION';
          }
         if(newDescval=='014')
          {
            genstndesc = 'TITAGARH GENERATING STATION';
          }
         if(newDescval=='002')
          {
            genstndesc = 'SOUTHERN GENERATING STATION';
          }

       ops_tp = '0';
       oldgenstncode = genstncode;
       genstncode = newDescval; 
       newDescval= deptdesc;
       }
       else
       {
       ops_tp = '0';
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }


   //  alert(ops_tp+'  DESC   '+newDescval+' OLDSTN  '+oldgenstncode+' NEWSTN   '+genstncode);

       param1 = 'empcd='+empcd+'&empfnm='+empfnm+'&emplnm='+emplnm+'&genstndesc='+genstndesc+'&genstncode='+genstncode+
               '&deptcode='+deptcode+'&deptdesc='+newDescval+'&emplevel='+usertype+'&genshtdesc='+genshtdesc+'&empdesig='+empdesig+
               '&usertype='+usertype+'&username='+username+'&adminmkr='+adminmkr+'&kaizenmkr='+kaizenmkr+'&olddeptdesc='+deptdesc+
               '&ops_type='+ops_tp+'&oldgenstncode='+oldgenstncode+'&oldgenstndesc='+oldgenstndesc ;

       param1 = param1 + '&prefix=D' ;
       url = 'http://itweb:54844/gendefm/defm_menu.jsp?' + param1 ;
       window.open(url,'DEFM','Fullscreen=YES, Scrollbars=NO') ;
       window.open("close.html","_self");   
       }

       }
       else
       {
       param = param + '&prefix=D' ;
       url = 'http://itweb:54844/gendefm/defm_menu.jsp?' + param ;
       window.open(url,'DEFM','Fullscreen=YES, Scrollbars=NO') ;
       window.open("close.html","_self");
       }
   }
   else if ( headArr[n] == 'INTERNAL PTW MANAGEMENT' ){


       if(deptdesc=='MMD'||deptdesc=='FMD'||deptdesc=='CTM')
       {
       var newDescval_i=showModalDialog("deft_internal_interface.jsp?dept_desc="+deptdesc,0,"dialogWidth:450px;dialogHeight:300px");
       if(newDescval_i==null||newDescval_i=='undefined'||newDescval_i=='')
       {
         alert('YOU MUST HAVE TO SELECT AN OPTION FROM DROP DOWN');
       }
       else
       {


       if(newDescval_i=='1'||newDescval_i=='2')
       {
       ops_tp = newDescval_i; 
       newDescval_i = deptdesc; 
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }
       else
       if(newDescval_i=='016'||newDescval_i=='014'||newDescval_i=='002')
       {
         oldgenstndesc = genstndesc;
         if(newDescval_i=='016')
          {
            genstndesc = 'BUDGE BUDGE GENERATING STATION';
          }
         if(newDescval_i=='014')
          {
            genstndesc = 'TITAGARH GENERATING STATION';
          }
         if(newDescval_i=='002')
          {
            genstndesc = 'SOUTHERN GENERATING STATION';
          }

       ops_tp = '0';
       oldgenstncode = genstncode;
       genstncode = newDescval_i; 
       newDescval_i= deptdesc;
       }
       else
       {
       ops_tp = '0';
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }

    // alert(ops_tp+'  DESC   '+newDescval_i+' OLDSTN  '+oldgenstncode+' NEWSTN   '+genstncode);

       param1 = 'empcd='+empcd+'&empfnm='+empfnm+'&emplnm='+emplnm+'&genstndesc='+genstndesc+'&genstncode='+genstncode+
               '&deptcode='+deptcode+'&deptdesc='+newDescval_i+'&emplevel='+usertype+'&genshtdesc='+genshtdesc+'&empdesig='+empdesig+
               '&usertype='+usertype+'&username='+username+'&adminmkr='+adminmkr+'&kaizenmkr='+kaizenmkr+'&olddeptdesc='+deptdesc+
               '&ops_type='+ops_tp+'&oldgenstncode='+oldgenstncode+'&oldgenstndesc='+oldgenstndesc ;

       param1 = param1 + '&prefix=P' ;
       url = 'http://itweb:54844/gendefm/defm_menu.jsp?' + param1 ;
       window.open(url,'DEFM','Fullscreen=YES, Scrollbars=NO') ;
       window.open("close.html","_self");   
       }
       }
       else
       {
       param = param + '&prefix=P' ;
       url = 'http://itweb:54844/gendefm/defm_menu.jsp?' + param ;
       window.open(url,'DEFM','Fullscreen=YES, Scrollbars=NO') ;
       window.open("close.html","_self");
       }
   }
   else if ( headArr[n] == 'MAINTENANCE PLANNING DASHBOARD' ){

       if(deptdesc=='MMD'||deptdesc=='FMD'||deptdesc=='CTM')
       {
       var newDescval_i=showModalDialog("deft_internal_interface.jsp?dept_desc="+deptdesc,0,"dialogWidth:450px;dialogHeight:300px");
       if(newDescval_i==null||newDescval_i=='undefined'||newDescval_i=='')
       {
         alert('YOU MUST HAVE TO SELECT AN OPTION FROM DROP DOWN');
       }
       else
       {


       if(newDescval_i=='1'||newDescval_i=='2')
       {
       ops_tp = newDescval_i; 
       newDescval_i = deptdesc; 
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }
       else
       if(newDescval_i=='016'||newDescval_i=='014'||newDescval_i=='002')
       {
         oldgenstndesc = genstndesc;
         if(newDescval_i=='016')
          {
            genstndesc = 'BUDGE BUDGE GENERATING STATION';
          }
         if(newDescval_i=='014')
          {
            genstndesc = 'TITAGARH GENERATING STATION';
          }
         if(newDescval_i=='002')
          {
            genstndesc = 'SOUTHERN GENERATING STATION';
          }

       ops_tp = '0';
       oldgenstncode = genstncode;
       genstncode = newDescval_i; 
       newDescval_i= deptdesc;
       }
       else
       {
       ops_tp = '0';
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }

    // alert(ops_tp+'  DESC   '+newDescval_i+' OLDSTN  '+oldgenstncode+' NEWSTN   '+genstncode);

       param1 = 'empcd='+empcd+'&empfnm='+empfnm+'&emplnm='+emplnm+'&genstndesc='+genstndesc+'&genstncode='+genstncode+
                '&deptcode='+deptcode+'&deptdesc='+newDescval_i;


       param1 = param1 + '&prefix=P' ;
       url = 'http://itweb:54844/gendefm/rm_schd_interface.jsp?'+param1 ;
       WshShell = new ActiveXObject("WScript.Shell");
       WshShell.Run ('file://D:/rmdash.bat '+url,1,false);
       //window.open(url,'DEFM','Fullscreen=YES, Scrollbars=YES') ;
       //window.open("close.html","_self");   
       }
       }
       else
       {
       param = 'empcd='+empcd+'&empfnm='+empfnm+'&emplnm='+emplnm+'&genstndesc='+genstndesc+'&genstncode='+genstncode+
                '&deptcode='+deptcode+'&deptdesc='+newDescval_i;
     //  alert(param)
       url = 'http://itweb:54844/gendefm/rm_schd_interface.jsp?empcd='+empcd ;
       WshShell = new ActiveXObject("WScript.Shell");
       WshShell.Run ('file://D:/rmdash.bat '+url,1,false);
      // window.open(url,'DEFM','Fullscreen=YES, Scrollbars=YES') ;
      // window.open("close.html","_self");
       }
   }
   else if ( headArr[n] == 'ASSET MANAGEMENT' ){


       if(deptdesc=='MMD'||deptdesc=='FMD'||deptdesc=='CTM')
       {
       var newDescval_i=showModalDialog("deft_internal_interface.jsp?dept_desc="+deptdesc,0,"dialogWidth:450px;dialogHeight:300px");
       if(newDescval_i==null||newDescval_i=='undefined'||newDescval_i=='')
       {
         alert('YOU MUST HAVE TO SELECT AN OPTION FROM DROP DOWN');
       }
       else
       {


       if(newDescval_i=='1'||newDescval_i=='2')
       {
       ops_tp = newDescval_i; 
       newDescval_i = deptdesc; 
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }
       else
       if(newDescval_i=='016'||newDescval_i=='014'||newDescval_i=='002')
       {
         oldgenstndesc = genstndesc;
         if(newDescval_i=='016')
          {
            genstndesc = 'BUDGE BUDGE GENERATING STATION';
          }
         if(newDescval_i=='014')
          {
            genstndesc = 'TITAGARH GENERATING STATION';
          }
         if(newDescval_i=='002')
          {
            genstndesc = 'SOUTHERN GENERATING STATION';
          }

       ops_tp = '0';
       oldgenstncode = genstncode;
       genstncode = newDescval_i; 
       newDescval_i= deptdesc;
       }
       else
       {
       ops_tp = '0';
       oldgenstncode = genstncode;
       oldgenstndesc = genstndesc;
       }

    // alert(ops_tp+'  DESC   '+newDescval_i+' OLDSTN  '+oldgenstncode+' NEWSTN   '+genstncode);

       param1 = 'empcd='+empcd+'&empfnm='+empfnm+'&emplnm='+emplnm+'&genstndesc='+genstndesc+'&genstncode='+genstncode+
               '&deptcode='+deptcode+'&deptdesc='+newDescval_i+'&emplevel='+usertype+'&genshtdesc='+genshtdesc+'&empdesig='+empdesig+
               '&usertype='+usertype+'&username='+username+'&adminmkr='+adminmkr+'&kaizenmkr='+kaizenmkr+'&olddeptdesc='+deptdesc+
               '&ops_type='+ops_tp+'&oldgenstncode='+oldgenstncode+'&oldgenstndesc='+oldgenstndesc ;

       param1 = param1 + '&prefix=P' ;
       url = 'http://itweb:54844/gendefm/asset_register.jsp?' + param1 ;
       window.open(url,'DEFM','Fullscreen=YES, Scrollbars=NO') ;
       window.open("close.html","_self");   
       }
       }
       else
       {
       param = param + '&prefix=P' ;
       url = 'http://itweb:54844/gendefm/asset_register.jsp?' + param ;
       window.open(url,'DEFM','Fullscreen=YES, Scrollbars=NO') ;
       window.open("close.html","_self");
       }
   }
   else
       window.open(urlArr[n],'I1');

  }

 }


</script>
</head>

<%@ page import="java.util.*" %>
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>


<%

 String SysDt  = new String();

 String USRTP=request.getParameter("usrtp");
 String USRNM=request.getParameter("usrnm");
 String STATN=request.getParameter("statn");
 String EMPCD=request.getParameter("empcd");
 String sEmpFNm=request.getParameter("fnm");
 String sEmpLNm=request.getParameter("lnm");
 String sDept=request.getParameter("dept");
 String sEmpDesg=request.getParameter("desig");
 String sGenStn=request.getParameter("genStnCd");
 String sAdminMkr=request.getParameter("adminmkr");
 String sgenshtdesc=request.getParameter("sgenshtdesc");
 String svndlvl=request.getParameter("svndlvl");
 String sdptshtdesc=request.getParameter("sdptshtdesc");
 String sLoginEmpKaizenMkr=request.getParameter("sLoginEmpKaizenMkr");
 String accessOrder = new String("");
 String accessBudget = new String("");
 String accessBlRls  = new String("");
 String accessBlRcv  = new String("");
 String accessPrntOrd  = new String("");
 String accessDcm      = new String("");
 String accessIpm      = new String("");
 String accessRm       = new String("");
 String accessAm       = new String("");
 


 System.out.println("sGenStn : " + sGenStn);
 System.out.println("STATN : " + STATN);

 LinkedList A1=new LinkedList(); 

 MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
 mk.con.setAutoCommit(false);

      PreparedStatement ps0  = mk.con.prepareStatement(" SELECT TO_CHAR(sysdate,'DD-MON-RRRR') FROM DUAL ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ResultSet rs0=ps0.executeQuery();

       while(rs0.next())
          {
             SysDt  = rs0.getString(1);
          }

      rs0.close();
      ps0.close();

      String flag= new String();

      flag="0";

      PreparedStatement ps1  = mk.con.prepareStatement(" SELECT NVL(login_adm_mkr,'@') FROM ADM_LOGIN_MST "+
                                                       " WHERE  login_id   = ? "+
                                                       " AND    login_adm_mkr IN ('3','4') ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps1.setString(1,EMPCD);

      ResultSet rs1=ps1.executeQuery();

       while(rs1.next())
          {
             svndlvl      = rs1.getString(1);
             flag="1";
          }

      rs1.close();
      ps1.close();


      if (flag=="0")
      {

      PreparedStatement ps2  = mk.con.prepareStatement(" SELECT DISTINCT TRIM(TO_CHAR(bgt_level)) FROM BGT_LEVEL "+
                                                       " WHERE  emp_code   = ?                                   "+
                                                       " AND    sec_cd NOT IN ('CTM')                            "+
                                                       " AND    bgt_level IN ('2')                               ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps2.setString(1,EMPCD);

      ResultSet rs2=ps2.executeQuery();

       while(rs2.next())
          {
             svndlvl      = rs2.getString(1);
             flag="2";
          }

      rs2.close();
      ps2.close();

      }


      if (flag=="0")
      {

      PreparedStatement ps3  = mk.con.prepareStatement(" SELECT '2' FROM ADM_EMP_MST  "+
                                                       " WHERE  emp_code   = ?        "+
                                                       " AND    emp_desg IN ('1200')  ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps3.setString(1,EMPCD);

      ResultSet rs3=ps3.executeQuery();

       while(rs3.next())
          {
             svndlvl      = rs3.getString(1);
             flag="3";
          }

      rs3.close();
      ps3.close();

      }

      PreparedStatement ps4  = mk.con.prepareStatement(" SELECT nvl(order_mkr,' '), nvl(budget_mkr,' '),nvl(bill_release_mkr,' '),nvl(fin_bill_rcv_mkr,' ') ,nvl(print_ord_mkr,' '),nvl(dcm_mkr,' '),nvl(ipm_mkr,' '),nvl(rm_mkr,' '),nvl(am_mkr,' ') " +
                                                       " FROM ADM_LOGIN_MST  " +
                                                       " WHERE  login_id   = ?        ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps4.setString(1,EMPCD);

      ResultSet rs4=ps4.executeQuery();

       while(rs4.next())
          {
            accessOrder  = rs4.getString(1);
            accessBudget = rs4.getString(2);
            accessBlRls  = rs4.getString(3);
            accessBlRcv  = rs4.getString(4);
            accessPrntOrd  = rs4.getString(5);
            accessDcm    = rs4.getString(6);
            accessIpm    = rs4.getString(7);
            accessRm     = rs4.getString(8);
            accessAm     = rs4.getString(9);
          }

      rs4.close();
      ps4.close();

      mk.con.close();
 
 //if(USRTP.equals("0") || USRTP.equals("1") || USRTP.equals("2") || USRTP.equals("3") || USRTP.equals("4") || USRTP.equals("5") || USRTP.equals("6"))

  int arrCnt  = 0 ;
  int arrCnt1 = 1 ;

  String strarrCnt = "" + arrCnt1 ;
  

  if (accessBudget.equals("Y"))
  {
    A1.add(strarrCnt+". BUDGET");
  %>
   <script>
      headArr [<%= arrCnt %>]  = "BUDGET";
      descArr [<%= arrCnt %>]  = "ABOUT BUDGET";
      desc1Arr[<%= arrCnt %>]  = "All kinds of Budgets for Generation Division.";
      urlArr[<%= arrCnt %>]    = "tree2.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }


  if (accessOrder.equals("Y"))
  {
     if (EMPCD.equals("555555"))
  {
    A1.add( strarrCnt+". ORDER , BILL & VENDOR" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "ORDER , BILL & VENDOR";
      descArr [<%= arrCnt %>]  = "ABOUT ORDER , BILL & VENDOR";
      desc1Arr[<%= arrCnt %>]  = "Order & Bill Processing and Printing , Vendor Management.";
      urlArr[<%= arrCnt %>]    = "tree20.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }
else
  {
    A1.add( strarrCnt+". ORDER , BILL & VENDOR" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "ORDER , BILL & VENDOR";
      descArr [<%= arrCnt %>]  = "ABOUT ORDER , BILL & VENDOR";
      desc1Arr[<%= arrCnt %>]  = "Order & Bill Processing and Printing , Vendor Management.";
      urlArr[<%= arrCnt %>]    = "tree1.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;

  }

  }


 if(sAdminMkr.equals("A"))
  {
    A1.add(strarrCnt+". ADMINISTRATION (CENTRAL DBA)");
   %>
     <script>
        headArr[<%= arrCnt %>]  = "ADMINISTRATION (CENTRAL DBA)";
        descArr[<%= arrCnt %>]  = "ABOUT ADMIN. (CENTRAL DBA)";
        desc1Arr[<%= arrCnt %>] = "Administration of Central DBA.";
        urlArr[<%= arrCnt %>]   = "tree5.html";
     </script>
   <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

 if(sAdminMkr.equals("G"))
  {
    A1.add(strarrCnt+". ADMINISTRATION (LOCAL DBA)");
   %>
     <script>
        headArr[<%= arrCnt %>]  = "ADMINISTRATION (LOCAL DBA)";
        descArr[<%= arrCnt %>]  = "ABOUT ADMIN. (LOCAL DBA)";
        desc1Arr[<%= arrCnt %>] = "Administration of Local DBA.";
        urlArr[<%= arrCnt %>]   = "tree6.html";
     </script>
   <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }
  if (accessBlRcv.equals("Y"))
  {
    A1.add(strarrCnt+". FINANCE MODULE");
  %>
   <script>
      headArr [<%= arrCnt %>]  = "FINANCE MODULE";
      descArr [<%= arrCnt %>]  = "ABOUT FINANCE MODULE";
      desc1Arr[<%= arrCnt %>]  = "Bill Processing Module for Finance.";
      urlArr[<%= arrCnt %>]    = "tree7.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }
  if (accessPrntOrd.equals("Y"))
  {
    A1.add( strarrCnt+". ORDER PRINTING MODULE" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "ORDER PRINTING MODULE";
      descArr [<%= arrCnt %>]  = "ABOUT ORDER PRINTING";
      desc1Arr[<%= arrCnt %>]  = "Order Printing.";
      urlArr[<%= arrCnt %>]    = "tree8.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

  if (accessBlRls.equals("Y"))
  {
    A1.add( strarrCnt+". BILL RELEASE MODULE" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "BILL RELEASE MODULE";
      descArr [<%= arrCnt %>]  = "ABOUT BILL RELEASE MODULE";
      desc1Arr[<%= arrCnt %>]  = "Allowing Bill Release.";
      urlArr[<%= arrCnt %>]    = "tree9.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

if (!EMPCD.equals("555555"))
{
if (accessOrder.equals("Y"))
  {
    A1.add( strarrCnt+". BUDGET MONITORING" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "BUDGET MONITORING";
      descArr [<%= arrCnt %>]  = "ABOUT BUDGET MONITORING";
      desc1Arr[<%= arrCnt %>]  = "Budget Monitoring and tracking .";
      urlArr[<%= arrCnt %>]    = "tree10.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }
}

if (!EMPCD.equals("555555"))
  {
  if (accessOrder.equals("Y"))
  {
    A1.add( strarrCnt+". KAIZEN" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "KAIZEN";
      descArr [<%= arrCnt %>]  = "ABOUT KAIZEN";
      desc1Arr[<%= arrCnt %>]  = "Kaizen for Generation Division.";
      urlArr[<%= arrCnt %>]    = "tree11.html";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }
 }

 if(sAdminMkr.equals("B")||sAdminMkr.equals("G")||sAdminMkr.equals("P"))
  {
    A1.add(strarrCnt+". VENDOR DOCUMENT UPLOADING");
   %>
     <script>
        headArr[<%= arrCnt %>]  = "VENDOR DOCUMENT UPLOADING";
        descArr[<%= arrCnt %>]  = "ABOUT VENDOR DOC. UPLOAD";
        desc1Arr[<%= arrCnt %>] = "Vendor Document Uploading.";
        urlArr[<%= arrCnt %>]   = "tree12.html";
     </script>
   <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

  if (accessDcm.equals("Y"))
  {
    A1.add(strarrCnt+". DEFECT MANAGEMENT");
  %>
   <script>
      headArr [<%= arrCnt %>]  = "DEFECT MANAGEMENT";
      descArr [<%= arrCnt %>]  = "ABOUT DEFECT MNGMT.";
      desc1Arr[<%= arrCnt %>]  = "Defecet Management System.";
      urlArr[<%= arrCnt %>]    = "http://itweb:54844/gendefm/menu.jsp";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

  if (accessIpm.equals("Y"))
  {
    A1.add( strarrCnt+". INTERNAL PTW MANAGEMENT" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "INTERNAL PTW MANAGEMENT";
      descArr [<%= arrCnt %>]  = "ABOUT INTERNAL PTW MNGMT.";
      desc1Arr[<%= arrCnt %>]  = "Internal PTW Management System.";
      urlArr[<%= arrCnt %>]    = "http://itweb:54844/gendefm/menu.jsp";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

  if (accessRm.equals("Y"))
  {
    A1.add( strarrCnt+". MAINTENANCE PLANNING DASHBOARD" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "MAINTENANCE PLANNING DASHBOARD";
      descArr [<%= arrCnt %>]  = "ABOUT RM SCHD. MNTC.";
      desc1Arr[<%= arrCnt %>]  = "RM Schedule Maintenance System.";
      urlArr[<%= arrCnt %>]    = "NOT REQD.";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

  if (accessAm.equals("Y"))
  {
    A1.add( strarrCnt+". ASSET MANAGEMENT" );
  %>
   <script>
      headArr [<%= arrCnt %>]  = "ASSET MANAGEMENT";
      descArr [<%= arrCnt %>]  = "ABOUT ASSET MANAGEMENT";
      desc1Arr[<%= arrCnt %>]  = "Asset Management System.";
      urlArr[<%= arrCnt %>]    = "NOT REQD.";
   </script>
 <%
      arrCnt  =  arrCnt + 1 ;
      arrCnt1 = arrCnt1 + 1 ;
      strarrCnt = "" + arrCnt1 ;
  }

 %>


<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<jsp:setProperty name="loginBean" property="sGenStn" value="<%= sGenStn %>"/>
<jsp:setProperty name="loginBean" property="sLoginStnShrtNm" value="<%= sgenshtdesc %>"/>
<jsp:setProperty name="loginBean" property="sGenStnNm" value="<%= STATN %>"/>
<jsp:setProperty name="loginBean" property="sDept" value="<%= sDept %>"/>
<jsp:setProperty name="loginBean" property="sLoginDeptShrtNm" value="<%= sdptshtdesc %>"/>
<jsp:setProperty name="loginBean" property="sLoginDeptLongNm" value="<%= sdptshtdesc %>"/>
<jsp:setProperty name="loginBean" property="sEmpCd" value="<%= EMPCD %>"/>
<jsp:setProperty name="loginBean" property="sEmpFNm" value="<%= sEmpFNm %>"/>
<jsp:setProperty name="loginBean" property="sEmpLNm" value="<%= sEmpLNm %>"/>
<jsp:setProperty name="loginBean" property="sEmpDesg" value="<%= sEmpDesg %>"/>
<jsp:setProperty name="loginBean" property="sLoginEmpLvl" value="<%= USRTP %>"/>
<jsp:setProperty name="loginBean" property="sLoginEmpVndrLvl" value="<%= svndlvl %>"/>
<jsp:setProperty name="loginBean" property="sAdminMkr" value="<%= sAdminMkr %>"/>
<jsp:setProperty name="loginBean" property="sLoginEmpKaizenMkr" value="<%= sLoginEmpKaizenMkr %>"/>

<input type="hidden" id="empcd" value="<%= EMPCD %>"/>
<input type="hidden" id="empfnm" value="<%= sEmpFNm %>"/>
<input type="hidden" id="emplnm" value="<%= sEmpLNm %>"/>
<input type="hidden" id="genstndesc" value="<%= STATN %>"/>
<input type="hidden" id="genstncode" value="<%= sGenStn %>"/>
<input type="hidden" id="deptcode" value="<%= sDept %>"/>
<input type="hidden" id="deptdesc" value="<%= sdptshtdesc %>"/>
<input type="hidden" id="emplevel" value="<%= svndlvl %>"/>
<input type="hidden" id="genshtdesc" value="<%= sgenshtdesc %>"/>
<input type="hidden" id="empdesig" value="<%= sEmpDesg %>"/>
<input type="hidden" id="usertype" value="<%= USRTP %>"/>
<input type="hidden" id="username" value="<%= USRNM %>"/>
<input type="hidden" id="adminmkr" value="<%= sAdminMkr %>"/>
<input type="hidden" id="kaizenmkr" value="<%= sLoginEmpKaizenMkr %>"/>

<%

  System.out.println("sGenStn : " + sGenStn);
  System.out.println("sGenStnNm : " + STATN);
  System.out.println("sgenshtdesc : " + sgenshtdesc);
  System.out.println("sdptshtdesc : " + sdptshtdesc);
  System.out.println("sGenStn : " + loginBean.getsGenStn());
  System.out.println("sGenStnNm : " + loginBean.getsGenStnNm());

  System.out.println("sGenStn : " + loginBean.getsGenStn());
  System.out.println("sLoginStnShrtNm : " + loginBean.getsLoginStnShrtNm());
  System.out.println("sGenStnNm : " + loginBean.getsGenStnNm());
  System.out.println("sDept : " + loginBean.getsDept());
  System.out.println("sLoginDeptShrtNm : " + loginBean.getsLoginDeptShrtNm());
  System.out.println("sLoginDeptLongNm : " + loginBean.getsLoginDeptLongNm());
  System.out.println("sEmpCd : " + loginBean.getsEmpCd());
  System.out.println("sEmpFNm : " + loginBean.getsEmpFNm());
  System.out.println("sEmpLNm : " + loginBean.getsEmpLNm());
  System.out.println("sEmpDesg : " + loginBean.getsEmpDesg());
  System.out.println("sLoginEmpLvl : " + loginBean.getsLoginEmpLvl());
  System.out.println("sLoginEmpVndrLvl : " + loginBean.getsLoginEmpVndrLvl());
  System.out.println("sAdminMkr : " + loginBean.getsAdminMkr());
%>

<body onload="shoheading(100);">
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
	<div id="buttons">
      <a class="but" title="" <font size = "2" >  <%= SysDt %> </font></a><div class="razd_b"></div>
      <a class="but" title=""><font size = "2">  <%= USRNM %> </font></a><div class="razd_b"></div>
      <a class="but" title=""><font size = "2">  <%= STATN %></font></a><div class="razd_b"></div>
      <a href="#" class="but" title="" onclick="window.open('close.html','_self');">LOGOUT</a>
    </div>
	<div id="logo" style="height: 106px">
    <h2 style="height: 97px" class="style3">GENERATION DIVISION</h2>
    </div>  
 </div>
<!-- header ends -->
        <!-- content begins -->
       			<div id="content">
                    <div id="right" style="height: 441px">
                      <h1 id="hd1"></h1>
                         <div class="text">
                          <div class="style4" style="height: 346px">
							<iframe name="I1" id="I1" src="" style="height: 335px; width: 318px; float: top;" border="0" frameborder="0">
							</iframe></div>
                        </div>
						
                    </div>
                    <div id="left">
                   	   		<h1>SYSTEMS</h1>
             		    <div class="list">
<%
                            for(int i=0;i<A1.size();i++)
                               {
%>
                            	 <div class="opt"><div class="opt_a" onclick="shoheading(<%= i %>);">
                                  <%= A1.get(i) %></div></div>
<%
                               }
%>

                            </div>
                            <h1 id="abouthd"></h1>
                  			<div class="box10">
                            	<div class="box_top"></div>
                                <div class="left_b" id="desc1"> 
                                </div>
                                <div class="box_bot"></div>
               		  		</div>
               		  		<br/>
               		  		
               		  		<div class="box10">
                            	<div class="box_top"></div>
                                <div class="left_b" id="desc2">
                                </div>
                                <div class="box_bot"></div>
               		  		</div>


                     </div>
          			<div style="clear: both"></div>
        		</div>
    <!-- content ends --> 
<!-- footer begins -->
            <div id="footer">
		  2012 � Developed by I.T. Department</div>
        <!-- footer ends -->
        <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:95px" width="120" height="59"/>
</div>



</body>
</html>