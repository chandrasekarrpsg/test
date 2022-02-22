<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%
String EMPCD = request.getParameter("empcd");
String NA="";

      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
      System.out.println("EMPCD response"+EMPCD);
    if (EMPCD!=null)
     {
    
      PreparedStatement ps  = mk.con.prepareStatement(" select E.EMP_GENSTN||'~'||E.EMP_CODE||'~'||trim(E.EMP_FNAME)||'~'||trim(E.EMP_LNAME)  "+
                              " ||'~'||E.EMP_DESG||'~'||E.EMP_LEVEL||'~'||to_char(E.EMP_JOIN_DT,'dd-MON-rrrr')||'~'||  "+
                              " to_char(E.EMP_TRANSFER_DT,'dd-MON-rrrr')||'~'||to_char(E.EMP_TERM_DT,'dd-MON-rrrr')||'~'||  "+
                              " NVL(enc_dec.decrypt(L.LOGIN_PASSWD),'@')||'~'||LOGIN_VIP_IP||'~'||NVL(login_adm_mkr,'@')||'~'||E.CRT_BY||'~'||  "+
                              " to_char(E.CRD_DT,'dd-MON-rrrr')||'~'||E.UPD_BY||'~'||to_char(E.UPD_DT,'dd-MON-rrrr')   "+
                              " from ADM_EMP_MST E,ADM_DESG_MST D,CD_STATION S,ADM_LOGIN_MST L  "+
                              " where E.EMP_DESG = D.DESG_CODE  "+
                              " and   E.EMP_GENSTN = S.ORBL_STATION_CD  "+
                              " and   E.EMP_CODE = L.LOGIN_ID  "+
                              " and   E.EMP_CODE = ? ",
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

