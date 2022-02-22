
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="genOrblJavaPackage.*" %>




<html>
 <head>
 <title>ORDER LETTER</title>
 <script type="text/javascript" src ="printSpl.js"></script>
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
  String stnCd   = request.getParameter("loginStn");
  String audit   = request.getParameter("empCd")+" " +ip;
  String refId   = request.getParameter("refId");
  String letRef  = request.getParameter("letRef");
  String letDt   = request.getParameter("letDt");
  String param   = request.getParameter("param");
  String finrecvdt   = request.getParameter("finrecvdt");
  String    stat    = new String("0");
  int    cnt     = 0 ;
  int    cnt1    = 0 ;


   if (!refId.equals("0") & !refId.equals("")) {



    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    CallableStatement cs     = null ;
    ResultSet         rs     = null;
    mk.con.setAutoCommit(false);


    try{
System.out.println("SNAG fin_lot_bill_entry_upd.jsp " + stnCd+"  " + refId +" " +letRef+" " +letDt+" " +audit +" " + param +" " + finrecvdt );


      try {
                 cs = mk.con.prepareCall( "{call dpd_send_to_fin_1(?,?,?,?,?,?,?,?,?)}");
                 cs.registerOutParameter(9, OracleTypes.VARCHAR);
                 cs.setString(1,ip) ;
                 cs.setString(2,stnCd) ;
                 cs.setString(3,audit) ;
                 cs.setString(4,refId) ;
                 cs.setString(5,letRef) ;
                 cs.setString(6,letDt) ;
                 cs.setString(7,param) ;
                 cs.setString(8,finrecvdt) ;
                 cs.execute();

                 stat = cs.getString(9) ;

                 cs.close() ;


          }catch(Exception e){System.out.println(" Message :" + e.getMessage() ); }
          finally{
              try{
                   System.out.println(" CLOSED");
                 } catch(Exception c){}
          }


          
          if (stat.equals("1")) {
           if( param.equals("S") || param.equals("F") ) {
%>
  <script type="text/javascript">
     parent.showAlert();
  </script>
<%
           }
          }
          else{
%>
  <script type="text/javascript">
     parent.showAlert_err();
  </script>
<%
          }

          if (stat.equals("1")) { 
           if ( param.equals("L")) {
 
%>
  <script type="text/javascript">
     parent.showAlert_lock();
  </script>
<%
           }
          }
          else{
%>
  <script type="text/javascript">
     parent.showAlert_err();
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
