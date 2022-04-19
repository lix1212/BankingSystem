<%-- 
    Document   : survey
    Created on : 9 Nov, 2020, 1:33:50 PM
    Author     : Mansi Pal
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement;"%>
<%@ page import="java.sql.Connection;"%>
<%@ page import="java.sql.ResultSet;"%>
<%@ page import="java.sql.SQLException;"%>
<%@ page import="java.sql.Statement;"%>
<%@ page import="crm.servlet.TestConnect;"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <SCRIPT src="scripts/rightclick.js" type=text/javascript></SCRIPT>
        <title>SURVEY FORM</title>
        <script language="JavaScript" src="scripts/login.js"></script> 
    </head>
    <body onload="document.entersurvey.quest1.focus();">
        <%@ include file="header_logout.jsp" %>
        <%
            Connection con1 = null;
            TestConnect obj = null;
            ResultSet result = null, result2 = null;
            PreparedStatement pstmt = null, pstmt1 = null;
            String strQuery = null, absemailid = null, getMailID = null;
            int result1 = 0;
        %>

        <%
            obj = new TestConnect();
            try {

                con1 = obj.connectURL();
                if (con1 != null) {
        %>

        <table border='1' width="100%">
            <form name="entersurvey" action="insertSurvey.jsp" method="post" onsubmit="return validatesurveydata();" >

                <tr>
                    <td colspan="6" align="center" bgcolor="pink"> SURVEY &nbsp;</td>
                </tr>
                <tr>
                    <th colspan="6">Please answer the following asked questions for survey basis:</th>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td width="15%" align="right">Which plan do you prefer in general when purchasing one? :</td>
                    <td width="15%"><input type="text" size="25" name="quest1" value=""/></td>
                    <td width="15%" align="center">What is your criteria while taking insurance?</td>
                    <td width="15%"><input type="text" size="25" name="quest2" value=""/></td>
                    </td>
                <tr>
                    <td width="25%" align="right">What is your monthly family income?</td>
                    <td width="15%"><input type="text" size="25" name="quest3" value=""/></td>
                    <td width="15%" align="right">'What is your purpose of buying insurance?</td>
                    <td width="15%"><input type="text" size="25" name="quest4" value=""/></td>
                    </td>

                </tr>    
                <tr>
                    <td width="25%" align="right">'Do you prefer term assurance plan?</td>
                    <td width="15%"><input type="text" size="25" name="quest5" value=""/></td>
                    </td>
                </tr>

                <tr bgcolor="pink">
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr bgcolor="rgb(6,79,143)">
                    <td colspan="6">&nbsp;</td>
                </tr>

                <tr>
                    <td align="center" colspan="6"><input type="submit" value="Submit your answers" name="insertsurveydata" />&nbsp;</td>
                </tr>
            </form>
        </table>
        <%
                } else {
                    out.println("Error in Connection");
                }

            } catch (Exception Ex) {
                out.println("Exception is  : " + Ex.getMessage());
                Ex.printStackTrace();

            } finally {
                obj.closeConnection(con1);
            }
        %>

        <%@ include file="footer.jsp"%>
    </body>
</html>