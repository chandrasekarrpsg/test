<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Ipicms.IpicmsProcessBeanRemote"%>
<%@page import="genOrblJavaPackage.MakeConnectionGENORBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.util.Calendar"%>
<%@page import="java.sql.*, java.io.*" %>
<%@page import="java.text.SimpleDateFormat" %>

<%!    IpicmsProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (IpicmsProcessBeanRemote) ic.lookup("java:comp/env/IpicmsProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("ipcms_nomEntry.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    String sLoginStnCd = request.getParameter("sLoginStnCd");
                    String sLoginStnShrtNm = request.getParameter("sLoginStnShrtNm");
                    String sLoginStnLongNm = request.getParameter("sLoginStnLongNm");
                    String sLoginDeptCd = request.getParameter("sLoginDeptCd");
                    String sLoginDeptShrtNm = request.getParameter("sLoginDeptShrtNm");
                    String sLoginDeptLongNm = request.getParameter("sLoginDeptLongNm");
                    String sLoginEmpCd = request.getParameter("sLoginEmpCd");
                    String sLoginEmpNm = request.getParameter("sLoginEmpNm");
                    String sLoginEmpDesg = request.getParameter("sLoginEmpDesg");
                    String sLoginEmpLvl = request.getParameter("sLoginEmpLvl");
                    String sLoginAdmMkr = request.getParameter("sLoginAdmMkr");
                    String sLoginEmpKaizenMkr = request.getParameter("sLoginEmpKaizenMkr");

                    String sMsg = request.getParameter("sMsg");

                    String sSysDt = new String();

                    String sContestId = request.getParameter("sContestId");
                    String sMode = request.getParameter("sMode");

                    String sPropDt = new String();
                    String sPage_name = new String();

                    RequestDispatcher rd = null;

                    Iterator iterateOuter = null;
                    Iterator iterateInner = null;
                    List rows = null;

                    try {
                        //mk = new MakeConnectionHrPortal();

                        if (sContestId.equals("")) {
                        } else {
                            //System.out.println("111");
                            List lstIpicms = null;
                            rows = null;
                            iterateOuter = null;
                            iterateInner = null;

                            /*lstIpicms = hRemote.getIpicmsMst(sContestId);

                            iterateOuter = lstIpicms.iterator();

                            while (iterateOuter.hasNext()) {
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();

                            while (iterateInner.hasNext()) {

                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            sPropDt = ((String) iterateInner.next()).trim();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();

                            }
                            }*/

                            lstIpicms = hRemote.getIpicms_form_info(sContestId);

                            iterateOuter = lstIpicms.iterator();

                            while (iterateOuter.hasNext()) {
                                rows = (List) iterateOuter.next();

                                iterateInner = rows.iterator();

                                while (iterateInner.hasNext()) {

                                    sPage_name = ((String) iterateInner.next()).trim();

                                }

                            }

                            /*System.out.println("sPropDt : " + sPropDt);

                            SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");

                            Date date1 = sdf.parse("13-Dec-2017");
                            Date date2 = sdf.parse(sPropDt);

                            if (date2.compareTo(date1) <= 0) {
                            //System.out.println("11111");
                            rd = request.getRequestDispatcher("/" + "ipicms_nomEntry.jsp");
                            rd.forward(request, response);
                            } else {
                            //System.out.println("22222");
                            //if (sLoginEmpCd.equals("975109") || sLoginEmpCd.equals("970819") || sLoginEmpCd.equals("133455")) {
                            rd = request.getRequestDispatcher("/" + "ipicms_nomEntry_new.jsp");
                            rd.forward(request, response);
                            //}
                            }*/

                            rd = request.getRequestDispatcher("/" + sPage_name);
                            rd.forward(request, response);

                        }

                    } catch (Exception e) {
                        e.printStackTrace();


                    } finally {
                        try {
                        } catch (Exception E) {
                        } finally {
                        }

                    }
        %>
    </body>
</html>
