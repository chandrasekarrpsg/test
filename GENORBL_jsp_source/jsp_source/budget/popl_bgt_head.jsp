<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<%

 MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
 String stn_cd           = request.getParameter("stn_cd") ;
 String sOut             = new String("");
 PreparedStatement PSdt1 = null;
 ResultSet rsdt1         = null;

 try 
 {
if(stn_cd .equals("B")){
 PSdt1 = mk.con.prepareStatement(" select distinct BGT_SUBHD_ROWVAL,BGT_HD_ROWORDER, BGT_GRP_ROWORDER, BGT_SUBHD_ROWORDER "+ 
                                    " from BGT_FORM2B_STRUC_BBGS "+
                                    " where nvl(BGT_SUBHD_ROWVAL,' ')<>' ' "+
                                    " order by BGT_HD_ROWORDER, BGT_GRP_ROWORDER, BGT_SUBHD_ROWORDER ");
 rsdt1 = PSdt1.executeQuery();

}else{
 PSdt1 = mk.con.prepareStatement(" select distinct BGT_HD_ROWVAL,SL_NO_ROWORDER,BGT_HD_ROWORDER "+ 
                                    " from BGT_FORM2B_STRUC where nvl(BGT_HD_ROWVAL,' ')<>' ' "+
                                    " order by SL_NO_ROWORDER,BGT_HD_ROWORDER ");
 rsdt1 = PSdt1.executeQuery();

}

 while(rsdt1.next())
 {
   sOut=sOut+rsdt1.getString(1)+"@"+rsdt1.getString(1)+"~";
 }
 
 rsdt1.close();
 PSdt1.close();
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

