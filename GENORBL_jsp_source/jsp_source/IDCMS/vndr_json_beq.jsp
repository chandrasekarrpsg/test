<%--
    Document   : contractor_list
    Created on : Dec 5, 2012, 4:37:14 PM
    Author     : debasis saha
--%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Order.OrderProcessBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%!    OrderProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (OrderProcessBeanRemote) ic.lookup("java:comp/env/OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("Order.OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("contractor_list.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

                <%
                            String sVndrNmLike = request.getParameter("sVndrNmLike") == null ? "" : request.getParameter("sVndrNmLike");
                            List lstVndrDtls = null;
                            List rows = null;
                            Iterator iterateOuter = null;
                            Iterator iterateInner = null;
                            String sVndrCd = new String();
                            String sVndrNm = new String();
                            String sWageLiab = new String();
                            String sVndrGstNo = new String();
                            JSONArray jarr_vndr = new JSONArray();
                            JSONObject jobj_vndr = null;
                            JSONObject json_data = new JSONObject();

                            lstVndrDtls = hRemote.getVndrDtls_2(sVndrNmLike);
                            iterateOuter = lstVndrDtls.iterator();
                            int i = 0;
                            while (iterateOuter.hasNext()) {
                                jobj_vndr = new JSONObject();
                                rows = (List) iterateOuter.next();

                                iterateInner = rows.iterator();
                                while (iterateInner.hasNext()) {
                                    sVndrCd = "" + ((BigDecimal) iterateInner.next()).intValue();
                                    sVndrNm = (String) iterateInner.next();
                                    jobj_vndr.put("sVndrCd",sVndrCd);
                                    jobj_vndr.put("sVndrNm",sVndrNm);
                                    jobj_vndr.put("sVndrAddr_1",(String) iterateInner.next());
                                    jobj_vndr.put("sVndrAddr_2",(String) iterateInner.next());
                                    jobj_vndr.put("sVndrAddr_3",(String) iterateInner.next());
                                    jobj_vndr.put("sVndrAddr_4",(String) iterateInner.next());
                                    jobj_vndr.put("sVndrAddr_5",(String) iterateInner.next());
                                    jobj_vndr.put("sWageLiab",(String) iterateInner.next());
                                    jobj_vndr.put("sVndrAddr_6",(String) iterateInner.next());

                                }
                                jarr_vndr.add(jobj_vndr);
                            }

                            json_data.put("vndr",jarr_vndr);
                            out.print(json_data);

              %>
                         
