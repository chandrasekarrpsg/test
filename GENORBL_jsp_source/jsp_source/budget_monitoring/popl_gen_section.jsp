<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<%

 MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
 String stn_cd           = request.getParameter("stn_cd") ;
 String stn_cd_act       = new String("");
 String sOut             = new String("");
 PreparedStatement PSdt1 = null;
 ResultSet rsdt1         = null;

 try 
 {
if(!stn_cd.equals("ALL")){

if(stn_cd.equals("BBGS")){
   stn_cd_act="B";
}else if(stn_cd.equals("TGS")){
   stn_cd_act="T";
}else if(stn_cd.equals("SGS")){
   stn_cd_act="S";
}else if(stn_cd.equals("NCGS")){
   stn_cd_act="S";
}else if(stn_cd.equals("CTM")){
   stn_cd_act="C";
}else if(stn_cd.equals("EDGE")){
   stn_cd_act="E";
}else{
   stn_cd_act=stn_cd;
}

 PSdt1 = mk.con.prepareStatement(" select distinct section_cd "+ 
                                    " from BGT_CD_SECTION "+
				    " where station_cd like decode(?,'ALL','%',?) "+
                                    " order by section_cd ");
 PSdt1.setString(1,stn_cd_act);
 PSdt1.setString(2,stn_cd_act);
 rsdt1 = PSdt1.executeQuery();

 while(rsdt1.next())
 {
   sOut=sOut+rsdt1.getString(1)+"@"+rsdt1.getString(1)+"~";
 }
 
 rsdt1.close();
 PSdt1.close();

System.out.println("sout:"+sOut);

}else{
   sOut=sOut+"ALL"+"@"+"ALL"+"~";
}
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

