<%-- 
    Document   : insertPurchasePlan
    Created on : 8 Nov, 2020, 9:14:21 PM
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <SCRIPT src="scripts/rightclick.js" type=text/javascript></SCRIPT>
        <title>Purchase Plan</title>
    </head>
    <body  leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
        
        <%@ include file="header_logout.jsp" %>

        <%            Connection con = null;
            TestConnect obj = null;
            ResultSet result = null,result2 = null;
            PreparedStatement pstmt = null, pstmt1 = null,pstmt2 = null;
            String strQuery = null, strQuery1 = null,strQuery2 = null;
            obj = new TestConnect();

            try {
                con = obj.connectURL();

                if (con != null) {

                    int newPolno = 0;
                    String custid=session.getAttribute("CUSTOMERID").toString();
                    // get new policy number from policymaster table
                    strQuery = "select max(Policy_number) from policymaster ;";
                    pstmt = con.prepareStatement(strQuery);
                    result = pstmt.executeQuery();
                    if (result.next()) {
                        newPolno = result.getInt(1) + 1;
                    }
                    
                    String planname = request.getParameter("planname").trim();
                    //out.println("name" + name);
                    String planterm = request.getParameter("planterm").trim();
                    String sa = request.getParameter("sa").trim();
                    String premamt= request.getParameter("premamt").trim();
                    //String premrate = request.getParameter("premrate").trim();
                    strQuery1 = "insert into policymaster(policy_number,customer_id,plan_name,plan_term,plan_sum_assured,plan_premium) values(?,?,?,?,?,?);";
                    pstmt1 = con.prepareStatement(strQuery1);
                    pstmt1.setInt(1, newPolno);
                    pstmt1.setString(2, custid);
                    pstmt1.setString(3, planname);
                    pstmt1.setString(4, planterm);
                    pstmt1.setString(5, sa);
                    pstmt1.setString(6, premamt);
                    int k = pstmt1.executeUpdate();
                    if (k >= 1) {
                    // get new transactionid from payment table
                    int newTrnId=0;
                    String paymode = request.getParameter("paymode").trim();
                    strQuery2 = "select max(transaction_id) maxtrnid from payment ;";
                    pstmt2 = con.prepareStatement(strQuery2);
                    result2 = pstmt2.executeQuery();
                    if (result2.next()) {
                        newTrnId = result2.getInt("maxtrnid") + 1;
                    }
                    strQuery1 = "insert into payment(transaction_id,customer_id,plan_name,amount,payment_mode,payment_date) values(?,?,?,?,?,current_date);";
                    pstmt1 = con.prepareStatement(strQuery1);
                    pstmt1.setInt(1, newTrnId);
                    pstmt1.setString(2, custid);
                    pstmt1.setString(3, planname);
                    pstmt1.setString(4, premamt);
                    pstmt1.setString(5, paymode);
                    //pstmt1.setString(6, "current_date");
                    int m = pstmt1.executeUpdate();
        %>

        <BR>
        <table width="100%">
            <tr>
                <td align="center" width="100%">
                    <font color="Red" size="4">THANKS FOR PURCHASE !! YOUR POLICY NUMBER & PAYMENT ID GIVEN BELOW</font>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%"><font color="blue" size="4">
                        <%                    out.println("YOUR POLICY NUMBER IS: " + newPolno);
                        %>
                    </font></td>
            </tr>
            <tr>
                <td align="center" width="100%"><font color="blue" size="4">
                        <%
                            out.println("YOUR TRANSACTION ID : " +newTrnId);
                        %>
                    </font></td>
            </tr>
            
        </table>
        <BR>

        <%       } else {
                out.println("SEEMS SOME PROBLEM !!!, PLEASE TRY AGAIN ");

            }

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

