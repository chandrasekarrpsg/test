<%@ page language="java" %>
<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session" />
<%
 String empcd = loginBean.getsEmpCd();
 if(empcd != null) {
%>
<%
 }
 else {
%>
<jsp:forward page="sessionexpired.html"/>
<%
 }
%>
