<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<%
      String NA="";
      String flag="0";

      MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{

      PreparedStatement ps0  = mk.con.prepareStatement(" SELECT login_id||'~' FROM ADM_LOGIN_MST "+
                                                       " WHERE  login_id = ? AND login_passwd = enc_dec.encrypt(?) ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps0.setString(1,request.getParameter("chgusr"));
      ps0.setString(2,request.getParameter("pwd1"));

      ResultSet rs0=ps0.executeQuery();

       while(rs0.next())
          {
            NA=NA+rs0.getString(1);
            flag="1";
          }

      if (flag=="0")
         {
            NA=NA+"@~";
         }
       

      rs0.close();
      ps0.close();

      PreparedStatement ps1  = mk.con.prepareStatement(" UPDATE ADM_LOGIN_MST "+
                                                       " SET  login_passwd = enc_dec.encrypt(?) "+
                                                       " WHERE  login_id = ? AND login_passwd = enc_dec.encrypt(?) ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps1.setString(1,request.getParameter("pwd3"));
      ps1.setString(2,request.getParameter("chgusr"));
      ps1.setString(3,request.getParameter("pwd1"));

      int c0=ps1.executeUpdate();

      ps1.close();

      mk.con.commit();

      mk.con.close();

        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(NA);

   }catch(Exception e){System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println("    CLOSED !!!!!");
                    }
               }

%>

