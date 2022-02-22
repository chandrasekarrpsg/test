<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%
String EMPCD = request.getParameter("empcd");
String LGEMP = request.getParameter("lgemp");
String LGSTN = request.getParameter("lgstn");
String LGDPT = request.getParameter("lgdpt");
String LGLVL = request.getParameter("lglvl");
String LGADM = request.getParameter("lgadm");
String NA="";
String tmpStr="";



       if(LGLVL.equals("1"))
       tmpStr=" and   E.EMP_CODE in ( "+
              " select  M.EMP_CODE from ADM_EMP_MST M "+
              " where  M.EMP_CODE = '"+LGEMP+"'"+
              " )";

       if(LGLVL.equals("2"))
       tmpStr=" and   E.EMP_CODE in ( "+
              " select  M.EMP_CODE from ADM_EMP_MST M "+
              " where  M.EMP_GENSTN = '"+LGSTN+"'"+
              " and   M.EMP_DEPT = '"+LGDPT+"'"+
              " )";

       if(LGLVL.equals("3")||LGADM.equals("G"))
       tmpStr=" and   E.EMP_CODE in ( "+
              " select  M.EMP_CODE from ADM_EMP_MST M "+
              " where  M.EMP_GENSTN = '"+LGSTN+"'"+
              " )";

       if(LGADM.equals("A"))
       tmpStr="";

       System.out.println(" TMPSTR     "+tmpStr);

      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
      System.out.println("EMPCD response"+EMPCD);
    if (EMPCD!=null)
     {
    
      PreparedStatement ps  = mk.con.prepareStatement(" select S.STATION_LONG_DESC||'~'||E.EMP_CODE||'~'||trim(E.EMP_FNAME)||'~'||trim(E.EMP_LNAME)   "+
                              " ||'~'||D.DESG_DESC||'~'||E.EMP_LEVEL||'~'||to_char(E.EMP_JOIN_DT,'dd-MON-rrrr')||'~'||   "+
                              " to_char(E.EMP_TRANSFER_DT,'dd-MON-rrrr')||'~'||to_char(E.EMP_TERM_DT,'dd-MON-rrrr')||'~'||   "+
                              " '#########'||'~'||LOGIN_VIP_IP||'~'||DECODE(login_adm_mkr,'A','Central DBA', "+
                              " 'G','Local DBA', "+
			      " '3','Checking of Vendors', "+
			      " '4','Approval right for Vendor', "+
			      " 'P','Dual role of normal user & Manager')||'~'||E.CRT_BY||'~'||   "+
                              " to_char(E.CRD_DT,'dd-MON-rrrr')||'~'||E.UPD_BY||'~'||to_char(E.UPD_DT,'dd-MON-rrrr')||'~'||E.EMP_GENSTN     "+
        " ||'~'||NVL(trim(P.DEPT),'SELECT')||'~'||to_char(E.EMP_BIRTH_DT,'dd-MON-rrrr')||'~'||EMP_MOBILENO||'~'||EMP_TELEPHONE2||'~'||EMP_TELEPHONE3   "+
                " ||'~'||EMP_EMAIL_ID||'~'||L.BUDGET_MKR||'~'||L.ORDER_MKR||'~'||L.BILL_RELEASE_MKR||'~'||L.FIN_BILL_RCV_MKR||'~'||L.PRINT_ORD_MKR   "+
                " ||'~'||NVL(E.EMP_SPL_DEPT,'')||'~'||L.KAIZEN_MKR||'~'||L.DCM_MKR||'~'||L.IPM_MKR||'~'||L.RM_MKR||'~'||L.AM_MKR||'~'   "+
                              " from ADM_EMP_MST E,ADM_DESG_MST D,CD_STATION S,ADM_LOGIN_MST L ,ORBL_CD_DEPT_MST P   "+
                              " where E.EMP_DESG = D.DESG_CODE     "+
                              " and   E.EMP_GENSTN = S.ORBL_STATION_CD     "+
                              " and   E.EMP_CODE = L.LOGIN_ID     "+
                              " and   E.EMP_DEPT = P.DEPT(+)   "+
                              " and   E.EMP_CODE = ? "+tmpStr,
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps.setString(1,EMPCD);
      ResultSet rs=ps.executeQuery();
      mk.con.close();


       while(rs.next())
          {
            NA=NA+rs.getString(1)+"~";
          }

      System.out.println("sending response"+NA);
      rs.close();

if(EMPCD != null)
           {
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
       response.getWriter().write(NA);
                }
   else {
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
     }
   }catch(Exception e){System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println("    CLOSED !!!!!");
                    }
               }

%>

