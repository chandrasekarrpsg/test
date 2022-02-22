<%-- 
    Document   : frame1
    Created on : Dec 10, 2012, 12:43:49 PM
    Author     : debasis saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>
    <%

                String sOrdBy = loginBean.getsEmpCd();
                String sOrdByNm = loginBean.getsEmpFNm() + " " + loginBean.getsEmpLNm();
                String sLoginStn = loginBean.getsGenStn();
                String sLoginStnNm = loginBean.getsGenStnNm();
                String sLoginDept = loginBean.getsDept();

    %>
    <frameset rows="20%,*" framespacing="0" border="0" frameborder="0">
            <frame name="header" scrolling="no" noresize src="hdr.jsp">
            <frame name="end" scrolling="auto" src="search_order.jsp?sLoginStn=<%= sLoginStn %>&amp;sLoginStnNm=<%= sLoginStnNm %>&amp;sLoginDept=<%= sLoginDept %>&amp;sOrdBy=<%= sOrdBy%>&amp;sOrdByNm=<%= sOrdByNm%>">
            <noframes>
                    <body>
                        <p>This page uses frames, but your browser doesn't support them.</p>
                    </body>
            </noframes>
    </frameset>
                </html>
