<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<%

try{
   
    String qry               = new String();
    PreparedStatement ps     = null;
    ResultSet  rs            = null;

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    mk.con.setAutoCommit(false);

    String copy          	     = new String();
    String lthd          	     = new String();

    String order_id		     = new String();
    String order_no		     = new String();
    String order_date	             = new String();
    String vendor_name	             = new String();
    String address1		     = new String();
    String address2		     = new String();
    String address3		     = new String();
    String address4		     = new String();
    String address5		     = new String();
    String clubbed		     = new String();
    String p1_q1_no		     = new String();
    String p1_q1_date	             = new String();
    String p1_labour_total	     = new String();
    String p1_material_total         = new String();
    String p1_q1_total	             = new String();
    String p1_q2_no		     = new String();
    String p1_q2_date	             = new String();
    String p1_q2_total	             = new String();
    String p1_q3_no		     = new String();
    String p1_q3_date	             = new String();
    String p1_q3_total	             = new String();
    String erp_code		     = new String();
    String order_type	             = new String();
    String budget_head	             = new String();
    String capex_scheme_no	     = new String();
    String job_desc		     = new String();
    String order_value	             = new String();
    String esi_clause	             = new String();
    String job_place	             = new String();
    String safety_related	     = new String();
    String scmp_clause   	     = new String();
    String environment_clause        = new String();
    String retention_prcnt	     = new String();
    String job_complete	             = new String();
    String station	             = new String();
    String signatory                 = new String();
    String signatory_loc             = new String();
    String l1_signatory              = new String();
    String l2_signatory              = new String();
    String l3_signatory              = new String();
    String amt_in_words              = new String();
    String other_consumables         = new String();
    String order_tax_type            = new String();

    boolean later                    = false;



    try {


     copy      = request.getParameter("cpy");
     order_id  = request.getParameter("sOrdId");

     if(request.getParameter("lthd")!= null)
                    lthd = request.getParameter("lthd");
     else
                    lthd = "no";


     System.out.println("SOUVIK GOT"+order_id);

 qry =   "  select						  " +
         "  order_id,						  " +
         "  order_no,						  " +
         "  to_char(order_date, 'dd-MON-yyyy'),		          " +
         "  v.vendor_name,					  " +
         "  NVL(v.address1, ' '),				  " +
         "  NVL(v.address2, ' '),				  " +
         "  NVL(v.address3, ' '),				  " +
         "  NVL(v.address4, ' '),				  " +
         "  NVL(v.address5, ' '),				  " +
         "  NVL(clubbed, 'N'),				          " +
         "  NVL(p1_q1_no, ' '),				          " +
         "  NVL(to_char(p1_q1_date, 'dd-MON-yyyy'), ' '),	  " +
         "  TO_CHAR(NVL(p1_labour_total, 0),'9999999,99,99,990.09'), " +
         "  TO_CHAR(NVL(p1_material_total, 0),'99999,99,99,990.09'), " +
         "  TO_CHAR(NVL(p1_q1_total, 0), '99999999,99,99,990.09'),	  " +
         "  NVL(p1_q2_no, '$'),				          " +
         "  NVL(to_char(p1_q2_date, 'dd-MON-yyyy'), '$'),	  " +
         "  TO_CHAR(NVL(p1_q2_total, 0), '99999999,99,99,990.09'),	  " +
         "  NVL(p1_q3_no, '$'),				          " +
         "  NVL(to_char(p1_q3_date, 'dd-MON-yyyy'), '$'),	  " +
         "  TO_CHAR(NVL(p1_q3_total, 0), '99999999,99,99,990.09'),	  " +
         "  NVL(erp_code, ' '),				          " +
         "  order_type,					          " +
         "  budget_head,					  " +
         "  case when trim(capex_scheme_no) is not null then '2z'||trim(capex_scheme_no) else ' ' end capex_scheme_no,	 " +
         "  job_desc,						  " +
         "  TO_CHAR(p1_total, '99999999,99,99,990.09') order_value,  " +
         "  NVL(esi_clause, '$'),                                                 " +
         "  NVL(job_place, '$'),                                                  " +
         "  NVL(safety_related, '$'),                                     " +
         "  NVL(scmp_clause, '$'),                                     " +
         "  NVL(environment_Clause, '$'),                                         " +
         "  NVL(retention_prcnt, 0),                              " +
         "  NVL(job_complete, '$'),                                       " +
         "  o.ord_orgn_stn,						  " +
         "  signatory,	                 			  " +
         "  signatory_loc,                                        " +
         "  NVL(l1_signatory,'$'),                                " +
         "  NVL(l2_signatory,'$'),                                " +
         "  NVL(l3_signatory,'$'),                                " +
         "  DPG_AMT2WORDS.DFN_AMT2WORDS2(p1_total) amt_in_words,  " +
         "  TO_CHAR(NVL(p1_others_total, 0),'9999999,99,99,990.09'), " +
         "  case when order_date < '01-jul-2017'                   " +
         "      then 'service_tax'                                " +
         "      else 'gst'                                        " +
         "  end case                                              " +
         "  from						  " +
         "  orbl_ord_dtl o,					  " +
         "  orbl_vendor_mst v,					  " +
         "  orbl_cd_signatory_mst s                               " +
         "  where						  " +
         "        o.vendor_code = v.vendor_code		          " +
         "  and   o.order_id    = ?  				  " +
         "  and   o.ord_orgn_stn   = s.station                       " +
         "  and   o.p1_total    >= s.limit1                       " +
         "  and   o.p1_total    <= s.limit2                        " ;

         ps = mk.con.prepareStatement(qry);

         ps.setString(1, order_id);

         rs = ps.executeQuery();

         while(rs.next()){


         order_id	       = rs.getString(1);
         order_no	       = rs.getString(2);
         order_date	       = rs.getString(3);
         vendor_name	       = rs.getString(4);
         address1	       = rs.getString(5);
         address2	       = rs.getString(6);
         address3	       = rs.getString(7);
         address4	       = rs.getString(8);
         address5	       = rs.getString(9);
         clubbed	       = rs.getString(10);
         p1_q1_no	       = rs.getString(11);
         p1_q1_date	       = rs.getString(12);
         p1_labour_total       = rs.getString(13);
         p1_material_total     = rs.getString(14);
         p1_q1_total	       = rs.getString(15);
         p1_q2_no	       = rs.getString(16);
         p1_q2_date	       = rs.getString(17);
         p1_q2_total	       = rs.getString(18);
         p1_q3_no	       = rs.getString(19);
         p1_q3_date	       = rs.getString(20);
         p1_q3_total	       = rs.getString(21);
         erp_code	       = rs.getString(22);
         order_type	       = rs.getString(23);
         budget_head	       = rs.getString(24);
         capex_scheme_no       = rs.getString(25);
         job_desc	       = rs.getString(26);
         order_value	       = rs.getString(27);
         esi_clause	       = rs.getString(28);
         job_place	       = rs.getString(29);
         safety_related	       = rs.getString(30);
         scmp_clause   	       = rs.getString(31);
         environment_clause    = rs.getString(32);
         retention_prcnt       = rs.getString(33);
         job_complete	       = rs.getString(34);
         station	       = rs.getString(35);
         signatory             = rs.getString(36);
         signatory_loc         = rs.getString(37);
         l1_signatory          = rs.getString(38);
         l2_signatory          = rs.getString(39);
         l3_signatory          = rs.getString(40);
         amt_in_words          = rs.getString(41);
         other_consumables     = rs.getString(42);
         order_tax_type        = rs.getString(43);

         }

         rs.close();
         ps.close();

         qry = " select to_date(?, 'dd-MON-yyyy') - to_date('22/07/2013','dd/mm/yyyy') from dual ";

         ps = mk.con.prepareStatement(qry);

         ps.setString(1, order_date);

         rs = ps.executeQuery();

         while(rs.next()){
                if(rs.getDouble(1) >= 0) later = true;
                   else                  later = false;
         }

         rs.close();
         ps.close();


%>
<html>
<head>
<title>ORDER NO : <%=order_no%> </title>
<style type="text/css">

     .c1 {
       // background-image:url('CESC_LOGO_4.jpg');
       // background-repeat:no-repeat;
     }

</style>
</head>
<body> 
<div align="center"><center>

<% /*********************** PAGE ONE STARTS  ************************************************/ %>


<% /*'*********************** Heading ************************************************* */%>
<%if(copy.equals("FILE")){ %>
<div align="center" id="printReady" style="width: 967px; height: 1270px;">

<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td colspan="2"><font face="Verdana" style = "font-size:14px"><strong>File Copy </strong></font></td>
  </tr>
<% }else if(copy.equals("VENDOR") && lthd.equals("yes")){ %>
 <div align="center" id="printReady" style="width: 967px; height: 1270px;">
<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">

   <tr>
       <td width="50%" align ="left" style="padding-left:0px;">
          <img src ="rpsg_logo.jpg" style ="height:70px;width: 170px;" alt="NO HEADER">
       </td>
       <td width="50%" align ="right" style="padding-right:0px;">
          <img src ="cesc_logo.jpg" style ="height:70px;width: 170px;" alt="NO HEADER">
       </td>
    </tr>

<% }else if(copy.equals("FINANCE")){ %>

<div align="center" id="printReady" style="width: 967px; height: 1270px;">
<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% }else{ %>

<div align="center" id="printReady" style="width: 967px; height: 1270px;">
<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>

  <tr>
    <td align="left"><font face="Verdana" style = "font-size:14px"><strong>Ref: <%=order_no%></strong></font></td>
    <td align="right"><font face="Verdana" style = "font-size:14px"><strong>Date: <%=order_date%></strong></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2"><font face="Verdana" style = "font-size:14px"><strong><%=vendor_name%></strong></font>
    &nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="5" id="cont_ad" name="cont_ad" cols="100" style="overflow: hidden; font-family: Verdana; font-size: 16px; border: medium none">
<%=address1%>
<%=address2%>
<%=address3%>
<%=address4%>
<%=address5%>
  </textarea>
    </td>
  </tr>
<% /********************** YOUR QUOTATION ETC NOT IN ORIGINAL LETTER ******************************/ %>

<% if(clubbed.equals("N")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="center" colspan="2"><font face="Verdana" style = "font-size:14px">
    <strong>Your Quotation Number :</strong>&nbsp;<%=p1_q1_no%>
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;Dated:</strong>&nbsp;<%=p1_q1_date%>
    </font></td>
  </tr>
<% } %>

<% if(clubbed.equals("Y")){ %>
     <tr>
       <td align="center" colspan="2"><font face="Verdana" style = "font-size:14px">
       <strong>Your Quotation Numbers :</strong>&nbsp;<%=p1_q1_no%>
       &nbsp;&nbsp;Dated:&nbsp;<%=p1_q1_date%>;
       </font>
   <% if(!p1_q2_no.equals("$") && !p1_q2_date.equals("$")) { %>
       <font face="Verdana" style = "font-size:14px">
       <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <%=p1_q2_no%>
       &nbsp;&nbsp;Dated:&nbsp;<%=p1_q2_date%>;
       </font>
   <% } %>
   <% if(!p1_q3_no.equals("$") && !p1_q3_date.equals("$")) { %>
       <font face="Verdana" style = "font-size:14px">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <%=p1_q3_no%>
       &nbsp;&nbsp;Dated:&nbsp;<%=p1_q3_date%>;
       </font>
   <% } %>
       </td>
       </tr>
<% } %>

<% /***************************************************************************************************/ %>

<% if(copy.equals("FILE") || copy.equals("FINANCE")){ %>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" style = "font-size:14px">
    <i>
    <strong>Account Number:</strong>&nbsp;<%=erp_code%>
    <%if(order_type.equals("O")){ %> <strong>&nbsp;&nbsp;&nbsp;&nbsp;Budget Head:</strong>&nbsp;<%=budget_head%><% } %>
    </i>
    </font></td>
  </tr>
  <%if(order_type.equals("C")){%>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" style = "font-size:14px"><i><strong>Scheme No:</strong>&nbsp;<%=capex_scheme_no%>
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;</i></font></td>
  </tr>
  <% } %>
<% } %>

<% /*************************************************************************************************/  %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" align="left" colspan="2">
    <table width="100%">
    <tr><td width="22%" valign="top">
    <font face="Verdana" style = "font-size:14px"><strong>Scope of work :&nbsp; </strong></font>
     </td><td>
     <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px" valign="top"><strong><%=job_desc%></strong></font>
     </div>
    </td></tr>
    </table>
  </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><b><font face="Verdana" style = "font-size:14px">Dear Sirs ,</font></b></td>
  </tr>
  <tr>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% /* '*********************** /Heading *************************************************/ %>

<% /* '*********************** Opening Lines ***********************************/ %>

  <tr>
    <td colspan="2" >
     <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px">
    We thank you for your above Quotation and are pleased to place this Order on you for the above mentioned job at an amount of <b>Rs. <%=order_value%></b> (Rupees <%=amt_in_words%>) based on your quoted rate.
    </div>
    </font></td>
  </tr>

<% /************************** MOTHER CLAUSE   ************************************************/ %>

<%if(job_complete.equals("N") && ( esi_clause.equals("Y") ||  environment_clause.equals("Y") || job_place.equals("I") || safety_related.equals("Y"))){ %>
  <tr>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2" >
    <div style=" text-align : justify; ">
   <font face="Verdana" style = "font-size:14px">This order is being placed on you subject to your observance of all statutory obligations and security instructions as applicable for working at our Generating Stations. 
    Also note the following terms and conditions:
    </div>
   </font></td>
  </tr>

<% /* '*********************** /Opening Lines *************************************************/ %>

<% /* '*********************** ESI Clause *************************************************/ %>

<%if(esi_clause.equals("Y")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" >
     <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px">You will be responsible for all statutory obligations under the Contract Labour (Regulation and Abolition) Act 1970, ESI Act 1948 and Employees Provident Fund and Miscellaneous Provisions Act 1952.
    </font>
    </div>
   </td>
  </tr>
<% } %>

<%/* '*********************** /ESI Clause ************************************************* */%>

<% /* '*********************** JOB PLACE *************************************************/ %>
<%

System.out.println(" SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS       : :"+ job_place);  

%>

<%if(job_place.equals("I")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2" >
     <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px">In particular you shall keep us indemnified against all claims and disputes arising out of accidents/damages to your workmen & staff, third parties and properties belonging to us. Necessary Workmen's Compensation Insurance shall be taken out by you accordingly.
    </div>
    </font></td>
  </tr>


<%/* '*********************** Safety Clause ************************************************* */%>

<% if(safety_related.equals("Y")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
      <tr>
        <td colspan="2" >
       <div style=" text-align : justify; ">
       <font face="Verdana" style = "font-size:14px">You are to ensure safety of your workers at site while working and provide all kinds of safety equipments required for the job such as helmets, safety shoes, and other applicable personal protective devices to your workmen. Before execution of the job at site you are to take necessary permits to work from the concerned department.
<% if(scmp_clause.equals("Y")){ %>
       If there is any fatal, lost work day case(lwdc), violation of safe work practices and non-availability of required quality PPEs and safety gadgets found related to this job, penalization according to CESC Ltd's present Safety consequence management policy will be applicable.
    <% } %>
      </font>
      </div></td>
      </tr>
    <% } %>

    <% /*********************** /Safety Clause *************************************************/ %>

    <% /*********************** Cleaning Clause ******NOT IN NEW LETTER************************** %>

    <% if(cleaning_cl.equals("Y")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
      <tr>
        <td colspan="2" >
       <div style=" text-align : justify; ">
       <font face="Verdana" style = "font-size:14px">Site cleaning must be done by you upto the satisfaction of the controlling officer after completion of the job. All scrap materials should be removed to the place specified by the controlling officer. A maximum penalty amounting to 5% of the order value will be applicable if scrap materials are not removed within 48 Hrs of completion of the job.
      </div>
      </font></td>
      </tr>
    <% } %>

    <% *********************** /Cleaning Clause *************************************************/ %>

    <% /*********************** ENVIRONMENT CLAUSE ************************************************/ %>

    <% if(environment_clause.equals("Y")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
      <tr>
        <td colspan="2" >
        <div style=" text-align : justify; ">
        <font face="Verdana" style = "font-size:14px">Site cleaning must be done by you upto the satisfaction of the controlling officer after completion of the job. All scrap materials should be removed to the place specified by the controlling officer. A penalty upto 5% of the order value will be applicable if scrap materials are not removed to the designated areas within 48 Hrs of completion of the job.
        </div>
      </font></td>
      </tr>
    <% } %>

    <% /*********************** /Environment Clause *************************************************/ %>

<% } %>

<% /* '*********************** /JOB PLACE *************************************************/ %>

<% /***************************************************************************************************/ %>

<%if( esi_clause.equals("Y") ||  job_place.equals("Y") ||  safety_related.equals("Y") ||  environment_clause.equals("Y")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2" >
    <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px">In addition to the terms and conditions specified above you will be required to ensure that all statutory payments as now is in force or may be applicable from time to time are made to your workmen.
    </div>
    </font></td>
  </tr>
<% } %>

<% /*******************************************************************************************/ %>

<% /*********************** Retention Clause *************************************************/ %>

<% if(!retention_prcnt.equals("0")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

  <tr>
    <td colspan="2" >
    <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px"><%=retention_prcnt%>% of the Labour component of billed value will be withheld as retention and released only after ascertaining that all terminal payments, as applicable, have been made by you.
    </div>
    </font></td>
  </tr>
<% } %>

<% /*********************** /Retention Clause *************************************************/ %>

<% } %>

<% /************************ /MOTHER CLAUSE******************************************************/ %>

<% /*********************** Job COMPLETE Clause *************************************************/ %>

<% if(job_complete.equals("N")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

  <tr>
    <td colspan="2" >
    <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px">
<% if(later){ %>
After successful completion of the aforementioned job you may please send the bill to us for payment including Taxes as applicable.
<%  }else{ %>
     After successful completion of the aforementioned job you may please send the bill to us for payment including Service tax and Works Contract Tax as applicable.
<%  } %>
    </div>
    </font></td>
  </tr>

<% } %>



<% /*********************** Job Status Clause *************************************************/ %>

<% if(job_complete.equals("Y")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2" >
    <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px">
<% if(later){ %>
Since you have already carried out the work as instructed by the Station Engineers, you may please send the bill to us for payment including Taxes as applicable.
<%  }else{ %>
     Since you have already carried out the work as instructed by the Station Engineers, you may please send the bill to us for payment including Service Tax and Works Contract Tax as applicable.
<%  } %>
    </div>
    </font></td>
  </tr>

<% } %>


<% /*********************** /Job Status Clause *************************************************/ %>

<% /*********************** Retention Clause *************************************************/ %>

<% if(!retention_prcnt.equals("0") && job_complete.equals("Y")){ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

  <tr>
    <td colspan="2" >
    <div style=" text-align : justify; ">
    <font face="Verdana" style = "font-size:14px"><%=retention_prcnt%>% of the Labour component of billed value will be with held as retention and released only after ascertaining that all terminal payments, as applicable, have been made by you.
    </div>
   </font></td>
  </tr>
<% } %>

<% /*********************** /Retention Clause *************************************************/ %>


  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2"><font face="Verdana" style = "font-size:14px">Yours faithfully,</font></td>
  </tr>
  <!--- tr>
    <td colspan="2">&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp; </td>
  </tr>
  <tr---->
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% /*********************** Signatory *************************************************/ %>

  <tr>
    <td colspan="2"><strong><font face="Verdana" style = "font-size:14px"><%=signatory%> <br>
<%=signatory_loc%>    </font></strong></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table>

<% /*********************** /Signatory *************************************************/ %>

<% if(!p1_labour_total.equals("0.00") || !p1_material_total.equals("0.00") || !other_consumables.equals("0.00") ){ %>

<table border="1" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">

<% /*********************** Service tax amount *************************************************/ %>

<% if(order_tax_type.equals("service_tax") && !p1_labour_total.trim().equals("0.00")){ %>
  <tr>
    <td align="left" width="70%"><font face="Verdana" style = "font-size:14px"><strong>Service Tax is chargeable on Amount </strong></font></td>
    <td align="right" width="30%"><font face="Verdana" style = "font-size:14px"><strong>Rs. <%=p1_labour_total%></strong></font></td>
  </tr>

<% } %>

<% /*********************** /service tax amount *************************************************/ %>
<% /*********************** Value Added tax amount *************************************************/ %>


<% if(order_tax_type.equals("service_tax") && !p1_material_total.trim().equals("0.00")){ %>
  <tr>
    <td align="left" width="50%"><font face="Verdana" style = "font-size:14px"><strong>Value Added Tax is chargeable on Amount </strong></font></td>
    <td align="right" width="50%"><font face="Verdana" style = "font-size:14px"><strong>Rs. <%=p1_material_total%></strong></font></td>
  </tr>

<% } %>

<% /*********************** /service tax amount *************************************************/ %>
<% /*********************** Other Consumables amount *************************************************/ %>


<% if(!other_consumables.trim().equals("0.00")){ %>

  <tr>
    <td align="left" width="50%"><font face="Verdana" style = "font-size:14px"><strong>Other Consumables </strong></font></td>
    <td align="right" width="50%"><font face="Verdana" style = "font-size:14px"><strong>Rs. <%=other_consumables%></strong></font></td>
  </tr>

<% } %>

<% /*********************** /Other Consumables amount *************************************************/ %>


</table>

<% } %>

<% /*********************** DGM (Finance) *************************************************/ %>

<% if(copy.equals("FINANCE")){%>
<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2" ><font face="Verdana" style = "font-size:14px">cc: The Dy. General Manager (Finance): For necessary actions as warranted in terms and conditions of this order.</font></td>
  </tr>
</table>
<% } %>
<% if(copy.equals("VENDOR") && lthd.equals("yes")){ %>
<%   if(station.equals("002")){%>
         <img src ="SGS_Footer.jpg"  style ="position:absolute; left: 0px; top: 1180px;height:70px;width: 967px;" alt="NO FOOTER">
<%    }else if(station.equals("013")){%>
         <img src ="NCGS_Footer.jpg" style ="position:absolute; left: 0px; top: 1180px;height:70px;width: 967px;" alt="NO FOOTER">
<%    }else if(station.equals("014")){%>
        <img src ="TGS_Footer.jpg"  style ="position:absolute; left: 0px; top: 1180px;height:70px;width: 967px;" alt="NO FOOTER">
<%    }else if(station.equals("016")){%>
       <img src ="BBGS_Footer.jpg" style ="position:absolute; left: 0px; top: 1180px;height:70px;width: 967px;" alt="NO FOOTER">
<%    }else if(station.equals("019")){%>
        <img src ="CTM_Footer.jpg"  style ="position:absolute; left: 0px; top: 1180px;height:70px;width: 967px;" alt="NO FOOTER">
<%    }else if(station.equals("042")){%>
        <img src ="EDGS_Footer.jpg" style ="position:absolute; left: 0px; top: 1180px;height:70px;width: 967px;" alt="NO FOOTER">
<%    } %>

<%  } %>


<% /*********************** PAGE ONE ENDS  *************************************************/ %>

<% /*********************** PAGE TWO STARTS  *************************************************/ %>

<% if(copy.equals("FILE")){%>

<%

    String p2_vendor_name               = new String();
    String p2_q1_no	  	        = new String();
    String p2_q1_date	                = new String();
    String p2_q1_total	                = new String();
    String p2_q2_no		        = new String();
    String p2_q2_date	                = new String();
    String p2_q2_total	                = new String();
    String p2_q3_no		        = new String();
    String p2_q3_date	                = new String();
    String p2_q3_total	                = new String();
 
    String p3_vendor_name               = new String();
    String p3_q1_no	  	        = new String();
    String p3_q1_date	                = new String();
    String p3_q1_total	                = new String();
    String p3_q2_no		        = new String();
    String p3_q2_date	                = new String();
    String p3_q2_total	                = new String();
    String p3_q3_no		        = new String();
    String p3_q3_date	                = new String();
    String p3_q3_total	                = new String();

    String p2_total	                = new String();
    String p3_total	                = new String();

    String amt_in_words2                = new String();
    String amt_in_words3                = new String();

    String recommendation               = new String();
    String recommendation_supplementary = new String();
    String last_edit_date               = new String();
    String order_by                     = new String();
    String last_edit_by                 = new String();

  qry =  "  select                                                " +
         "  NVL(p2_vendor_name, '$'),                             " +
         "  NVL(p2_q1_no, '$'),                                   " +
         "  NVL(to_char(p2_q1_date, 'dd-MON-yyyy'), '$'),         " +
         "  TO_CHAR(NVL(p2_q1_total, 0), '99999999,99,99,990.09'),   " +
         "  NVL(p2_q2_no, '$'),                                   " +
         "  NVL(to_char(p2_q2_date, 'dd-MON-yyyy'), '$'),         " +
         "  TO_CHAR(NVL(p2_q2_total, 0), '99999999,99,99,990.09'),   " +
         "  NVL(p2_q3_no, '$'),                                   " +
         "  NVL(to_char(p2_q3_date, 'dd-MON-yyyy'), '$'),         " +
         "  TO_CHAR(NVL(p2_q3_total, 0), '99999999,99,99,990.09'),   " +
         "  DPG_AMT2WORDS.DFN_AMT2WORDS2(NVL(p2_q1_total, 0)+NVL(p2_q2_total, 0)+NVL(p2_q3_total, 0)) amt_in_words2,  " +
         "  NVL(p3_vendor_name, '$'),                             " +
         "  NVL(p3_q1_no, '$'),                                   " +
         "  NVL(to_char(p3_q1_date, 'dd-MON-yyyy'), '$'),         " +
         "  TO_CHAR(NVL(p3_q1_total, 0), '99999999,99,99,990.09'),   " +
         "  NVL(p3_q2_no, '$'),                                   " +
         "  NVL(to_char(p3_q2_date, 'dd-MON-yyyy'), '$'),         " +
         "  TO_CHAR(NVL(p3_q2_total, 0), '99999999,99,99,990.09'),   " +
         "  NVL(p3_q3_no, '$'),                                   " +
         "  NVL(to_char(p3_q3_date, 'dd-MON-yyyy'), '$'),         " +
         "  TO_CHAR(NVL(p3_q3_total, 0), '99999999,99,99,990.09'),   " +
         "  DPG_AMT2WORDS.DFN_AMT2WORDS2(NVL(p3_q1_total, 0)+NVL(p3_q2_total, 0)+NVL(p3_q3_total, 0)) amt_in_words3,  " +
         "  NVL(recommendation_desc, '$'),                        " +
         "  NVL(recommendation_supplementary, '$') ,              " +
         "  to_char(NVL(p2_q1_total, 0)+NVL(p2_q2_total, 0)+NVL(p2_q3_total, 0), '9999999,99,99,990.09') p2_total,  " +
         "  to_char(NVL(p3_q1_total, 0)+NVL(p3_q2_total, 0)+NVL(p3_q3_total, 0), '9999999,99,99,990.09') p3_total,  " +
         "  NVL(to_char(order_date, 'dd-MON-yyyy'), ' ') order_date,                                                   " +
         "  NVL(to_char(last_edit_date, 'dd-MON-yyyy'), ' ') last_edit_date,                                           " +
         "  NVL(TRIM(e1.emp_fname), ' ') || ' ' || NVL(TRIM(e1.emp_lname), ' ') order_by,                              " +
         "  NVL(TRIM(e2.emp_fname), ' ') || ' ' || NVL(TRIM(e2.emp_lname), ' ') last_edit_by                           " +
         "  from ORBL_ORD_DTL o,                                  " +
         "  ORBL_CD_RECOMMENDATION r , adm_emp_mst e1 ,adm_emp_mst e2                             " +
         "  where order_id = ? and o.recommendation = r.recommendation(+) "                         +
         "  and   e1.emp_code(+)  = o.order_by  "+
         "  and   e2.emp_code(+)  = o.last_edit_by  ";

 ps  = mk.con.prepareStatement(qry);

 ps.setString(1, order_id);

 rs  = ps.executeQuery();

 while(rs.next()){

       p2_vendor_name               =  rs.getString(1);
       p2_q1_no                     =  rs.getString(2);
       p2_q1_date                   =  rs.getString(3);
       p2_q1_total                  =  rs.getString(4);
       p2_q2_no                     =  rs.getString(5);
       p2_q2_date                   =  rs.getString(6);
       p2_q2_total                  =  rs.getString(7);
       p2_q3_no                     =  rs.getString(8);
       p2_q3_date                   =  rs.getString(9);
       p2_q3_total                  =  rs.getString(10);
       amt_in_words2                =  rs.getString(11);
       p3_vendor_name               =  rs.getString(12);
       p3_q1_no                     =  rs.getString(13);
       p3_q1_date                   =  rs.getString(14);
       p3_q1_total                  =  rs.getString(15);
       p3_q2_no                     =  rs.getString(16);
       p3_q2_date                   =  rs.getString(17);
       p3_q2_total                  =  rs.getString(18);
       p3_q3_no                     =  rs.getString(19);
       p3_q3_date                   =  rs.getString(20);
       p3_q3_total                  =  rs.getString(21);
       amt_in_words3                =  rs.getString(22);
       recommendation               =  rs.getString(23);
       recommendation_supplementary =  rs.getString(24);
       p2_total                     =  rs.getString(25);
       p3_total                     =  rs.getString(26);
       order_date                   =  rs.getString(27);
       last_edit_date               =  rs.getString(28);
       order_by                     =  rs.getString(29);
       last_edit_by                 =  rs.getString(30);

 }

  rs.close();
  ps.close();

%>
<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse;" bordercolor="#111111">
  <tr style="page-break-before:always;">
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" size="3">
    <i>
    <strong>Account Number:</strong>&nbsp;<%=erp_code%>
    <%if(order_type.equals("O")){ %> <strong>&nbsp;&nbsp;&nbsp;&nbsp;Budget Head:</strong>&nbsp;<%=budget_head%><% } %>
    </i>
    </font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <%if(order_type.equals("C")){%>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" size="3"><i><strong>Scheme No:</strong>&nbsp;<%=capex_scheme_no%>
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;</i></font></td>
  </tr>
<% } %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
<tr>
    <td align="left" nowrap colspan="2">
    <font face="Verdana" size="3"><i><strong><u>Justification for Order No :</u></strong>&nbsp;<%=order_no%>
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;</i></font></td>
</tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>

<% /**************************** MANY QUOTATION BLOCK *********************************/ %>

  <%if(!p2_vendor_name.equals("$") || !p3_vendor_name.equals("$")){%>
  <tr>
    <td align="left" nowrap colspan="2">

  <tr>
    <td align="left" nowrap colspan="2">
    <font face="Verdana" size="3"><i><strong>Quotations Received :</strong></i></font></td>
  </tr>
  <tr>
    <td align="left" nowrap colspan="2">
    <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td align="center" width="35%"><font face="Verdana" size="3"><strong>Vendor Name</strong></font></td>
    <td align="center" width="25%"><font face="Verdana" size="3"><strong>Quotation No</strong></font></td>
    <td align="center" width="15%"><font face="Verdana" size="3"><strong>Quotation Date</strong></font></td>
    <td align="center" width="25%"><font face="Verdana" size="3"><strong>Order Amount</strong></font></td>
  </tr>
  <tr>
   <td align="center">
       <%=vendor_name%>
   </td>
   <td align="center">
  <%if(!p1_q1_no.equals("$")){ %>
      <%=p1_q1_no%>
  <% } %>
  <%if(!p1_q2_no.equals("$")){ %>
      <br><%=p1_q2_no%>
  <% } %>
  <%if(!p1_q3_no.equals("$")){%>
      <br><%=p1_q3_no%>
  <% } %>
   </td>
   <td align="center">
  <%if(!p1_q1_date.equals("$")){%>
      <%=p1_q1_date%>
  <% } %>
  <%if(!p1_q2_date.equals("$")){%>
      <br><%=p1_q2_date%>,
  <% } %>
  <%if(!p1_q3_date.equals("$")){%>
      <br><%=p1_q3_date%>
  <% } %>
   </td>
   <td align="center">
    <font face="Verdana" size="3"><strong>
    Rs. <%=order_value%>
    </strong>
    </font></td>
  </tr>

<% /**************************** P2 BLOCK *********************************/ %>

  <%if(!p2_vendor_name.equals("$")){ %>
  <tr>
   <td align="center">
       <%=p2_vendor_name%>
   </td>
   <td align="center">
  <%if(!p2_q1_no.equals("$")){ %>
      <%=p2_q1_no%>
  <% } %>
  <%if(!p2_q2_no.equals("$")){ %>
      <br><%=p2_q2_no%>
  <% } %>
  <%if(!p2_q3_no.equals("$")){%>
      <br><%=p2_q3_no%>
  <% } %>
   </td>
   <td align="center">
  <%if(!p2_q1_date.equals("$")){%>
      <%=p2_q1_date%>
  <% } %>
  <%if(!p2_q2_date.equals("$")){%>
      <br><%=p2_q2_date%>,
  <% } %>
  <%if(!p2_q3_date.equals("$")){%>
      <br><%=p2_q3_date%>
  <% } %>
   </td>
   <td align="center">
    <font face="Verdana" size="3"><strong>
    Rs. <%=p2_total%>
    </strong>
    </font></td>
  </tr>

  <% } %>

<% /**************************** /P2 BLOCK *********************************/ %>

<% /**************************** P3 BLOCK *********************************/ %>

  <%if(!p3_vendor_name.equals("$")){%>
  <tr>
   <td align="center">
       <%=p3_vendor_name%>
   </td>
   <td align="center">
  <%if(!p3_q1_no.equals("$")){ %>
      <%=p3_q1_no%>
  <% } %>
  <%if(!p3_q2_no.equals("$")){ %>
      <br><%=p3_q2_no%>
  <% } %>
  <%if(!p3_q3_no.equals("$")){%>
      <br><%=p3_q3_no%>
  <% } %>
   </td>
   <td align="center">
  <%if(!p3_q1_date.equals("$")){%>
      <%=p3_q1_date%>
  <% } %>
  <%if(!p3_q2_date.equals("$")){%>
      <br><%=p3_q2_date%>,
  <% } %>
  <%if(!p3_q3_date.equals("$")){%>
      <br><%=p3_q3_date%>
  <% } %>
   </td>
   <td align="center">
    <font face="Verdana" size="3"><strong>
    Rs. <%=p3_total%>
    </strong>
    </font></td>
  </tr>

  <% } %>

<% /**************************** /P3 BLOCK *********************************/ %>

  </table>
  </td>

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>

  <tr>
    <td align="left" colspan="2">
    <font face="Verdana" size="3">
     Quotation received from <strong> M/S <%=vendor_name%></strong> being
    <%if(!p3_vendor_name.equals("$")){%>
        lowest
    <% }else{ %>
        lower
    <% } %>
     , Order may please be placed on them.
    </font></td>
  </tr>

  <%if(!recommendation_supplementary.equals("$")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" colspan="2">
    <font face="Verdana" size="3">
    <%=recommendation_supplementary%>
    </font></td>
  </tr>
  <% } %>

  

  </tr>

<% /**************************** ONLY QUOTATION BLOCK *********************************/ %>
<% }else{ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" nowrap colspan="2">
    <font face="Verdana" size="3"><i><strong>Only quotation received from :</strong></i></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" nowrap colspan="2">
  <tr>
    <td align="left" nowrap colspan="2">
    <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td align="center" width="35%"><font face="Verdana" size="3"><strong>Vendor Name</strong></font></td>
    <td align="center" width="25%"><font face="Verdana" size="3"><strong>Quotation No</strong></font></td>
    <td align="center" width="15%"><font face="Verdana" size="3"><strong>Quotation Date</strong></font></td>
    <td align="center" width="25%"><font face="Verdana" size="3"><strong>Order Amount</strong></font></td>
  </tr>
  <tr>
   <td align="center">
       <%=vendor_name%>
   </td>
   <td align="center">
  <%if(!p1_q1_no.equals("$")){ %>
      <%=p1_q1_no%>
  <% } %>
  <%if(!p1_q2_no.equals("$")){ %>
      <br><%=p1_q2_no%>
  <% } %>
  <%if(!p1_q3_no.equals("$")){%>
      <br><%=p1_q3_no%>
  <% } %>
   </td>
   <td align="center">
  <%if(!p1_q1_date.equals("$")){%>
      <%=p1_q1_date%>
  <% } %>
  <%if(!p1_q2_date.equals("$")){%>
      <br><%=p1_q2_date%>,
  <% } %>
  <%if(!p1_q3_date.equals("$")){%>
      <br><%=p1_q3_date%>
  <% } %>
   </td>
   <td align="center">
    <font face="Verdana" size="3"><strong>
    Rs. <%=order_value%>
    </strong>
    </font></td>
  </tr>
  </table>

    </td>
   </tr>


     <%if(!recommendation.equals("$")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" colspan="2">
    <font face="Verdana" size="3">
    <%=recommendation%>
    </font></td>
  </tr>
     <% } %>
     <%if(!recommendation_supplementary.equals("$")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
     <tr>
       <td align="left" colspan="2">
       <font face="Verdana" size="3">
       <%=recommendation_supplementary%>
       </font></td>
     </tr>
     <% } %>
  <% } %>

<% /**************************** /ONLY QUOTATION BLOCK *********************************/ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
     <tr>
       <td align="left" nowrap colspan="2">
<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
           <tr valign="bottom" style="height:120px">
     <%if(!l3_signatory.equals("$")){%>
           <td align="center">
           <font face="Verdana" size="3">
           <strong>
           <%=l3_signatory%>
           </strong>
           </td>
     <% } %>
     <%if(!l2_signatory.equals("$")){%>
           <td align="center">
           <font face="Verdana" size="3">
           <strong>
           <%=l2_signatory%>
           </strong>
           </td>
     <% } %>
     <%if(!l1_signatory.equals("$")){%>
           <td align="center">
           <font face="Verdana" size="3">
           <strong>
           <%=l1_signatory%>
           </strong>
           </td>
     <% } %>
           </tr>
           </table>
       </font></td>
     </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

     <tr>
       <td align="left" nowrap colspan="2">
           <table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
             <tr valign="bottom" style="height:30px">
                <td width="30%" style ="padding:5px;">
                    &nbsp;
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Name</strong></font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Date</strong></font>
                </td>
             </tr>
             <tr valign="bottom" style="height:30px">
                <td width="30%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Order Initiated By</strong></font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=order_by%>
                    </font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=order_date%>
                    </font>
                </td>
             </tr>
             <tr valign="bottom" style="height:30px">
                <td width="30%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Order last edited by</strong></font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=last_edit_by%>
                    </font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=last_edit_date%>
                    </font>
                </td>
             </tr>
           </table>
    </td>
  </tr>
</table>
<% } %>
</div>
</center></div>
<!--
<center><input type="button" value="PRINT" onClick="this.style.visibility='hidden'; window.print();"></center>
-->
<%

      }catch(Exception ee){ ee.printStackTrace();}
         finally{ mk.con.close(); }


 }catch(Exception ee){ ee.printStackTrace();}
%>
</body>
</html>
