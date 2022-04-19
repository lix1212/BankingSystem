<%-- 
    Document   : purchasePlan
    Created on : 8 Nov, 2020, 9:16:43 PM
    Author     : 91996
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" session="true"%>
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
        <title>PURCHASE PLAN DETAILS</title>
        <link rel="stylesheet" type="text/css" media="all" href="calendar/calendar-tas.css" title="win2k-cold-1" />
        <script type="text/javascript" src="calendar/calendar.js"></script>
        <script type="text/javascript" src="calendar/lang/calendar-en.js"></script>
        <script type="text/javascript" src="calendar/calendar-setup.js"></script>
        <script language="JavaScript" src="scripts/login.js"></script>
    </head>
    <body  onload="document.enterplandata.planname.focus();">
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
            <form name="enterplandata" action="insertPurchasePlan.jsp" method="post" onsubmit="return validateplandata();">

                <tr>
                    <td colspan="6" align="center" bgcolor="pink">PLAN DETAILS &nbsp;</td>
                </tr>
                <tr>
                    <th colspan="6">Enter Plan Details to be purchased</th>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td width="25%" align="right">PLAN NAME</td>
                    <td width="25%"><select name="planname" onchange="return calprem();"><option selected>101-Endowment Plan</option>        
                            <option>102-Whole Life Plan</option>
                            <option>103-Money back Plan</option>
                            <option>104-Term Assurance Plan</option>
                            <option>105-Pension Plan</option>
                        </select>
                    </td>
                    <td width="25%" align="right">PLAN TERM</td>
                    <td width="25%"><select name="planterm" onchange="return calprem();"><option selected>20</option>        
                            <option>25</option>
                            <option>30</option>
                            <option>35</option>
                            <option>40</option>
                        </select>
                    </td>
                </tr>
                <tr>    
                    <td width="25%" align="right">SUM ASSURED</td>
                    <td width="25%"><select name="sa" onchange="return calprem();"><option selected>100000</option>        
                            <option>200000</option>
                            <option>300000</option>
                            <option>500000</option>
                            <option>1000000</option>
                        </select>
                    </td> 
                    <td width="25%" align="right">AGE</td>
                    <td width="25%"><input type="text" size="10" name="age" maxlength="2" onchange="return calprem();"/></td>
                </tr>
                <tr>
                    <td width="25%" align="right">YOUR ANNUAL PREMIUM AMOUNT</td>
                    <td width=25%"><input type="text" size="20" name="premamt" value="" readonly="1"/></td>
                    <td width="25%" align="right">PREMIUM RATE </td>
                    <td width="25%"><input type="text" size="20" name="premrate" value="" readonly="1"/></td>
                </tr>
                <tr>
                    <td width="25%" align="right">SELECT PAYMENT MODE</td>
                    <td width=25%"><select name="paymode"><option selected>CREDIT CARD</option>        
                            <option>DEBIT CARD</option>
                            <option>NET BANKING</option>
                        </select></td>
                    <td width="25%"></td>
                    <td width="25%"></td>
                </tr>
                <tr bgcolor="pink">
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr bgcolor="rgb(6,79,143)">
                    <td colspan="6">&nbsp;</td>
                </tr>

                <tr>
                    <td align="center" colspan="6"><input type="submit" value="Submit Plan Details" name="insertplandata" />&nbsp;</td>
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


        <%
            //}
        %>
        <%@ include file="footer.jsp"%>
    </body>
</html>

