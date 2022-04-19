<%-- 
    Document   : premiumRenewal
    Created on : 9 Nov, 2020, 12:46:54 PM
    Author     : Mansi Pal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement;"%>
<%@ page import="java.sql.Connection;"%>
<%@ page import="java.sql.ResultSet;"%>
<%@ page import="java.sql.SQLException;"%>
<%@ page import="java.sql.Statement;"%>
<%@ page import="crm.servlet.TestConnect;"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAY PREMIUM RENEWAL</title>
        <script language="JavaScript" src="scripts/login.js"></script>
    </head>
</head>
<body onload="document.enterrenewaldata.polno.focus();"
      <%
          Connection con1 = null;
          TestConnect obj = null;
          ResultSet result = null, result2 = null;
          PreparedStatement pstmt = null, pstmt1 = null;
          String strQuery = null, absemailid = null, getMailID = null;
          int result1 = 0;
          obj = new TestConnect();
          try {

              con1 = obj.connectURL();

              if (con1 != null) {

      %>
      <%@ include file="header_logout.jsp"%>
      <table border='1' width="100%">
        <form name="enterrenewaldata" action="insertPremiumRenewal.jsp" method="post" onsubmit="return validaterenewaldata();">
            <tr>
                <td colspan="6" align="center" bgcolor="db8cba">PAY RENEWAL PREMIUM &nbsp;</td>
            </tr>
            <tr>
                <td width="20%" align="right">ENTER YOUR POLICY NUMBER</td>
                <td width=20%" align="left"><input type="text" size="20" name="polno" value="" /></td>     
                <td width="35%" align="right">ENTER PREMIUM AMOUNT TO BE PAID</td>
                <td width=25%"><input type="text" size="20" name="premamt" value="" /></td>
            </tr>
            <tr>
                <td width="25%" align="right">SELECT PAYMENT MODE</td>
                <td width=25%"><select name="paymode"><option selected>CREDIT CARD</option>        
                        <option>DEBIT CARD</option>
                        <option>NET BANKING</option>
                    </select></td>
            </tr>

            <tr bgcolor="pink">
                <td colspan="6">&nbsp;</td>
            </tr>
            <tr bgcolor="rgb(6,79,143)">
                <td colspan="6">&nbsp;</td>
            </tr>

            <tr>
                <td align="center" colspan="6"><input type="submit" value="Submit Details" name="insertrenewaldata" />&nbsp;</td>
            </tr>
        </form>
    </table>
    <%                } else {
                out.println("Error in Connection");
            }

        } catch (Exception Ex) {
            out.println("Exception is  : " + Ex.getMessage());
            Ex.printStackTrace();

        } finally {
            obj.closeConnection(con1);
        }
    %>


    <%
        //}
    %>
    <%@ include file="footer.jsp"%>
</body>
</html>