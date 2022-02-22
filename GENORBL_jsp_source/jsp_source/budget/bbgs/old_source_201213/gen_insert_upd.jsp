
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function loadDEPage(){

}

</script>
</head>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.util.ArrayList,java.util.Iterator,java.io.PrintWriter; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        CallableStatement cstmt = null;
                        ResultSet rs = null;
                        ArrayList aL1 = null;
                        System.out.println("gen_insert_upd.jsp opened");

                        String sIns_Upd_Mkr = new String("");
                        String sLastRecMkr = new String("N");
                        String sDB_String = new String("");
                        String sDB_String1 = new String("");

                        String sInsert_String = request.getParameter("insert_string");
                        String sUpdate_String = request.getParameter("update_string");
                        String sBgt_yr        = request.getParameter("bgt_yr");
                        String sSec_cd        = request.getParameter("sec_cd");
                        //String sIp_ecode      = request.getParameter("ip_ecode");
                        String sEcode         = request.getParameter("ip_ecode");
                        String sStn_cd        = request.getParameter("stn_cd");

                        String sBgt_yy        = sBgt_yr.substring(2);
                        int iNxtBgt_yy        = Integer.parseInt(sBgt_yy)+1 ;
                        String sNxtBgt_yy     = Integer.toString(iNxtBgt_yy);

                        String[] sEachRow ;    
                        String[] sEachCol ;    
                        String sRowDelimiter = "$$$";
                        String sColDelimiter = "|";

                        if(sInsert_String.equals("I")){

                           sIns_Upd_Mkr = "U";
                           sDB_String = sUpdate_String;
                           sDB_String1 = sDB_String;

                        }

                        if(sUpdate_String.equals("U")){

                           sIns_Upd_Mkr = "I";
                           sDB_String = sInsert_String;
                           sDB_String1 = sDB_String;

                        }

                        System.out.println("Insert/Update Marker "+sIns_Upd_Mkr);
               
%>
<script>
//   window.parent.loadImg();
</script>
<%
                        String sMssg = new String(" ");
                        String sMssg1 = new String(" ");
                        try {

                                aL1 = new ArrayList();
                                mk = new MakeConnectionGENORBL();
                                mk.con.setAutoCommit(false);

                                int i_Rows = 0;
                                int i_Cols = 0;
                                int iRet = 0;
                                int iRet1 = 0;
                                int iSuccessFlag = 0;
                                int iFailureFlag = 0;
                                //System.out.println("KKK"+sDB_String);

                                int index = sDB_String1.indexOf(sRowDelimiter);
                                while (index != -1) {
                                    i_Rows++;
                                    sDB_String1 = sDB_String1.substring(index + 1);
                                    index = sDB_String1.indexOf(sRowDelimiter);
                                }


                                for(int i = 0;i< sDB_String.length();i++){

                                   if(sDB_String.charAt(i)=='|'){
                             
                                      i_Cols++ ;

                                   }


                                }

                                i_Cols = i_Cols / i_Rows ;

                                System.out.println("Max Rows:"+i_Rows+",Max Cols:"+i_Cols);

                                String[][] eachElem = new String[i_Rows][i_Cols];

                                sEachRow = sDB_String.split("\\$\\$\\$");

                                System.out.println("R: "+sEachRow.length);
                                for(int i=0;i<i_Rows;i++){

                                    //System.out.println("index i"+i);
                                    //System.out.println("sEachRow[i]:"+sEachRow[i]);
                                    sEachCol = sEachRow[i].split("\\|");
                                    
                                    //System.out.println("C: "+sEachCol.length);
                                    for(int j =0 ; j<i_Cols; j++){

                                     //  System.out.println("index j"+j);
                                       eachElem[i][j] = sEachCol[j];
                                      // System.out.println("Each Elem["+(i)+"]["+(j)+"]:"+eachElem[i][j]);


                                    }


                                }

/*
                                for (int i=0; i< i_Rows ; i++){

                                     for(int j=0;j< i_Cols;j++){

                                         //System.out.println("Each Elem at i="+i+" ,j="+j+":"+eachElem[i][j]);

                                     }

                                }

*/
                                if(sIns_Upd_Mkr.equals("U")){
                                   for(int i = 0; i< i_Rows ; i++){

                                       if((i+1)==i_Rows){

                                          sLastRecMkr="Y";

                                       }

                                       cstmt = mk.con.prepareCall( "{call DPD_UPD_FORM2B_DATA(?,?,?,?,?,?,"+
                                                                       "?,?,?,?,?)}");

                                       cstmt.setString(1,sBgt_yr);
                                       cstmt.setString(2,sSec_cd);
                                       cstmt.setString(3,sStn_cd);
                                       cstmt.setString(8,sEcode);
                                       cstmt.registerOutParameter(9,OracleTypes.NUMBER);
                                       cstmt.setString(10,eachElem[i][0]);
                                       cstmt.setString(11,sLastRecMkr);

                                       System.out.println("setString at 1"+sBgt_yr);
                                       System.out.println("setString at 2"+sSec_cd);
                                       System.out.println("setString at 3"+sStn_cd);
                                       System.out.println("setString at 11"+sLastRecMkr);

   
                                       for(int j = 1; j< i_Cols; j++){
   
                                           cstmt.setString(j+3,eachElem[i][j]);
   
                                           System.out.println("setString at "+(j+3)+" is "+eachElem[i][j]);

                                       }
               
                                       cstmt.execute();

                                       System.out.println("DPD_UPD_FORM2B_DATA PROCEDURE CALLED");

                                       iRet = cstmt.getInt(9);

                                       System.out.println("PROCEDURE RETURNED VALUES");

                                       if(iRet==1){

                                          iFailureFlag = 0;

                                          sMssg = "RECORDS UPDATED SUCCESSFULLY";

                                       }else{

                                          if(iRet==0){

                                             iFailureFlag = 1;
                                             sMssg = "ERROR OCCURRED WHILE ENTERING RECORDS WITH CELLID CODE: "+eachElem[i][0];

                                          }else{

                                            if(iRet == 3){
                                            
                                               iFailureFlag = 0;
                                               sMssg = "DATA NOT INSERTED AS MULTIPLE RECORDS EXIST WITH THE EMP CODE: "+eachElem[i][0];

                                            } 


                                          }

                                       }


                                      cstmt.close();
                                      cstmt = null;

                                      if(iFailureFlag == 1){

                                         break; 
                                      }

                                   }

                                }else{
                            
                                   System.out.println("INSERT MODE "+sIns_Upd_Mkr);

                                   if(sIns_Upd_Mkr.equals("I")){

                                      String sPubMkr = new String("N");
                                      String sBgtLvl = new String("1");
                                      String sBgtVer = new String("1");
                                      String sBgtFnl = new String(" ");

                                      for(int i = 0; i< i_Rows ; i++){

                                          if((i+1)==i_Rows){

                                             sLastRecMkr="Y";

                                          }

                                          cstmt = mk.con.prepareCall( "{call DPD_INS_FORM2B_DATA(?,?,?,?,?,?,?,"+
                                                                       "?,?,?,?,?,?,?,?)}");

                                          cstmt.setString(1,sBgt_yr);
                                          cstmt.setString(2,sSec_cd);
                                          cstmt.setString(3,sStn_cd);
                                          cstmt.setString(9,sBgtLvl);
                                          cstmt.setString(10,sPubMkr);
                                          cstmt.setString(11,sBgtFnl);
                                          cstmt.setString(12,sBgtVer);
                                          cstmt.setString(13,sEcode);
                                          cstmt.registerOutParameter(14,OracleTypes.NUMBER);
                                          cstmt.setString(15,sLastRecMkr);
   
                                          for(int j = 1; j< i_Cols; j++){
   
                                              cstmt.setString(j+3,eachElem[i][j]);
      
                                              //System.out.println("setString at "+(j+3)+" is "+eachElem[i][j]);

                                          }
               
                                          cstmt.execute();

                                          //System.out.println("DPD_INS_FORM2B_DATA PROCEDURE CALLED");

                                          iRet = cstmt.getInt(14);

                                          //System.out.println("PROCEDURE RETURNED VALUES");

                                          if(iRet==1){

                                             iFailureFlag = 0;

                                             sMssg = "RECORDS UPDATED SUCCESSFULLY";

                                          }else{

                                             if(iRet==0){

                                                iFailureFlag = 1;
                                                sMssg = "ERROR OCCURRED WHILE ENTERING RECORDS WITH CELLID CODE: "+eachElem[i][0];

                                             }else{

                                               if(iRet == 3){
                                            
                                                  iFailureFlag = 0;
                                                  sMssg = "DATA NOT INSERTED AS MULTIPLE RECORDS EXIST WITH THE EMP CODE: "+eachElem[i][0];
   
                                               } 


                                             }

                                          }


                                         cstmt.close();
                                         cstmt = null;
    
                                         if(iFailureFlag == 1){

                                            break; 
                                         }

                                      }



                                      cstmt = mk.con.prepareCall( "{call DPD_INS_BGT_POSITION(?,?,?,?,?,?)}");

                                      cstmt.setString(1,sBgt_yr);
                                      cstmt.setString(2,sSec_cd);
                                      cstmt.setString(3,sStn_cd);
                                      cstmt.setString(4,sBgtLvl);
                                      cstmt.setString(5,sEcode);
                                      cstmt.registerOutParameter(6,OracleTypes.NUMBER);

                                      cstmt.execute();
                                      iRet1 = cstmt.getInt(6);

                                      if(iRet1 == 1){
                                       
                                         sMssg = sMssg + "ROW INSERTED IN BGT_POSITION FOR STN,SEC,YR"+sStn_cd+","+sSec_cd+","+sBgt_yr;

                                      }else{

                                         if(iRet1 == 2){

                                            sMssg = sMssg+"ROW ALREADY EXISTS IN BGT POSITION FOR STN,SEC,YR"+sStn_cd+","+sSec_cd+","+sBgt_yr;

                                         }else{

                                              if(iRet1 == 0){

                                                 sMssg = sMssg+"ERROR OCCURED WHILE INSERTING RECS IN BGT POSITION FOR STN,SEC,YR"+sStn_cd+","+sSec_cd+","+sBgt_yr;

                                              }

                                         }

                                      }

                                      cstmt.close();
                                      cstmt = null;

                                   }

                                }

                                System.out.println("MESSAGE:"+sMssg);
                                System.out.println("FAILURE STATUS(0-Success,1-Failure):"+iFailureFlag);

         //                       if(iRet1 != 0){ 
%>
<script>
 //   window.parent.unloadImg();
</script>
<%
          //                      }
                                if(iFailureFlag == 0){


%>
<script>

     alert("DATA UPDATED/INSERTED SUCCESSFULLY");
     window.parent.selfSubmit(); 

</script>
<%



                                }else{

%>
<script>

     alert("DATA NOT UPDATED/INSERTED");
     window.parent.selfSubmit(); 

</script>
<%
                                }

                                mk.con.close();

                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("In EXCEPTION of gen_insert_upd.jsp");
                    System.out.println("MESSAGE:"+sMssg);

                } finally {

                    System.out.println("In Finally of gen_insert_upd.jsp");
                    try {
                        if (cstmt != null) {
                            cstmt.close();
                        }
                        if (mk != null) {
                            mk.con.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }


%>

</html>
