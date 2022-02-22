<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%
String IE = request.getParameter("IE");
String M1 = request.getParameter("M1");
String M2 = request.getParameter("M2");
String M3 = request.getParameter("M3");
String M4 = request.getParameter("M4");
String M5 = request.getParameter("M5");
String M6 = request.getParameter("M6");
String M7 = request.getParameter("M7");
String M8 = request.getParameter("M8");
String M9 = request.getParameter("M9");
String M10 = request.getParameter("M10");
String M11 = request.getParameter("M11");
String M12 = request.getParameter("M12");
String M13 = request.getParameter("M13");
String M14 = request.getParameter("M14");
String M15 = request.getParameter("M15");
String M16 = request.getParameter("M16");
String NA="";


      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
      System.out.println("M9 response"+M9);
    if (M9!=null)
     {
    
      PreparedStatement ps  =null;
      PreparedStatement ps1  =null;

      if(IE.equals("U"))
      {
      ps  = mk.con.prepareStatement( " update ADM_EMP_MST "+
                                              "SET EMP_FNAME=INITCAP(?), "+
                                                  "EMP_LNAME=INITCAP(?), "+
                                                  "EMP_GENSTN=?, "+
                                                  "EMP_DESG=?, "+
                                                  "EMP_LEVEL=?, "+
                                                  "EMP_JOIN_DT=to_date(?,'dd-MON-rr'), "+
                                                  "EMP_TERM_DT=to_date(?,'dd-MON-rr'), "+
                                                  "EMP_TRANSFER_DT=to_date(?,'dd-MON-rr'), "+
                                                  "UPD_BY=?, "+
                                                  "UPD_DT=SYSDATE "+
                                                  "where EMP_CODE = ? ");
       ps.setString(1,M2);
       ps.setString(2,M10);
       ps.setString(3,M1);
       ps.setString(4,M3);
       ps.setString(5,M11);
       ps.setString(6,M4);
       ps.setString(7,M5);
       ps.setString(8,M12);
       ps.setString(9,M8);
       ps.setString(10,M9);

      ps1  = mk.con.prepareStatement( " update ADM_LOGIN_MST "+
                                              "SET LOGIN_PASSWD=enc_dec.encrypt(?), "+
                                                  "LOGIN_LEVEL=?, "+
                                                  "LOGIN_ADM_MKR=?, "+
                                                  "LOGIN_VIP_IP=?, "+
                                                  "UPD_BY=?, "+
                                                  "UPD_DT=SYSDATE "+
                                                  "where LOGIN_ID = ? ");

       ps1.setString(1,M13);
       ps1.setString(2,M11);
       ps1.setString(3,M14);
       ps1.setString(4,M6);
       ps1.setString(5,M8);
       ps1.setString(6,M9);

       int n = ps.executeUpdate();
       int n1 = ps1.executeUpdate();

       if(n==1&&n1==1)
       {
       mk.con.commit();
%>
       <script>
        alert('RECORD UPDATED SUCCESSFULLY!!');
       </script>
<%
       }
       else
       {
       mk.con.rollback();
%>
       <script>
        alert('UPDATION FAILED!!');
       </script>
<%
       }

       System.out.println(" UPDT   !!   "+n);
       }
      if(IE.equals("I"))
      {
      ps  = mk.con.prepareStatement( " insert into  ADM_EMP_MST(EMP_CODE,EMP_DEPT, EMP_FNAME, EMP_LNAME, EMP_GENSTN, EMP_DESG,  "+
            " EMP_LEVEL, EMP_JOIN_DT, EMP_TERM_DT,EMP_TRANSFER_DT, "+
            " CRT_BY, CRD_DT) values "+
            " ( ?,' ',INITCAP(?),INITCAP(?),?,?,?,to_date(?,'dd-MON-rr'),to_date(?,'dd-MON-rr'),to_date(?,'dd-MON-rr'),?,to_date(?,'dd-MON-rr') "+
            " ) ");


       ps.setString(1,M9);
       ps.setString(2,M2);
       ps.setString(3,M10);
       ps.setString(4,M1);
       ps.setString(5,M3);
       ps.setString(6,M11);
       ps.setString(7,M4);
       ps.setString(8,M5);
       ps.setString(9,M12);
       ps.setString(10,M7);
       ps.setString(11,M15);

      ps1  = mk.con.prepareStatement( " insert into  ADM_LOGIN_MST(LOGIN_ID, LOGIN_PASSWD, LOGIN_LEVEL, LOGIN_ADM_MKR, LOGIN_VIP_IP, CRT_BY, CRD_DT,LOGIN_EFFECTIVE_DT  "+
            " ) values "+
            " ( ?,enc_dec.encrypt(?),?,?,?,?,to_date(?,'dd-MON-rr'),SYSDATE "+
            " ) ");


       ps1.setString(1,M9);
       ps1.setString(2,M13);
       ps1.setString(3,M11);
       ps1.setString(4,M14);
       ps1.setString(5,M6);
       ps1.setString(6,M7);
       ps1.setString(7,M15);

       int n = ps.executeUpdate();
       System.out.println(" 111INSDT   !!   "+n);
       int n1 = ps1.executeUpdate();

       System.out.println(" INSDT   !!   "+n+"      "+n1);

       if(n==1&&n1==1)
       {
       mk.con.commit();
%>
       <script>
        alert('RECORD INSERTED SUCCESSFULLY!!');
       </script>
<%
       }
       else
       {
       mk.con.rollback();
%>
       <script>
        alert('INSERTION FAILED!!');
       </script>
<%
       }

       System.out.println(" INSDT   !!   "+n);
       }

       ps.close();
       ps1.close();
       mk.con.close();

     }
   }catch(Exception e){mk.con.rollback();System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println(" UPDT   CLOSED !!!!!");
                    }
               }

%>

