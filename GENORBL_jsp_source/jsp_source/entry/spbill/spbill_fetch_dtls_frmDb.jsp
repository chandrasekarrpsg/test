<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.File"%>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>
<%

String callNm = request.getParameter("callName");
String dtls="";
boolean rcrdFound = false;
MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
       mk.con.setAutoCommit(false);


  try{
         PreparedStatement ps=null;
         ResultSet rs=null;
         String qry1 = "";

    if (callNm!=null)
     {
   if(callNm.equals("GS")){

    String long_desc = "";
         qry1 =    " select STATION_LONG_DESC    "+
                                            " from CD_STATION   "+
                                            " where ORBL_STATION_CD = ?                   "+
                                             "";


      ps  = mk.con.prepareStatement(qry1);

      ps.setString(1,request.getParameter("genStnCd"));
      rs=ps.executeQuery();
       if(rs.next())
          {
            long_desc =  rs.getString(1);
          }

      rs.close();
      ps.close();
      
      rs=null; 
      ps=null; 


      qry1 =    " select distinct d1.ORDER_DEPT , d1.DEPT    "+
                                            " from ORBL_CD_DEPT d1 ,ORBL_CD_DEPT_MST d2  "+
                                            " where d1.LOGIN_DEPT = d2.DEPT_SDESC          "+
                                            " and d1.STATION = d2.STATION                   "+
                                            " and d2.STATION = ?                   "+
                                            " and d2.DEPT = ?                          "+
                                            "  order by d1.ORDER_DEPT   ";


      ps  = mk.con.prepareStatement(qry1);

      ps.setString(1,request.getParameter("genStnCd"));
      ps.setString(2,request.getParameter("lognDeptCd"));
      rs=ps.executeQuery();
       while(rs.next())
          {
            dtls =dtls+rs.getString(2)+"~"+ rs.getString(1)+"|";
            rcrdFound = true ;
          }

      rs.close();
      ps.close();

 qry1 = " select   UNIT_ERP, "+
                    "          UNIT_DESC   "+
                    "  from ORBL_CD_UNIT           "+
                    "  where STATION = ?  order by UNIT_DESC  ";

      ps  = mk.con.prepareStatement(qry1);

      ps.setString(1,request.getParameter("genStnCd"));
      rs=ps.executeQuery();
    dtls = dtls+"&&";
       while(rs.next())
          {
            dtls =dtls+rs.getString(1)+"~"+ rs.getString(2)+"|";
            rcrdFound = true ;
          }

      rs.close();
      ps.close();

    dtls = long_desc+"$$"+dtls;
   System.out.println("dtls:  "+dtls);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(dtls);

    }else if(callNm.equals("P")) {
    System.out.println("parameter : jbType  "+  request.getParameter("jbType") +" genStnCd  : "+request.getParameter("genStnCd")+" unit cd "+request.getParameter("untCd"));
     String var1 = "";
       if(request.getParameter("jbType").equals("M")){
            var1 = " M_CC is not null ";
       }else if(request.getParameter("jbType").equals("O")){
            var1 = " O_CC is not null ";
       }
            qry1 = " select   PLANT_REF, "+
                    "          PLANT_DESC   "+
                    "  from ORBL_CD_PLANT           "+
                    "  where STATION = ? "+
                    "  AND UNIT like '%'||?||'%'        "+
                    "  AND "+  var1 +
                    "  order by PLANT_DESC  ";

      ps  = mk.con.prepareStatement(qry1);

      ps.setString(1,request.getParameter("genStnCd"));
      ps.setString(2,request.getParameter("untCd"));
      rs=ps.executeQuery();
       while(rs.next())
          {
            dtls =dtls+rs.getString(1)+"~"+ rs.getString(2)+"|";
            rcrdFound = true ;
          }

      rs.close();
      ps.close();


   System.out.println("dtls:  "+dtls);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(dtls);
 
     }else if(callNm.equals("EQ")) {
    System.out.println("parameter : plntref  "+  request.getParameter("plntref") +" genStnCd  : "+request.getParameter("genStnCd"));
            qry1 = " select   EQUIPMENT, "+
                    "          EQUIPMENT_DESC   "+
                    "  from ORBL_CD_EQUIPMENT           "+
                    "  where STATION = ? "+
                    "  AND PLANT_REF = ?        "+
                    "  order by EQUIPMENT_DESC  ";

      ps  = mk.con.prepareStatement(qry1);

      ps.setString(1,request.getParameter("genStnCd"));
      ps.setString(2,request.getParameter("plntref"));
      rs=ps.executeQuery();
       while(rs.next())
          {
            dtls =dtls+rs.getString(1)+"~"+ rs.getString(2)+"|";
            rcrdFound = true ;
          }

      rs.close();
      ps.close();


   System.out.println("dtls:  "+dtls);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(dtls);

     }else if(callNm.equals("VNDRDTLS")) {
    System.out.println("parameter : vndrCd  "+  request.getParameter("vndrCd") +" genStnCd  : ");
            qry1 = " select   VENDOR_NAME , "+
                    "          ADDRESS1 ,   "+
                    "          nvl(ADDRESS2,' ') ,  "+
                    "          nvl(ADDRESS3,' ') ,  "+
                    "          nvl(ADDRESS4,' ') ,  "+
                    "          nvl(ADDRESS5,' ')   "+
                    "  from ORBL_VENDOR_MST           "+
                    "  where VENDOR_CODE = ? "+
                    "  order by VENDOR_NAME  ";

      ps  = mk.con.prepareStatement(qry1);

      ps.setString(1,request.getParameter("vndrCd"));
      rs=ps.executeQuery();
       if(rs.next())
          {
            dtls =dtls+rs.getString(1)+"|"+ rs.getString(2)+"|"+rs.getString(3)+"|"+rs.getString(4)+"|"+rs.getString(5)+"|"+rs.getString(6)+"|";
            rcrdFound = true ;
          }

      rs.close();
      ps.close();


   System.out.println("dtls:  "+dtls);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(dtls);

     }else if(callNm.equals("SPBILLNO_VNDRNM")) {


            String action_type_str = "";
             action_type_str = request.getParameter("action_type_str");
           

            System.out.println("  action_type_str:  "+action_type_str);
           if(action_type_str.equals("E")){

            qry1 =  "  select  BILLREF ,  nvl(BILL_NO,' ')||'---'||ovm.VENDOR_NAME bill_no_dtl   "+
                    "     from ORBL_SPBILL_DTL osd ,                                       "+
                    "          ORBL_VENDOR_MST ovm                                         "+
                    "      where nvl(osd.BILL_CANCEL,'N') = 'N'                                     "+
                    "        and osd.BILL_NO is not null                                   "+
                    "        and nvl(osd.BILL_REF_ID,0) =0                                   "+
                    "        and  trunc(osd.BILL_RELEASE_DATE) >= to_date(?,'dd-Mon-yyyy')           "+
                    "        and  trunc(osd.BILL_RELEASE_DATE) <= to_date(?,'dd-Mon-yyyy')           "+
                    "        and ovm.VENDOR_CODE = osd.VENDOR                              "+
                    "        and  osd.STATION = ? and osd.DEPT in( select distinct d1.DEPT    "+
                    "                                          from ORBL_CD_DEPT d1 ,   "+
                    "                                              ORBL_CD_DEPT_MST d2  "+
                    "                                          where d1.LOGIN_DEPT = d2.DEPT_SDESC  "+
                    "                                           and d1.STATION = d2.STATION  "+
                    "                                           and d2.STATION = ?  "+
                    "                                           and d2.DEPT = ? )      "+
                    "  order by bill_no_dtl  ";


       System.out.println(" qry1 spbill edit : "+qry1);
            ps  = mk.con.prepareStatement(qry1);
      ps.setString(1,request.getParameter("frm_dt"));
      ps.setString(2,request.getParameter("to_dt"));
      ps.setString(3,request.getParameter("stn_str"));
      ps.setString(4,request.getParameter("stn_str"));
      ps.setString(5,request.getParameter("dept_str"));

            }else if(action_type_str.equals("C")){

               String admin_mlr = "";
                 admin_mlr = request.getParameter("admin_mkr_str");
                if(admin_mlr.equals("G")){
                  qry1 =  "  select  BILLREF ,  nvl(BILL_NO,' ')||'---'||ovm.VENDOR_NAME bill_no_dtl   "+
                    "     from ORBL_SPBILL_DTL osd ,                                       "+
                    "          ORBL_VENDOR_MST ovm                                         "+
                    "      where nvl(osd.BILL_CANCEL,'N') = 'N'                            "+
                    "        and osd.BILL_NO is not null                                   "+
                    "        and nvl(osd.BILL_REF_ID,0) =0                                 "+
                    "        and  trunc(osd.BILL_RELEASE_DATE) >= to_date(?,'dd-Mon-yyyy')           "+
                    "        and  trunc(osd.BILL_RELEASE_DATE) <= to_date(?,'dd-Mon-yyyy')           "+
                    "        and ovm.VENDOR_CODE = osd.VENDOR                              "+
                    "        and  osd.STATION = ?                                          "+
                    "  order by bill_no_dtl                                                ";

       System.out.println(" qry1 spbill cancel  for G mrkr : "+qry1);
            ps  = mk.con.prepareStatement(qry1);
      ps.setString(1,request.getParameter("frm_dt"));
      ps.setString(2,request.getParameter("to_dt"));
      ps.setString(3,request.getParameter("stn_str"));

                }else{

               qry1 =  "  select  BILLREF ,  nvl(BILL_NO,' ')||'---'||ovm.VENDOR_NAME bill_no_dtl   "+
                    "     from ORBL_SPBILL_DTL osd ,                                       "+
                    "          ORBL_VENDOR_MST ovm                                         "+
                    "      where nvl(osd.BILL_CANCEL,'N') = 'N'                            "+
                    "        and osd.BILL_NO is not null                                   "+
                    "        and nvl(osd.BILL_REF_ID,0) =0                                 "+
                    "        and  trunc(osd.BILL_RELEASE_DATE) >= to_date(?,'dd-Mon-yyyy')           "+
                    "        and  trunc(osd.BILL_RELEASE_DATE) <= to_date(?,'dd-Mon-yyyy')           "+
                    "        and ovm.VENDOR_CODE = osd.VENDOR                              "+
                    "        and osd.CRT_BY like '%:'||?                              "+
                    "  order by bill_no_dtl                                                ";

           System.out.println(" qry1 spbill  cancel for normal usr   : "+qry1+" emp_cd_str "+request.getParameter("emp_cd_str")+" frm_dt "+request.getParameter("frm_dt")+" to_dt "+request.getParameter("to_dt"));
            ps  = mk.con.prepareStatement(qry1);
      ps.setString(1,request.getParameter("frm_dt"));
      ps.setString(2,request.getParameter("to_dt"));
      ps.setString(3,request.getParameter("emp_cd_str"));
               }

           }


       rs=ps.executeQuery();
       while(rs.next())
          {
              dtls =dtls+rs.getString(1)+"~"+rs.getString(2)+"|";
              rcrdFound = true ;
          }

          rs.close();
          ps.close();
                    mk.con.close();


        System.out.println("dtls:  "+dtls);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(dtls);

       
     }

if(!rcrdFound){
//response.setStatus(HttpServletResponse.SC_NO_CONTENT);
}
        }



   }catch(Exception e){
                       e.printStackTrace(); 
         }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println(" spbill_fetch_dtls_frmDb.jsp   CLOSED !!!!!");
                    }
               }

%>

