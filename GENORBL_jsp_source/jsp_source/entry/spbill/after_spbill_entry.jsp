<%-- 
    Document   : blank_image
    Created on : Jan 17, 2013, 4:32:11 PM
    Author     : Amalesh_gole
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<style>
.cls1{
  font-size:18px;
}
.cls2{
  font-size:25px;
}
.cls3{
  font-size:25px;
}


</style>
    </head>
    <body>
<center>
        <p  align=center  ><%= request.getParameter("after_entry_msg") %></p>

        <table width=90% class="cls1">
           <tr>
             <td align =left >
               Bill Reference Number
             </td>
             <td align =center class="cls3">
               <%= request.getParameter("spblref") %> 
             </td>
           </tr>
           <tr>
             <td align =left >
               Bill Amount 
             </td>
             <td align =center class="cls3">
               <%= request.getParameter("spblamt") %>
             </td>
           </tr>
           <tr>
             <td align =left >
               Bill No 
             </td>
             <td align =center class="cls3">
               <%= request.getParameter("spblno") %>
             </td>
           </tr>
           <tr>
             <td align =left >
               Bill Date 
             </td>
             <td align =center class="cls3">
               <%= request.getParameter("spbldt") %>
             </td>
           </tr>

           <tr>
             <td align =left >
               ERP A/c Number  
             </td>
             <td align =center >
              
               <table class="cls2" > 
                   <tr>
                <%
               if(request.getParameter("erp_ac") != null){
                  String[] colorArr = { "#9ce4e4", "#9ce4e4", "#9ce4e4", "#d1d795" , "#d1d795" , "#d1d795" ,"#d1d795", "#d1d795", "#a49ce4", "#a49ce4", "#a49ce4" , "#e7be6b" , "#e7be6b" ,"#e7be6b", "#9ce4e4", "#9ce4e4", "#b5d0b0", "#b5d0b0","#e7ee6c" ,"#89e499","#89e499" }; 
                  for(int j=0;j<request.getParameter("erp_ac").length() ; j++){
                    %> 
                      <td bgcolor="<%= colorArr[j] %>" ><%= request.getParameter("erp_ac").charAt(j)  %> </td>
                    <%
                   }
                 }
                %>  
                   </tr>
               <table>
             </td>
           </tr>

        </table>
<%
System.out.println(" urgnt_mkr "+request.getParameter("urgnt_mkr"));
 if(request.getParameter("urgnt_mkr").equals("Y")){
%>
<a href="spbill_urgnt_pymnt_form.jsp?spbil_ref_h=<%= request.getParameter("spblref")  %>&billtype_h=S" target='_blank' > Print Urgent Payment Request Form </a>
<%
} %>
</center>
    </body>
</html>

