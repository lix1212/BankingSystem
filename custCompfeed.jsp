<%-- 
    Document   : custFeedback
    Created on : 9 Nov, 2020, 10:53:21 AM
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
        <title>CUSTOMER COMPLAINT/FEEDBACK</title>
        <script language="JavaScript" src="scripts/login.js"></script> 
    </head>
    <body onload="document.entercompfeed.polno.focus();">
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
            <form name="entercompfeed" action="insertCustCompfeed.jsp" method="post" onsubmit="return validatecompfeeddata();" >

                <tr>
                    <td colspan="6" align="center" bgcolor="pink">CUSTOMER FEEDBACK &nbsp;</td>
                </tr>
                <tr>
                    <th colspan="6">Please answer the following asked questions:</th>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td width="25%">ENTER YOUR POLICY NUMBER :</td>
                    <td width="25%"><input type="text" size="25" name="polno" value=""/></td>
                    <td width="25%">SELECT WHAT TYPE:</td>
                    <td width="25%"><select name="type"><option selected>Complaint</option>        
                            <option>Feedback</option>
                        </select>
                    </td>
                <tr>
                    <td width="25%">PLEASE SELECT NATURE OF FEEDBACK/COMPLAINT:</td>
                    <td width="25%"><select name="about">
                            <option selected>About claim payment</option>        
                            <option>About loan payment</option>
                            <option>About survival benefit payment</option>
                            <option>About Maturity payment</option>
                            <option>About premium payment</option>
                            <option>Others</option>
                        </select>
                    </td>
                    <td width="25%"></td>
                    <td width="25%"></td>
                    </tr>
                    <tr>
                    <td width="25%">PLEASE FURTHER DESCRIBE IT:</td>
                    <td colspan="3"><textarea name="describe" rows="3" ></textarea></td>
                </tr>    

                <tr bgcolor="pink">
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr bgcolor="rgb(6,79,143)">
                    <td colspan="6">&nbsp;</td>
                </tr>

                <tr>
                    <td align="center" colspan="6"><input type="submit" value="Submit the Details" name="insertcompfeeddata" />&nbsp;</td>
                </tr>
            </form>
        </table>
        <%                    //}else{
                    // out.println("<BR>");
                    // out.println("Master is Already Created.");
                    //}
                    // }
                    //}else {
                    // out.println("No Data Available");
                    // }
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