<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%
String ORDID = request.getParameter("ordId");
String M0 = request.getParameter("M0");
String M1 = request.getParameter("M1");
String NA="";

      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
      System.out.println("ORDID response"+ORDID);
    if (ORDID!=null)
     {
    
      PreparedStatement ps  =null;
      ps  = mk.con.prepareStatement( " update ORBL_ORD_DTL "+
                                              "SET BILL_FREQUENCY_REV = ?, "+
                                                  "UPD_BY=?, "+
                                                  "UPD_DT=SYSDATE "+
                                                  "where ORDER_ID=? ");
       ps.setString(1,M0);
       ps.setString(2,M1);
       ps.setString(3,ORDID);

       int n = ps.executeUpdate();

       if(n==1)
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

       ps.close();
       mk.con.close();

     }
   }catch(Exception e){System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println(" UPDT   CLOSED !!!!!");
                    }
               }

%>

