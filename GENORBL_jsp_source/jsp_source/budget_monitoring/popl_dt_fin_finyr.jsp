<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<%

 MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
 String stn_cd           = request.getParameter("stn_cd") ;
 String finyr            = request.getParameter("finyr") ;
 String sOut             = new String("");
 PreparedStatement PSdt1 = null;
 ResultSet rsdt1         = null;

 try 
 {
 PSdt1 = mk.con.prepareStatement(" select to_char(start_date,'dd/mm/rr'),to_char(end_date,'dd/mm/rr') "+
                                 " from FINNANCE_FINYR where FINANCE_FINYR=? "+
                                 " and STN=decode(?,'BBGS','016','SGS','002','TGS','014','NCGS','013','CTM','019','EDGE','042','016') "); 
 PSdt1.setString(1,finyr);
 PSdt1.setString(2,stn_cd);
 rsdt1 = PSdt1.executeQuery();

 while(rsdt1.next())
 {
   sOut=sOut+rsdt1.getString(1)+"@"+rsdt1.getString(2);
 }
 
 rsdt1.close();
 PSdt1.close();

System.out.println("sout:"+sOut);

 mk.con.close();

 }catch(Exception e){ System.out.println(e.getMessage()); e.printStackTrace();}
 finally{
         if(mk.con!=null)
           {
              mk.con.close();
           }
 }

if(stn_cd != null)
{
       response.setContentType("text/xml");
       response.setHeader("Cache-Control", "no-cache");
       response.getWriter().write(sOut);
}
else 
{
       response.setStatus(HttpServletResponse.SC_NO_CONTENT);
}
%>

