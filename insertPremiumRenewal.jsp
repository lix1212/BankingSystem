<%-- 
    Document   : insertPremiumRenewal
    Created on : 9 Nov, 2020, 12:53:31 PM
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
        <SCRIPT src="scripts/rightclick.js" type=text/javascript></SCRIPT>
        <title>PAY PREMIUM RENEWAL</title>
    </head>
    <body>

        <%@ include file="header_logout.jsp" %>

        <%            Connection con = null;
            TestConnect obj = null;
            ResultSet result = null, result2 = null;
            PreparedStatement pstmt = null, pstmt1 = null, pstmt2 = null;
            String strQuery = null, strQuery1 = null, strQuery2 = null;
            obj = new TestConnect();

            try {
                con = obj.connectURL();
                if (con != null) {

                    String custid = session.getAttribute("CUSTOMERID").toString();
                        // get new transactionid from payment table
                        int newTrnId = 0;
                        String polno = request.getParameter("polno").trim();
                        String premamt = request.getParameter("premamt").trim();
                        String paymode = request.getParameter("paymode").trim();
                        strQuery2 = "select max(transaction_id) maxtrnid from payment ;";
                        pstmt2 = con.prepareStatement(strQuery2);
                        result2 = pstmt2.executeQuery();
                        if (result2.next()) {
                            newTrnId = result2.getInt("maxtrnid") + 1;
                        }
                        strQuery1 = "insert into payment(transaction_id,customer_id,policy_number,amount,payment_mode,payment_date) values(?,?,?,?,?,current_date);";
                        pstmt1 = con.prepareStatement(strQuery1);
                        pstmt1.setInt(1, newTrnId);
                        pstmt1.setString(2, custid);
                        pstmt1.setString(3, polno);
                        pstmt1.setString(4, premamt);
                        pstmt1.setString(5, paymode);
                        int m = pstmt1.executeUpdate();
                        if(m>=1){ 
        %>

        <BR>
        <table width="100%">
            <tr>
                <td align="center" width="100%">
                    <font color="Red" size="4">THANKS FOR PAYMENT OF RENEWAL PREMIUM !! YOUR TRANSACTION ID GIVEN BELOW</font>
                </td>
            </tr>
            
            <tr>
                <td align="center" width="100%"><font color="blue" size="4">
                        <%
                            out.println("YOUR PAYMENT TRANSACTION ID : " + newTrnId);
                        %>
                    </font></td>
            </tr>

        </table>
        <BR>

        <%       }
             
                } else {
                    out.println("Con is NULL");
                }

            } catch (Exception Ex) {
                out.println("Exception is  : " + Ex.getMessage());
                Ex.printStackTrace();
            } finally {
                obj.closeConnection(con);
            }
        %>
        <%@ include file="footer.jsp" %>

    </body>
</html>
