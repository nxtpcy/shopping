<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*, java.util.*, com.bjsxt.shopping.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
String strId = request.getParameter("id");
int id = 0;
if (strId != null && !strId.trim().equals("")) {
	id = Integer.parseInt(strId);
}
%>



<html>  
<head>  
<title>using commons Upload to upload file</title>  
</head>  
<style>  
* {  
    font-family: "宋体";  
    font-size: 14px  
}  
</style>  
<body>  
    <p align="center">请您选择需要上传的文件</p>  
    <form id="form1" name="form1" method="post"  
        action="../FileUploadServlet" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%=id%>">  
        <table border="0" align="center">  
            <tr>  
                <td>上传文件：</td>  
                <td><input name="file" type="file" size="20"></td>  
            </tr>  
            <tr>  
                <td></td>  
                <td><input type="submit" value="提交">  
                    <input type="reset" value="重置"></td>  
            </tr>  
        </table>  
    </form>  
</body>  
</html>