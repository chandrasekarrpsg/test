
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
                        System.out.println("gen_insert_upd_new.jsp opened");

                        String sLastRecMkr = new String("N");
                        String sDB_String = new String("");
                        String sDB_String1 = new String("");

                        String sIns_Upd_Mkr     = request.getParameter("ins_upd_mkr");
                        String sInsert_String = request.getParameter("insert_string");
                        String sUpdate_String = request.getParameter("update_string");
                        String sBgt_yr        = request.getParameter("bgt_yr");
                        String sSec_cd        = request.getParameter("sec_cd");
                        //String sIp_ecode      = request.getParameter("ip_ecode");
                        String sEcode         = request.getParameter("username");
                        String sStn_cd        = request.getParameter("stn_cd");

                        String sBgt_yy        = sBgt_yr.substring(2);
                        int iNxtBgt_yy        = Integer.parseInt(sBgt_yy)+1 ;
                        String sNxtBgt_yy     = Integer.toString(iNxtBgt_yy);

                        String[] sEachRow ;    
                        String[] sEachCol ;    
                        String sRowDelimiter = "$$$";
                        String sColDelimiter = "|";


                        sDB_String  = sInsert_String;
                        sDB_String1 = sInsert_String;

                        System.out.println("Insert/Update Marker "+sIns_Upd_Mkr);
                        System.out.println("Username "+sEcode);
               
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
                                int iRet_aft_del = 0;
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
                                System.out.println("i_Rows"+i_Rows);
                                System.out.println("i_Cols"+i_Cols);

                                i_Cols = i_Cols / i_Rows ;


                                String[][] eachElem = new String[i_Rows][i_Cols];

                                sEachRow = sDB_String.split("\\$\\$\\$");

                                System.out.println("INSERT STRING ROWS LENGTH: "+sEachRow.length);
                                System.out.println("Max Rows:"+i_Rows+",Max Cols:"+i_Cols);

                                if(sIns_Upd_Mkr.equals("I")){
                                   System.out.println("DPD_DEL_BGT_DATA STARTED"+sBgt_yr+","+sStn_cd+","+sSec_cd);
                                   cstmt = mk.con.prepareCall( "{call DPD_DEL_BGT_DATA(?,?,?,?)}");

                                   cstmt.setString(1,sBgt_yr);
                                   cstmt.setString(2,sStn_cd);
                                   cstmt.setString(3,sSec_cd);
                                   cstmt.registerOutParameter(4,OracleTypes.NUMBER);

                                   cstmt.execute();
                                   iRet_aft_del = cstmt.getInt(4);
                                   System.out.println("DPD_DEL_BGT_DATA RETURNED VALUES"+iRet);

                                   cstmt.close();
                                   cstmt = null;
                                   System.out.println("DPD_DEL_BGT_DATA cstmt closed");

                                   if(iRet_aft_del==1){
                                      String sMnthString_1  = new String("");
                                      String sMnthString_2  = new String("");
                                      String sMnthString_3  = new String("");
                                      String sMnthString_4  = new String("");
                                      String sMnthString_5  = new String("");
                                      String sMnthString_6  = new String("");
                                      String sMnthString_7  = new String("");
                                      String sMnthString_8  = new String("");
                                      String sMnthString_9  = new String("");
                                      String sMnthString_10 = new String("");
                                      String sMnthString_11 = new String("");
                                      String sMnthString_12 = new String("");
                                      String sMnthString_13 = new String("");
                                      String sBgt_seq       = new String("");
                                      String sPubMkr = new String("N");
                                      String sBgtLvl = new String("1");
                                      String sBgtVer = new String("1");
                                      String sBgtFnl = new String(" ");

                                      for(int i=0;i<i_Rows;i++){
      
                                       //System.out.println("index i"+i);
                                       //System.out.println("sEachRow[i]:"+sEachRow[i]);
                                          sEachCol = sEachRow[i].split("\\|");
                                       
                                       //System.out.println("C: "+sEachCol.length);
                                          for(int j =0 ; j<i_Cols; j++){
   
                                        //  System.out.println("index j"+j);
                                             eachElem[i][j] = sEachCol[j];
                                   //       System.out.println("Each Elem["+(i)+"]["+(j)+"]:"+eachElem[i][j]);
   

                                          }
   
                                          sMnthString_1  = "";
                                          sMnthString_2  = "";
                                          sMnthString_3  = "";
                                          sMnthString_4  = "";
                                          sMnthString_5  = "";
                                          sMnthString_6  = "";
                                          sMnthString_7  = "";
                                          sMnthString_8  = "";
                                          sMnthString_9  = "";
                                          sMnthString_10 = "";
                                          sMnthString_11 = "";
                                          sMnthString_12 = "";
                                          sMnthString_13 = "";
                                          sBgt_seq       = "";

                                          sMnthString_1 = eachElem[i][0];
                                          sMnthString_2 = eachElem[i][1];
                                          sMnthString_3 = eachElem[i][2];
                                          sMnthString_4 = eachElem[i][3];
                                          sMnthString_5 = eachElem[i][4];
                                          sMnthString_6 = eachElem[i][5];
                                          sMnthString_7 = eachElem[i][6];
                                          sMnthString_8 = eachElem[i][7];
                                          sMnthString_9 = eachElem[i][8];
                                          sMnthString_10 = eachElem[i][9];
                                          sMnthString_11 = eachElem[i][10];
                                          sMnthString_12 = eachElem[i][11];
                                          sMnthString_13 = eachElem[i][12];
                                          sBgt_seq       = eachElem[i][13];

                                          if((i+1)==i_Rows){

                                             sLastRecMkr="Y";
   
                                          }else{

                                             sLastRecMkr="N";
                                          }

                                          if(i==0){
                                             System.out.println("SEC_CD"+sSec_cd+",sStn_cd:"+sStn_cd+"Bgt_yr:"+sBgt_yr);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_1:"+sMnthString_1);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_2:"+sMnthString_2);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_3:"+sMnthString_3);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_4:"+sMnthString_4);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_5:"+sMnthString_5);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_6:"+sMnthString_6);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_7:"+sMnthString_7);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_8:"+sMnthString_8);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_9:"+sMnthString_9);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_10:"+sMnthString_10);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_11:"+sMnthString_11);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_12:"+sMnthString_12);
                                             System.out.println("BGT_SEQ"+sBgt_seq+",sMnthString_13:"+sMnthString_13);

                                          }
                                          System.out.println("XXXXX_BGT_SEQ:"+sBgt_seq+",Lastr Rec Mrk"+sLastRecMkr);
                                          cstmt = mk.con.prepareCall( "{call DPD_INS_BGT_NEW(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"+
                                                                          "?,?,?,?,?,?,?,?,?)}");
   
                                          System.out.println("HERE");
                                          cstmt.setString(1,sBgt_yr);
                                          cstmt.setString(2,sSec_cd);
                                          cstmt.setString(3,sStn_cd);
                                          cstmt.setString(4,sBgt_seq);
                                          cstmt.setString(5,sMnthString_1);
                                          cstmt.setString(6,sMnthString_2);
                                          cstmt.setString(7,sMnthString_3);
                                          cstmt.setString(8,sMnthString_4);
                                          cstmt.setString(9,sMnthString_5);
                                          cstmt.setString(10,sMnthString_6);
                                          cstmt.setString(11,sMnthString_7);
                                          cstmt.setString(12,sMnthString_8);
                                          cstmt.setString(13,sMnthString_9);
                                          cstmt.setString(14,sMnthString_10);
                                          cstmt.setString(15,sMnthString_11);
                                          cstmt.setString(16,sMnthString_12);
                                          cstmt.setString(17,sMnthString_13);
                                          cstmt.setString(18,sBgtLvl);
                                          cstmt.setString(19,sPubMkr);
                                          cstmt.setString(20,sBgtFnl);
                                          cstmt.setString(21,sBgtVer);
                                          cstmt.setString(22,sEcode);
                                          cstmt.registerOutParameter(23,OracleTypes.NUMBER);
                                          cstmt.setString(24,sLastRecMkr);
                                          //System.out.println("XXX");
                                          //System.out.println(sBgt_yr+","+sSec_cd+","+sStn_cd+","+sBgt_seq+","+sBgtLvl+","+sPubMkr);
                                          //System.out.println(sBgtFnl+","+sBgtVer+","+sEcode+","+sLastRecMkr);
                                          cstmt.execute();
                                          System.out.println("YYY");

                                          //System.out.println("DPD_INS_BGT_NEW PROCEDURE CALLED FOR BGT_SEQ"+sBgt_seq+"iteration:"+i);

                                          iRet = cstmt.getInt(23);
                                          System.out.println("PROCEDURE DPD_INS_BGT_NEW RETURNED VALUES:"+iRet);

                                          cstmt.close();
                                          cstmt = null;
                                          System.out.println("DPD_INS_BGT_NEW cstmt closed");

                                          if(iRet==0){

                                             break;

                                          }

                                      }

                                      if(iRet == 1){

                                          System.out.println("DPD_COMPUTE_FOR_GEN_BGT STARTED"+sBgt_yr+","+sStn_cd+","+sSec_cd);
                                          cstmt = mk.con.prepareCall( "{call DPD_COMPUTE_FOR_GEN_BGT(?,?,?,?)}");

                                          cstmt.setString(1,sBgt_yr);
                                          cstmt.setString(2,sStn_cd);
                                          cstmt.setString(3,sSec_cd);
                                          cstmt.registerOutParameter(4,OracleTypes.NUMBER);

                                          cstmt.execute();
                                          iRet = cstmt.getInt(4);
                                          System.out.println("DPD_COMPUTE_FOR_GEN_BGT RETURNED VALUES"+iRet);

                                          cstmt.close();
                                          cstmt = null;
                                          System.out.println("DPD_COMPUTE_FOR_GEN_BGT cstmt closed");

                                      }


                                      if(iRet==1){
                                         System.out.println("PROCEDURE DPD_INS_BGT_NEW,DPD_COMPUTE_FOR_GEN_BGT FOR INSERTION SUCCESS");
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

                                             System.out.println("PROCEDURE DPD_INS_BGT_POSITION INSERTION SUCCESS");

                                         }else{

                                            if(iRet1 == 2){

                                               System.out.println("ROW ALREADY EXISTS IN BGT POSITION FOR STN,SEC,YR"+sStn_cd+","+sSec_cd+","+sBgt_yr);

                                            }else{

                                                 if(iRet1 == 0){

                                                    System.out.println("ERROR OCCURED WHILE INSERTING RECS IN BGT POSITION FOR STN,SEC,YR"+sStn_cd+","+sSec_cd+","+sBgt_yr);
   
                                                 }
   
                                            }

                                         }

                                         cstmt.close();
                                         cstmt = null;
                                         System.out.println("DPD_INS_BGT_POSITION cstmt closed");
                                    
                                      }else{
                                         System.out.println("PROCEDURE DPD_INS_BGT_BBGS INSERTION FAILED FOR BGT SEQ"+sBgt_seq);
                                      }

                                    }else{
                                         System.out.println("PROCEDURE DPD_DEL_BGT_DATA FAILED");
                                    }
                                }else{

                                   System.out.println("UPDATION OF BGT_FORM2B_DATA_BBGS");
                                   String sMM_order = new String("");

                                   for(int i = 0; i< i_Rows ; i++){
                                       iRet=0;
                                       if((i+1)==i_Rows){

                                          sLastRecMkr="Y";

                                       }else{

                                          sLastRecMkr="N";

                                       }

                                       //System.out.println("index i"+i);
                                       //System.out.println("sEachRow[i]:"+sEachRow[i]);
                                       sEachCol = sEachRow[i].split("\\|");
                                    
                                       //System.out.println("C: "+sEachCol.length);
                                       for(int j =0 ; j<i_Cols; j++){

                                        //  System.out.println("index j"+j);
                                           eachElem[i][j] = sEachCol[j];
                                        // System.out.println("Each Elem["+(i)+"]["+(j)+"]:"+eachElem[i][j]);


                                       }

                                       System.out.println("UUUU");

                                       int iCol_indx = Integer.parseInt(eachElem[i][1]); 
                                       System.out.println("iCol_indx"+iCol_indx);

                                       if(iCol_indx==3 ){
                                              sMM_order = "1";
                                        }else{

                                              if(iCol_indx==4 ){
                                                 sMM_order = "2";
                                              }else{

                                                 if(iCol_indx==5 ){
                                                    sMM_order = "3";
                                                 }else{

                                                    if(iCol_indx==6 ){
                                                       sMM_order = "4";
                                                    }else{

                                                       if(iCol_indx==7 ){
                                                         sMM_order = "5";
                                                       }else{

                                                            if(iCol_indx==8 ){
                                                               sMM_order = "6";
                                                            }else{

                                                               if(iCol_indx==9 ){
                                                                   sMM_order = "7";
                                                                }else{

                                                                    if(iCol_indx==10 ){
                                                                       sMM_order = "8";
                                                                    }else{

                                                                         if(iCol_indx==11 ){
                                                                            sMM_order = "9";
                                                                         }else{

                                                                           if(iCol_indx==12 ){
                                                                              sMM_order = "10";
                                                                           }else{

                                                                                if(iCol_indx==13 ){
                                                                                   sMM_order = "11";
                                                                                }else{

                                                                                  if(iCol_indx==14 ){
                                                                                     sMM_order = "12";
                                                                                  }else{

                                                                                         if(iCol_indx==15 ){
                                                                                            sMM_order = "13";
                                                                                         }else{

                                                                                         }

                                                                                   }
                                                                                }

                                                                             }

                                                                          }

                                                                       }

                                                                  }
                                                               }

                                                            }

                                                        }

                                                    }

                                               }
                                           }
                                           cstmt = mk.con.prepareCall( "{call DPD_UPD_BGT_NEW(?,?,?,?,?,?,"+
                                                                           "?,?,?,?)}");

                                           cstmt.setString(1,sBgt_yr);
                                           cstmt.setString(2,sSec_cd);
                                           cstmt.setString(3,sStn_cd);
                                           cstmt.setString(4,eachElem[i][3]);
                                           cstmt.setString(5,sMM_order);
                                           cstmt.setString(6,eachElem[i][0]);
                                           cstmt.setString(7,sEcode);
                                           cstmt.registerOutParameter(8,OracleTypes.NUMBER);
                                           cstmt.setString(9,sLastRecMkr);
                                           cstmt.setInt(10,iCol_indx);

                                              System.out.println("setString at 1"+sBgt_yr);
                                              System.out.println("setString at 2"+sSec_cd);
                                              System.out.println("setString at 3"+sStn_cd);
                                              System.out.println("setString at 4"+eachElem[i][3]);
                                              System.out.println("setString at 5"+sMM_order);
                                              System.out.println("setString at 6"+eachElem[i][0]);
                                              System.out.println("setString at 7"+sEcode);
                                              System.out.println("setString at 9"+sLastRecMkr);
                                              System.out.println("setString at 10"+iCol_indx);

                                           System.out.println("TTTT");
                                           cstmt.execute();
                                           System.out.println("MMMM");
                                           iRet = cstmt.getInt(8);
                                           System.out.println("JJJJ");

                                           cstmt.close();
                                           cstmt = null;
                                           System.out.println("DPD_UPD_BGT_NEW cstmt closed");

                                           System.out.println("PROCEDURE DPD_UPD_BGT_NEW RETURNED VALUES="+iRet);
                                           System.out.println("Callable Statement Closed For PROCEDURE DPD_UPD_BGT_NEW ");

                                           if(iRet==0){

                                               break;

                                           }

                                   }

                                   if(iRet == 1){

                                          System.out.println("DPD_COMPUTE_FOR_GEN_BGT STARTED"+sBgt_yr+","+sStn_cd+","+sSec_cd);
                                          cstmt = mk.con.prepareCall( "{call DPD_COMPUTE_FOR_GEN_BGT(?,?,?,?)}");

                                          cstmt.setString(1,sBgt_yr);
                                          cstmt.setString(2,sStn_cd);
                                          cstmt.setString(3,sSec_cd);
                                          cstmt.registerOutParameter(4,OracleTypes.NUMBER);

                                          cstmt.execute();
                                          iRet = cstmt.getInt(4);
                                          System.out.println("DPD_COMPUTE_FOR_GEN_BGT RETURNED VALUES"+iRet);

                                          cstmt.close();
                                          cstmt = null;
                                          System.out.println("Callable Statement Closed For PROCEDURE DPD_COMPUTE_FOR_GEN_BGT");

                                   }
                                   if(iRet==1){
                                      System.out.println("UPDATION OF BGT_FORM2B_DATA_NEW,DPD_COMPUTE_FOR_GEN_BGT SUCCEEDED");

                                   }else{

                                      System.out.println("UPDATION OF BGT_FORM2B_DATA_NEW,DPD_COMPUTE_FOR_GEN_BGT FAILED");
                                   }


                                }

                                mk.con.close();
                                System.out.println("mk.con.closed");

                                if(((sIns_Upd_Mkr.equals("I"))&&((iRet_aft_del==1)&&(((iRet1==1)||(iRet1==2))&&iRet==1))) || (sIns_Upd_Mkr.equals("U")&&(iRet==1))){


%>
<script>

     alert("BUDGET SYSTEM :\n\nDATA UPDATED/INSERTED SUCCESSFULLY");
     window.parent.selfSubmit(); 

</script>
<%



                                }else{

                                     if((sIns_Upd_Mkr.equals("I"))&&(iRet_aft_del==2)){

%>
<script>

     alert("BUDGET SYSTEM :\n\nDATA NOT UPDATED/INSERTED;\n\n PLEASE RE-TRY AS SOME ONE ELSE MIGHT BE INSERTING FOR SAME STATION, SECTION AND BUDGET YEAR");
     window.parent.selfSubmit(); 

</script>
<%

                                     }else{
%>
<script>

     alert("BUDGET SYSTEM :\n\nDATA NOT UPDATED/INSERTED");
     window.parent.selfSubmit(); 

</script>
<%
                                     }
                                }


                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("In EXCEPTION of gen_insert_upd_new.jsp");

                } finally {

                    System.out.println("In Finally of gen_insert_upd_new.jsp");
                    try {
                        if (cstmt != null) {
                            System.out.println("finally callable statement closed");
                            cstmt.close();
                            cstmt=null;
                        }
                        if (mk != null) {
                            System.out.println("finally connection closed");
                            mk.con.close();
                            mk=null;
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }


%>

</html>
