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
                String sLoginEmpLvl=loginBean.getsLoginEmpLvl();
                String sLoginAdmMkr = loginBean.getsAdminMkr();
                String sPgTyp = request.getParameter("sPgTyp");

                if(!sLoginStnCd.equals("019")){
                    if(Integer.parseInt(sLoginEmpLvl) > 2)sLoginEmpLvl = "2";
                }


    %>
    <input type="hidden" name="sPgTyp" value="<%= sPgTyp %>"/>
    <frameset rows="15%,15%,*" framespacing="0" border="0" frameborder="0">
        <frame name="top" scrolling="no" noresize src="hdr.jsp?sLoginStnCd=<%= sLoginStnCd%>&amp;sLoginStnShrtNm=<%= sLoginStnShrtNm%>&amp;sLoginStnLongNm=<%= sLoginStnLongNm%>&amp;sLoginDeptCd=<%= sLoginDeptCd%>&amp;sLoginDeptShrtNm=<%= sLoginDeptShrtNm%>&amp;sLoginDeptLongNm=<%= sLoginDeptLongNm%>&amp;sLoginEmpCd=<%= sLoginEmpCd%>&amp;sLoginEmpNm=<%= sLoginEmpNm%>&amp;sLoginEmpDesg=<%= sLoginEmpDesg%>&amp;sLoginEmpLvl=<%= sLoginEmpLvl %>&amp;sLoginAdmMkr=<%= sLoginAdmMkr%>">
            <frame name="middle" scrolling="auto" src="order_menu_spl_emp.jsp?sLoginStnCd=<%= sLoginStnCd%>&amp;sLoginStnShrtNm=<%= sLoginStnShrtNm%>&amp;sLoginStnLongNm=<%= sLoginStnLongNm%>&amp;sLoginDeptCd=<%= sLoginDeptCd%>&amp;sLoginDeptShrtNm=<%= sLoginDeptShrtNm%>&amp;sLoginDeptLongNm=<%= sLoginDeptLongNm%>&amp;sLoginEmpCd=<%= sLoginEmpCd%>&amp;sLoginEmpNm=<%= sLoginEmpNm%>&amp;sLoginEmpDesg=<%= sLoginEmpDesg%>&amp;sLoginEmpLvl=<%= sLoginEmpLvl %>&amp;sLoginAdmMkr=<%= sLoginAdmMkr%>&amp;sPgTyp=<%= sPgTyp %>">
               <frame name="bottom" scrolling="auto" src="blank.jsp"/> 
                    <noframes>
                        <body>
                            <p>This page uses frames, but your browser doesn't support them.</p>
                        </body>
                    </noframes>
                    </frameset>
                    </html>
