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
    <jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>
    <%

                String sLoginStn = request.getParameter("sLoginStn");
                String sLoginStnNm = request.getParameter("sLoginStnNm");
                String sLoginDept = request.getParameter("sLoginDept");
                String sOrdBy = request.getParameter("sOrdBy");
                String sOrdByNm = request.getParameter("sOrdByNm");


                String sJobTyp = request.getParameter("sJobTyp");
                String sUnit = request.getParameter("sUnit");
                String sOrdStn = request.getParameter("sOrdStn");
                String sOrdDept = request.getParameter("sOrdDept");
                String sOrdTyp = request.getParameter("sOrdTyp");

                String sOrdId = new String();
                if (request.getParameter("sOrdId") != null) {
                    sOrdId = request.getParameter("sOrdId");
                }
                orderBean.setsOrdId(sOrdId);
                //String sOrdBy = request.getParameter("sOrdBy");
                String sCancel = request.getParameter("sCancel");

    %>
    <frameset rows="20%,*" framespacing="0" border="0" frameborder="0">
        <!--frame name="header" scrolling="no" noresize target="menu" src="form_menu.jsp?sLoginStn=<= sLoginStn >&amp;sOrdStn=<= sOrdStn >&amp;sOrdId=<= sOrdId >&amp;sJobTyp=< sJobTyp>&amp;sUnit=<= sUnit>&amp;sOrdDept=<= sOrdDept>&amp;sOrdTyp=<= sOrdTyp>"-->
            <frame name="middle" scrolling="auto" src="order_menu.jsp?sLoginStn=<%= sLoginStn %>&amp;sLoginStnNm=<%= sLoginStnNm %>&amp;sOrdStn=<%= sOrdStn %>&amp;sOrdBy=<%= sOrdBy %>&amp;sOrdByNm=<%= sOrdByNm %>&amp;sJobTyp=<%= sJobTyp%>&amp;sUnit=<%= sUnit%>&amp;sOrdStn=<%= sOrdStn%>&amp;sOrdDept=<%= sOrdDept%>&amp;sOrdTyp=<%= sOrdTyp%>&amp;sOrdId=<%= sOrdId%>&amp;sCancel=<%= sCancel%>">
            <frame name="detail" scrolling="auto" src="order_entry.jsp?sLoginStn=<%= sLoginStn %>&amp;sLoginStnNm=<%= sLoginStnNm %>&amp;sOrdStn=<%= sOrdStn %>&amp;sOrdBy=<%= sOrdBy %>&amp;sOrdByNm=<%= sOrdByNm %>&amp;sJobTyp=<%= sJobTyp%>&amp;sUnit=<%= sUnit%>&amp;sOrdStn=<%= sOrdStn%>&amp;sOrdDept=<%= sOrdDept%>&amp;sOrdTyp=<%= sOrdTyp%>&amp;sOrdId=<%= sOrdId%>&amp;sCancel=<%= sCancel%>">
                <noframes>
                    <body>
                        <p>This page uses frames, but your browser doesn't support them.</p>
                    </body>
                </noframes>
                </frameset>
            <jsp:setProperty name="orderBean" property="sOrdId" value="<%= sOrdId %>"/>
                </html>
