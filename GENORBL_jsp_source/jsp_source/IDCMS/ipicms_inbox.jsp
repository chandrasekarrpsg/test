<%-- 
    Document   : ipicms_inbox
    Created on : Jul 22, 2013, 10:38:29 AM
    Author     : debasis saha
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Ipicms.*"%>
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
            System.out.println("ipcms_inbox.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="inbox_style.css" />
        <title>IPICMS - inbox</title>
    </head>
    <body style="background-image: url('Pics/Order/lblue047.gif'); color:black;">
        <table>
            <tr>
                <td style="text-align: center; background: aqua;">Contest id</td>
                <td style="text-align: center; background: aqua;">Proposed By</td>
                <td style="text-align: center; background: aqua;">Office</td>
                <td style="text-align: center; background: aqua;">Department</td>
                <td style="text-align: center; background: aqua;">Stage</td>
                <td style="text-align: center; background: aqua;">Options </td>
            </tr>

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

                        List lstInbox = null;
                        List lstOffNm = null;
                        List rows = null;
                        Iterator iterateOuter = null;
                        Iterator iterateInner = null;

                        List rows_2 = null;
                        Iterator iterateOuter_2 = null;
                        Iterator iterateInner_2 = null;

                        String sContestId = new String();
                        String sContestIdFul = new String();
                        String sPropBy = new String();
                        String sPropByNm = new String();
                        String sStnCd = new String();
                        String sStnShrtNm = new String();
                        String sStnLongNm = new String();
                        String sDeptCd = new String();
                        String sDeptShrtNm = new String();
                        String sDeptLongNm = new String();
                        String sStgCd = new String();
                        String sStgDesc = new String();
                        String sEditable = new String();

                        Map mapInbox = new HashMap();

                        mapInbox.put("sLoginStnCd", sLoginStnCd);
                        mapInbox.put("sLoginEmpKaizenMkr", sLoginEmpKaizenMkr);

                        lstInbox = hRemote.getInbox(mapInbox);

                        iterateOuter = lstInbox.iterator();

                        while (iterateOuter.hasNext()) {
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();

                            while (iterateInner.hasNext()) {
                                //System.out.println("222");
                                sContestId = (String) iterateInner.next();
                                sContestIdFul = (String) iterateInner.next();
                                sPropBy = (String) iterateInner.next();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sPropBy);
                                iterateOuter_2 = lstOffNm.iterator();
                                while (iterateOuter_2.hasNext()) {
                                    rows_2 = (List) iterateOuter_2.next();

                                    iterateInner_2 = rows_2.iterator();
                                    while (iterateInner_2.hasNext()) {
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        //sPropByNm = ((String) iterateInner_2.next()).trim() + ((String) iterateInner_2.next()).trim();
                                        sPropByNm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sStnCd = (String) iterateInner.next();
                                //System.out.println("333");

                                List lstStnNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstStnNm = hRemote.getStnNm(sStnCd);
                                iterateOuter_2 = lstStnNm.iterator();
                                while (iterateOuter_2.hasNext()) {
                                    rows_2 = (List) iterateOuter_2.next();

                                    iterateInner_2 = rows_2.iterator();
                                    while (iterateInner_2.hasNext()) {
                                        sStnShrtNm = (String) iterateInner_2.next();
                                        sStnLongNm = (String) iterateInner_2.next();

                                    }
                                }

                                sDeptCd = (String) iterateInner.next();

                                List lstDeptNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstDeptNm = hRemote.getDeptNm(sStnCd, sDeptCd);
                                iterateOuter_2 = lstDeptNm.iterator();
                                while (iterateOuter_2.hasNext()) {
                                    rows_2 = (List) iterateOuter_2.next();

                                    iterateInner_2 = rows_2.iterator();
                                    while (iterateInner_2.hasNext()) {
                                        sDeptShrtNm = (String) iterateInner_2.next();
                                        sDeptLongNm = (String) iterateInner_2.next();

                                    }
                                }

                                sStgCd = (String) iterateInner.next();

                                sStgDesc = hRemote.getStgDesc(sStgCd);

                                sEditable = (String) iterateInner.next();

                            }

            %>

            <tr>
                <td><%=sContestIdFul%></td>
                <td><%=sPropByNm%></td>
                <td><%=sStnLongNm%></td>
                <td><%=sDeptShrtNm%></td>
                <td><%=sStgDesc%></td>

                <%

                                            if (sEditable.equals("YES")) {
                %>
                <td>
                    <form name="formPageSubt" action="ipicms_nomEntry_forward.jsp" method="post" target="bottom">
                        <input type="hidden" name="sLoginStnCd" value="<%= sLoginStnCd%>" />
                        <input type="hidden" name="sLoginStnShrtNm" value="<%= sLoginStnShrtNm%>" />
                        <input type="hidden" name="sLoginStnLongNm" value="<%= sLoginStnLongNm%>" />
                        <input type="hidden" name="sLoginDeptCd" value="<%= sLoginDeptCd%>" />
                        <input type="hidden" name="sLoginDeptShrtNm" value="<%= sLoginDeptShrtNm%>" />
                        <input type="hidden" name="sLoginDeptLongNm" value="<%= sLoginDeptLongNm%>" />
                        <input type="hidden" name="sLoginEmpCd" value="<%= sLoginEmpCd%>" />
                        <input type="hidden" name="sLoginEmpNm" value="<%= sLoginEmpNm%>" />
                        <input type="hidden" name="sLoginEmpDesg" value="<%= sLoginEmpDesg%>" />
                        <input type="hidden" name="sLoginEmpLvl" value="<%= sLoginEmpLvl%>" />
                        <input type="hidden" name="sLoginAdmMkr" value="<%= sLoginAdmMkr%>" />
                        <input type="hidden" name="sLoginEmpKaizenMkr" value="<%= sLoginEmpKaizenMkr%>" />
                        <input type="hidden" name="sContestId" value="<%= sContestId%>" />
                        <input type="hidden" name="sMsg" value="" />
                        <input type="submit" value="EDIT" />

                    </form>
                </td>
                <%
                                                            } else {
                %>
                <td>&nbsp;</td>
                <%                                            }
                %>
            </tr>
            <%
                        }


            %>
        </table>
    </body>
</html>
