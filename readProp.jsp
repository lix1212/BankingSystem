<%-- 
    Document   : readProp
    Created on : 8 Nov, 2020, 9:16:43 PM
    Author     : 91996
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.Locale;" %>
<%@ page import="java.util.ResourceBundle;" %>
<%@ page import="java.io.File;" %>
<%@ page import="java.util.Properties;" %>
<%@ page import="java.io.FileInputStream;"%>
<jsp:useBean id="objbean" class="crm.beans.ContextBean" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
       
    </head>
    <body>
<%
        String str2 = pageContext.getServletContext().getRealPath("/");
        objbean.setContextPath(str2);
        Properties localProperties1 = new Properties();
        String str=objbean.getContextPath();
        File localFile1 = new File(str + "ini/caption.ini");
      try
      {
        if ((!(localFile1.isFile())) || (!(localFile1.exists())))
        {
          throw new Exception("caption.ini file not present.");
        }
        FileInputStream localFileInputStream1 = new FileInputStream(localFile1);
        localProperties1.load(localFileInputStream1);
        localFileInputStream1.close();
      }catch(Exception localException1)
      {                 
        localException1.getMessage();
     }
     %>
    </body>
</html>
