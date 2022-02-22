<%-- 
    Document   : upldFl
    Created on : Mar 7, 2013, 5:13:05 PM
    Author     : debasis saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script>
            function checkFile(){
                if(document.getElementById('fileName').value == ''){
                    alert('Please Select a File !')
                    return false ;
                }

                if( window.parent.edit_btn.value == 'Edit' && window.parent.edit_btn_draft.value == 'Edit Draft' ){
                    alert('Form is Read-Only ! Upload not possible !')
                    return false ;
                }

                if( form1.sTyp.value == 'cause' ){
                    if( window.parent.chkRoot_cause_analysis() == true ){}
                    else return false;
                    window.parent.select_file_upld_cause();
                    return false ;
                }else{
                    form1.submit();
                }

                return true ;
            }
        </script>
    </head>
    <%
                System.out.println("sContestId : " + request.getParameter("sContestId"));
                System.out.println(request.getParameter("sIpAddr"));
    %>
    <body bgcolor="#FFFFCC">    
        Upload File
        <form name="form1" action="IpicmsUpldFl" method="post" enctype="multipart/form-data">
            <label for="fileName">Select File:</label>
            <input name="sContestId" type="hidden" value ='<%= request.getParameter("sContestId")%>'/>
            <input name="sIpAddr" type="hidden" value ='<%= request.getParameter("sIpAddr")%>'/>
            <input name="sTyp" type="hidden" value ='<%= request.getParameter("sTyp")%>'/>
            <input name="sSub_typ" type="hidden" value ='<%= request.getParameter("sSub_typ") == null ? "" : request.getParameter("sSub_typ")%>'/>
            <input id="fileName" type="file" name="fileName" size="5"/><input type="button" value="Upload" onclick='checkFile();'/>
        </form>
    </body>
</html>
