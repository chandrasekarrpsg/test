<html>
<head>
<title>Menu Invoke</title>
</head>


<body>

<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<%
      String unm      = new String();
      String genstn   = new String();
      String utp      = new String();
      String passwd   = new String();
      String fnm      = new String();
      String lnm      = new String();
      String dept     = new String();
      String desig    = new String();
      String genStnCd = new String();
      String adminmkr = new String();
      String sgenshtdesc  = new String();
      String svndlvl      = new String();
      String sdptshtdesc  = new String();
      String sLoginEmpKaizenMkr  = new String();

      MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);

  try{

      PreparedStatement ps0  = mk.con.prepareStatement(" SELECT TRIM(UPPER(emp_fname))||' '||TRIM(UPPER(emp_lname)),UPPER(station_long_desc),TRIM(emp_level),NVL(enc_dec.decrypt(login_passwd),'@'),emp_fname,emp_lname,NVL(emp_dept,' '),desg_desc,emp_genstn,NVL(login_adm_mkr,'@'),UPPER(station_sht_desc),DECODE(emp_desg,'1200','1','1250','1','1300','1','1400','1','1405','1','1451','1','1503','1','1609','1','0'),dept_sdesc,NVL(kaizen_mkr,'@') FROM ADM_EMP_MST,ADM_LOGIN_MST,CD_STATION,ADM_DESG_MST,ORBL_CD_DEPT_MST "+
                                                       " WHERE  emp_code   = ? "+
                                                       " AND    emp_code   = login_id "+
                                                       " AND    emp_genstn = orbl_station_cd "+
                                                       " AND    emp_desg   = desg_code "+
                                                       " AND    emp_genstn   = station "+
                                                       " AND    emp_dept     = dept ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps0.setString(1,request.getParameter("userid"));

      ResultSet rs0=ps0.executeQuery();

       while(rs0.next())
          {
             unm      = rs0.getString(1);
             genstn   = rs0.getString(2);
             utp      = rs0.getString(3);
             passwd   = rs0.getString(4);
             fnm      = rs0.getString(5);
             lnm      = rs0.getString(6);
             dept     = rs0.getString(7);
             desig    = rs0.getString(8);
             genStnCd = rs0.getString(9);
             adminmkr = rs0.getString(10);
             sgenshtdesc  = rs0.getString(11);
             svndlvl      = rs0.getString(12);
             sdptshtdesc  = rs0.getString(13);
             sLoginEmpKaizenMkr  = rs0.getString(14);
          }

      rs0.close();
      ps0.close();


      String flag= new String();

      flag="0";

      PreparedStatement ps1  = mk.con.prepareStatement(" SELECT NVL(login_adm_mkr,'@') FROM ADM_LOGIN_MST "+
                                                       " WHERE  login_id   = ? "+
                                                       " AND    login_adm_mkr IN ('3','4') ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps1.setString(1,request.getParameter("userid"));

      ResultSet rs1=ps1.executeQuery();

       while(rs1.next())
          {
             svndlvl      = rs1.getString(1);
             flag="1";
          }

      rs1.close();
      ps1.close();


      if (flag=="0")
      {

      PreparedStatement ps2  = mk.con.prepareStatement(" SELECT DISTINCT TRIM(TO_CHAR(bgt_level)) FROM BGT_LEVEL "+
                                                       " WHERE  emp_code   = ?                                   "+
                                                       " AND    sec_cd NOT IN ('CTM')                            "+
                                                       " AND    bgt_level IN ('2')                               ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps2.setString(1,request.getParameter("userid"));

      ResultSet rs2=ps2.executeQuery();

       while(rs2.next())
          {
             svndlvl      = rs2.getString(1);
             flag="2";
          }

      rs2.close();
      ps2.close();

      }


      if (flag=="0")
      {

      PreparedStatement ps3  = mk.con.prepareStatement(" SELECT '2' FROM ADM_EMP_MST  "+
                                                       " WHERE  emp_code   = ?        "+
                                                       " AND    emp_dept IN ('30')    "+
                                                       " AND    emp_desg IN ('1200')  ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps3.setString(1,request.getParameter("userid"));

      ResultSet rs3=ps3.executeQuery();

       while(rs3.next())
          {
             svndlvl      = rs3.getString(1);
             flag="3";
          }

      rs3.close();
      ps3.close();

      }



      mk.con.close();

%>
<script>

var user,utp,unm,genstn,passwd;
var fnm,lnm,dept,desig,genStnCd,adminmkr;
var genshtdesc,vndlvl,dptshtdesc,sLoginEmpKaizenMkr;

user     = "<%= request.getParameter("userid") %>";
unm      = "<%= unm %>";
utp      = "<%= utp %>";
genstn   = "<%= genstn %>";
passwd   = "<%= passwd %>";
fnm      = "<%= fnm %>";
lnm      = "<%= lnm %>";
dept     = "<%= dept %>";
desig    = "<%= desig %>";
genStnCd = "<%= genStnCd %>";
adminmkr = "<%= adminmkr %>";
genshtdesc = "<%= sgenshtdesc %>";
vndlvl     = "<%= svndlvl %>";
dptshtdesc = "<%= sdptshtdesc %>";
sLoginEmpKaizenMkr = "<%= sLoginEmpKaizenMkr %>";

//alert("usrtp="+utp+"&usrnm="+unm+"&statn="+genstn+"&empcd="+user+"&fnm="+fnm+"&lnm="+lnm+"&dept="+dept+"&desig="+desig+"&genStnCd="+genStnCd+"&adminmkr="+adminmkr+"&genshtdesc="+genshtdesc+"&vndlvl="+vndlvl+"&dptshtdesc="+dptshtdesc);

window.open("menu1.jsp?usrtp="+utp+"&usrnm="+unm+"&statn="+genstn+"&empcd="+user+"&fnm="+fnm+"&lnm="+lnm+"&dept="+dept+"&desig="+desig+"&genStnCd="+genStnCd+"&adminmkr="+adminmkr+"&sgenshtdesc="+genshtdesc+"&svndlvl="+vndlvl+"&sdptshtdesc="+dptshtdesc+"&sLoginEmpKaizenMkr="+sLoginEmpKaizenMkr,"_self","toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1");
</script>

<%

   }catch(Exception e){System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println("    CLOSED !!!!!");
                    }
               }

%>

</body>
</html>
