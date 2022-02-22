
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="genOrblJavaPackage.*" %>




<html>
 <head>
 <title>ORDER LETTER</title>
 <script type="text/javascript" src ="printSpl.js">

function showAlert_P(){

}


 </script>
<style type="text/css"> 
.showScrollTab {
   position:absolute ;
   top:370px;
   left:25px;
   }
.style1{
                background-color:#d6e3bc;
                font-family:Verdana;
                font-size:13px;
                font-weight:bold;
                text-align:center;
}
.style3{
				border-color: #BE8314;
				border-width: 1px;
				background-color: #DB9C3E;
				font-family: Verdana;
				font-size: x-small;
				color: #913022;
				font-weight: bold;
}
.style4{
                background-color:#b6dde8;
                font-family:Verdana;
                font-size:13px;
 
}
.style6 {
				border-color: #D5611C;
				border-width: 1px;
				background-color: #9EBFF1;
				font-family: Verdana;
				font-size: 13px;
				color: #4B02E3;
}
.style7 {
				border-color: #D5611C;
				border-width: 1px;
				background-color:#FFFF99;
				font-family: Verdana;
				font-size: 13px;
				color: #4B02E3;
}
</style>

</head>

<body>
<%

  String ip      = request.getRemoteAddr();
  String str   = request.getParameter("D0");
  String status  =new String();  ;


   if (!str.equals("0")) {



    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    ResultSet         rs     = null;
    CallableStatement cs = null ;
    mk.con.setAutoCommit(false);


    try{
  

       try {
                 cs = mk.con.prepareCall( "{call dpd_send_to_fin(?,?)}");
                 cs.registerOutParameter(2, OracleTypes.VARCHAR);
                 cs.setString(1,str) ;
                 cs.execute();

                 status = cs.getString(2) ;

                 cs.close() ;


           }catch(Exception e){System.out.println(" Message :" + e.getMessage() ); }
           finally{
              try{
                   System.out.println(" CLOSED");
                 } catch(Exception c){}
           }

          if (status.equals("2")) {
%>
          <script type="text/javascript">
             parent.showAlert_1() ;            
          </script>
<%
          }
          else if (status.equals("1")) {
%>
          <script type="text/javascript">
             parent.showAlert() ;            
          </script>
<%
          }
          else{
%>
          <script type="text/javascript">
             parent.showAlert_err() ;            
          </script>
<%
          }
      mk.con.commit();

      }catch(Exception ee){ ee.printStackTrace();}
         finally{System.out.println(" fin_lot_bill_entry_upd.jsp CLOSED !!!"); mk.con.close(); }

}
%>
<form>
<input type=button name=b1 value="OK" />
</form>
</body>
</html>
