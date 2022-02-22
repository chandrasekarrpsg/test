<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%
String IE = request.getParameter("IE");
String M9 = request.getParameter("M9");
String M17 = request.getParameter("M17");
String M18 = request.getParameter("M18");
String M19 = request.getParameter("M19");
String M20 = request.getParameter("M20");
String M21 = request.getParameter("M21");
String M22 = request.getParameter("M22");
String M23 = request.getParameter("M23");
String M24 = request.getParameter("M24");
String M25 = request.getParameter("M25");
String M26 = request.getParameter("M26");
String M27 = request.getParameter("M27");
String M28 = request.getParameter("M28");
String M29 = request.getParameter("M29");
String M30 = request.getParameter("M30");
String M31 = request.getParameter("M31");
String M32 = request.getParameter("M32");
String M33 = request.getParameter("M33");
String UPDBY = request.getParameter("UPDBY");
String NA="";

      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
    if (M9!=null)
     {
    
      PreparedStatement ps  =null;
      PreparedStatement ps1  =null;

      if(IE.equals("U"))
      {
      ps  = mk.con.prepareStatement( " update ADM_EMP_MST "+
                                              "SET EMP_DEPT=?, "+
                                                  "EMP_BIRTH_DT=to_date(?,'dd-MON-rr'), "+
                                                  "EMP_MOBILENO=?, "+
                                                  "EMP_TELEPHONE2=?, "+
                                                  "EMP_TELEPHONE3=?, "+
                                                  "EMP_EMAIL_ID=?, "+
                                                  "EMP_SPL_DEPT=?, "+
                                                  "UPD_BY=?, "+
                                                  "UPD_DT=SYSDATE "+
                                                  "where EMP_CODE = ? ");
       ps.setString(1,M17);
       ps.setString(2,M18);
       ps.setString(3,M19);
       ps.setString(4,M20);
       ps.setString(5,M21);
       ps.setString(6,M22);
       ps.setString(7,M28);
       ps.setString(8,UPDBY);
       ps.setString(9,M9);

      ps1  = mk.con.prepareStatement( " update ADM_LOGIN_MST "+
                                              "SET BUDGET_MKR=?, "+
                                                  "ORDER_MKR=?, "+
                                                  "BILL_RELEASE_MKR=?, "+
                                                  "FIN_BILL_RCV_MKR=?, "+
                                                  "PRINT_ORD_MKR=?, "+
                                                  "KAIZEN_MKR=?, "+
                                                  "DCM_MKR=?, "+
                                                  "IPM_MKR=?, "+
                                                  "RM_MKR=?, "+
                                                  "AM_MKR=?, "+
                                                  "UPD_BY=?, "+
                                                  "UPD_DT=SYSDATE "+
                                                  "where LOGIN_ID = ? ");

       ps1.setString(1,M23);
       ps1.setString(2,M24);
       ps1.setString(3,M25);
       ps1.setString(4,M26);
       ps1.setString(5,M27);
       ps1.setString(6,M29);
       ps1.setString(7,M30);
       ps1.setString(8,M31);
       ps1.setString(9,M32);
       ps1.setString(10,M33);
       ps1.setString(11,UPDBY);
       ps1.setString(12,M9);

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

