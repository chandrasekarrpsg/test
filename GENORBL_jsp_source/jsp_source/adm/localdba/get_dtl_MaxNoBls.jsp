<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%
String ORDID = request.getParameter("ordId");
String NA="";

      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
      System.out.println("ORDID response"+ORDID);
    if (ORDID!=null)
     {
    
      PreparedStatement ps  = mk.con.prepareStatement(" select OD.ORDER_NO||'~'||to_char(OD.ORDER_DATE,'dd-MON-rrrr')||'~'||trim(M.EMP_FNAME)||' '||trim(M.EMP_LNAME)||'~'||OD.JOB_DESC||'~'||OD.VENDOR_NAME||'~'|| (select count(*) from ORBL_BILL_DTL "+
                                                      " where ORDER_ID = ? "+
                                                      " and  nvl(BILL_CANCEL,'N')='N') cc "+
                                                      " from  ORBL_ORD_DTL OD , ADM_EMP_MST M "+
                                                      " where OD.ORDER_ID = ? "+
                                                      " and   OD.ORDER_BY = M.EMP_CODE(+) "+
                                                      " order by 1 ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps.setString(1,ORDID);
      ps.setString(2,ORDID);
      ResultSet rs=ps.executeQuery();


       while(rs.next())
          {
            NA=NA+rs.getString(1)+"~";
          }

      System.out.println("sending response"+NA);
      rs.close();
      ps.close();
      mk.con.close();

if(ORDID != null)
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

