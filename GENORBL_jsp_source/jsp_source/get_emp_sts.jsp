<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%
      String NA="";

      MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{

      PreparedStatement ps0  = mk.con.prepareStatement(" SELECT TRIM(UPPER(emp_fname))||' '||TRIM(UPPER(emp_lname))||'~'||UPPER(station_long_desc)||'~'||TRIM(emp_level)||'~'||NVL(enc_dec.decrypt(login_passwd),'@')||'~'||emp_fname||'~'||emp_lname||'~'||NVL(emp_dept,' ')||'~'||desg_desc||'~'||emp_genstn||'~'||NVL(login_adm_mkr,'@')||'~'||UPPER(station_sht_desc)||'~'||DECODE(emp_desg,'1200','1','1250','1','1300','1','1400','1','1405','1','1451','1','1503','1','1609','1','0')||'~'||dept_sdesc||'~'||NVL(kaizen_mkr,'@')||'~' FROM ADM_EMP_MST,ADM_LOGIN_MST,CD_STATION,ADM_DESG_MST,ORBL_CD_DEPT_MST  "+
                                                       " WHERE  emp_code   = ? "+
                                                       " AND    emp_code   = login_id "+
                                                       " AND    emp_genstn = orbl_station_cd "+
                                                       " AND    emp_desg   = desg_code "+
                                                       " AND    emp_genstn = station "+
                                                       " AND    emp_dept   = dept ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps0.setString(1,request.getParameter("userid"));

      ResultSet rs0=ps0.executeQuery();

       while(rs0.next())
          {
            NA=NA+rs0.getString(1);
          }

      mk.con.close();


      System.out.println("sending response"+NA);
      rs0.close();
      ps0.close();

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

