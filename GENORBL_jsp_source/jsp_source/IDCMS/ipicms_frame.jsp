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
    <input type="hidden" name="sBack" value=""/>
    <input type="hidden" name="sBackClick" value="0"/>
    <%
                String sLoginStnCd = loginBean.getsGenStn();
                String sLoginStnShrtNm = loginBean.getsLoginStnShrtNm();
                String sLoginStnLongNm = loginBean.getsGenStnNm();
                String sLoginDeptCd = loginBean.getsDept();
                String sLoginDeptShrtNm = loginBean.getsLoginDeptShrtNm();
                String sLoginDeptLongNm = loginBean.getsLoginDeptLongNm();
                String sLoginEmpCd = loginBean.getsEmpCd();
                String sLoginEmpNm = loginBean.getsEmpFNm() + " " + loginBean.getsEmpLNm();
                String sLoginEmpDesg = loginBean.getsEmpDesg();
                String sLoginEmpLvl = loginBean.getsLoginEmpLvl();
                String sLoginAdmMkr = loginBean.getsAdminMkr();
                String sLoginEmpKaizenMkr = loginBean.getsLoginEmpKaizenMkr();

    %>
    <frameset rows="15%,10%,*" framespacing="0" border="0" frameborder="0">
        <frame name="upper"  src="bannerPage_kaizen.jsp" scrolling="no" frameborder="0">
            <frame name="middle" scrolling="no" src="ipicms_menu.jsp?sLoginStnCd=<%= sLoginStnCd%>&amp;sLoginStnShrtNm=<%= sLoginStnShrtNm%>&amp;sLoginStnLongNm=<%= sLoginStnLongNm%>&amp;sLoginDeptCd=<%= sLoginDeptCd%>&amp;sLoginDeptShrtNm=<%= sLoginDeptShrtNm%>&amp;sLoginDeptLongNm=<%= sLoginDeptLongNm%>&amp;sLoginEmpCd=<%= sLoginEmpCd%>&amp;sLoginEmpNm=<%= sLoginEmpNm%>&amp;sLoginEmpDesg=<%= sLoginEmpDesg%>&amp;sLoginEmpLvl=<%= sLoginEmpLvl%>&amp;sLoginAdmMkr=<%= sLoginAdmMkr%>&amp;sLoginEmpKaizenMkr=<%= sLoginEmpKaizenMkr%>" scrolling="no" frameborder="0">
                <frame name="bottom" scrolling="auto" frameborder="0" src="blank.jsp"/>
                <noframes>
                    <body>
                        <p>This page uses frames, but your browser doesn't support them.</p>
                    </body>
                </noframes>
                </frameset>
                </html>