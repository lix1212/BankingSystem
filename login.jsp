<%-- 
    Document   : login
    Created on : 8 Nov, 2020, 9:16:43 PM
    Author     : 91996
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRM Login Page</title>
        <noscript>Kindly Enable Java Scripts for your browser</noscript>
        <script language="JavaScript" src="scripts/login.js"></script>
       
 
     </head>
     <body onload="document.loginform.custid.focus();">
      <%@ include file="header.jsp"%>
      <%@ include file="readProp.jsp"%>
        <table width="100%" border="0" height="28">
            <tr>
                <td align="left"><strong><font size="2pt" style="color:#3399FF" face="Times New Roman">&nbsp</font></strong></td>
            </tr>
            
            <tr>
                <td align="left"><strong><font size="2pt" style="color:#3399FF" face="Times New Roman">&nbsp</font></strong></td>
            </tr>
            <tr>
                <td align="left"><strong><font size="2pt" style="color:#3399FF" face="Times New Roman">&nbsp</font></strong></td>
            </tr>
            
        </table>
        <table width="100%" height="45%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="45%" width="40%" style="background:#3399FF">
                    <table border="0">
                        <tr>
                            <td></td>
                            <td><p align="justify"><font face="arial" size="2" color="#FF99CC"></font></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p align="justify"><font face="arial" size="2" color="#FF99CC"></font></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p align="justify"><font face="arial" size="2" color="#FF99CC"></font></p></td>
                        </tr>
                    </table> 
                </td>  
                <td height="45%" width="60%" style="background:#FF99CC">
                    <table width="100%" height="10%" border="0" cellspacing="0" cellpadding="0">
                        <tr>  
                            <td width="100%" colspan="6" align="center">
                                <B><font face="Times New Roman" style="color:black" size="4"><%=localProperties1.getProperty("Login_Screen")%></font></B>
                            </td>
                    </tr></table>
                    
                    <table border="0">
                        <form name="loginform" action="LoginCheck" method="POST" onsubmit="return validatelogin();">
                    
                           <tr>
                                <td width="30%" align="left" nowrap></td>
                                <td width="20%" align="left" nowrap><%=localProperties1.getProperty("Customer_ID")%></td>
                                <td width="20%" align="left">
                                    <input type="text" name="custid" style="width:110" size="20" maxlength="30" alt="Enter customer id" title="Enter customer id.">
                                </td>
                                <td class="MyClass" align="left" width="30%" id="emailText">
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" align="left" nowrap></td>
                                <td width="20%" align="left" nowrap><%=localProperties1.getProperty("Password")%></td>
                                <td width="20%" align="left">
                                    <input type="password" name="password" style="width:110" size="22" maxlength="20" alt="Enter Password." title="Enter Password.">
                                    
                                </td>
                                <td class="MyClass" align="left" width="30%" id="passwordText">
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="3" align="center"><input type="submit" value="<%=localProperties1.getProperty("Login_to_Portal")%>"/></td>
                            </tr>
                        </form>
                        
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" height="28">
            <tr>
                <td align="left"><strong><font size="2pt" style="color:#3399FF" face="Times New Roman">&nbsp</font></strong></td>
            </tr>
            <tr>
                <td align="left"><strong><font size="2pt" style="color:#3399FF" face="Times New Roman">&nbsp</font></strong></td>
            </tr>
            <tr>
                <td width="100%" align="center"><a href="signup.jsp"><font size="4" color="red">Click Here for Sign Up</font></a></td>
            </tr>
            
        </table>
        <%@ include file="footer.jsp" %>
        
    </body>
</html>
