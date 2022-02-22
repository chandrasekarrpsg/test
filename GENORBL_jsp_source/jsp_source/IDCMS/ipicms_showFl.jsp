<%@ page language="java" %>
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*,javax.ejb.EJB,javax.naming.*,java.io.*,genOrblJavaPackage.MakeConnectionGENORBL" %>
<%@ page import="net.sf.jasperreports.engine.*,net.sf.jasperreports.engine.export.*,net.sf.jasperreports.engine.util.*" %>
<%@ page contentType="application/pdf" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%
            String sContest_id = new String("");

            String reportfilename = new String("");
            String sStage = new String("");

            sContest_id = request.getParameter("sContest_id") == null ? "" : request.getParameter("sContest_id");
            String path = new String("/san304/j2eegen/GENORBL/jasper_rept/");
            //String path = new String("/ltora/oracle64/j2ee/GENORBL/jasper_rept/");

            //ServletContext context = (ServletContext) FacesContext.getCurrentInstance().getExternalContext().getContext();


            RequestDispatcher rd = null;
            MakeConnectionGENORBL mk = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            int upd = 0;

            try {
                mk = new MakeConnectionGENORBL();

                ps = mk.con.prepareStatement(" SELECT NVL(TO_CHAR(stage),'0') stage "
                                         +   " FROM IDCMS_MST "
                                         +   " WHERE contest_id = TO_NUMBER(?) ");

                ps.setString(1,sContest_id);

                rs = ps.executeQuery();

                while(rs.next()){
                    sStage = rs.getString("stage");
                }

                rs.close();
                ps.close();

                if( sStage.equals("7") ){

                reportfilename = new String("kaizen_form.jasper");

                HashMap hm = null;

                // Create arguments

                hm = new HashMap();
                hm.put("P_CONTEST_ID", sContest_id);
                hm.put("P_BACKGROUND_IMAGE", "/san304/j2eegen/GENORBL/jasper_rept/KAIZEN FORM  R04 FEB-18 for Kaizen Contest 2018-001.jpg");
                hm.put("P_TICK_IMAGE", "/san304/j2eegen/GENORBL/jasper_rept/tick.jpg");
                hm.put("P_UPLD_FILE_LOC", "/san304/j2eegen/GENORBL/IpicmsUpldPdf/");


                //if(action.equals("view")){

                JasperPrint jasperPrint = JasperFillManager.fillReport(path + reportfilename, hm, mk.con);

                //String outputFile = context.getRealPath("/san880/DREAMS/HRD/hrd_portal/build/web/" + appln_id + ".pdf");

                //System.out.println("Report Creation appln_id = "+appln_id);

                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                //String jasperPrint1 = JasperFillManager.fillReportToFile(path + reportfilename, hm, mk.con);
                //JasperExportManager.exportReportToPdfFile(jasperPrint1,"/san304/j2eegen/GENORBL/jasper_rept/" + "kaizen.pdf");


                }
  /*if(action.equals("gen")){
                String jasperPrint1 = JasperFillManager.fillReportToFile(path + reportfilename, hm, mk.con);

                //JasperExportManager.exportReportToPdfFile(jasperPrint1,"/san309/j2eegfv3/HRD/PDFS/" + appln_id + "_offer.pdf");
                JasperExportManager.exportReportToPdfFile(jasperPrint1,"/san880/DREAMS/HRD/PDFS/" + appln_id + "_offer.pdf");
                //JasperExportManager.exportReportToPdfFile(jasperPrint1,"/san880/DREAMS/HRD/hrd_portal/build/web/" + appln_id + "_offer.pdf");


                System.out.println("PDF Creation Over for appln_id = "+appln_id);
                ps = mk.con.prepareStatement (" UPDATE HRD_VTPT_DTL "+
                " SET OFFER_LTR_PRINT_DT = sysdate "+
                " WHERE APPL_ID = "+appln_id+" AND OFFER_LTR_PRINT_DT IS NULL ");
                upd = ps.executeUpdate();
                ps.close();

                if(upd>0)
                ret = "back";
                else
                ret = "noback";


                }
                rd = request.getRequestDispatcher("/vtptInsUpdScreen.jsp?sAction=savePrntOfferLtr&sAppl_id=" + appln_id);
                rd.forward(request, response);


                }*/


            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if( rs!= null ){
                    rs.close();
                }
                if( ps!= null ){
                    ps.close();
                }
                mk.con.close();
            }
%>
