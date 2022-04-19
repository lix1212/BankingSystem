<%-- 
    Document   : displayPolDetails
    Created on : 9 Nov, 2020, 12:30:05 AM
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
        <table align="center" cellpadding="4" cellspacing="4">
            <tr>
                <td colspan="6" align="center" bgcolor="db8cba">POLICY DETAILS &nbsp;</td>
            </tr>
            <tr bgcolor="#f0c0d7">
                <td><b>POLICY NUMBER</b></td>
                <td><b>PLAN NAME</b></td>
                <td><b>PLAN TERM</b></td>
                <td><b>SUM ASSURED </b></td>
                <td><b>PREMIUM</b></td>
            </tr>
            <%            Connection con = null;
                TestConnect obj = null;
                ResultSet result = null;
                PreparedStatement pstmt = null;
                String strQuery = null;
                obj = new TestConnect();

                try {
                    con = obj.connectURL();

                    if (con != null) {

                        String custid = session.getAttribute("CUSTOMERID").toString();
                        strQuery = "select * from policymaster where customer_id=?;";
                        pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, custid);
                        result = pstmt.executeQuery();
                        while (result.next()) {
            %>
            <tr bgcolor="#f0c0d7">

                <td><%=result.getString("policy_number")%></td>
                <td><%=result.getString("plan_name")%></td>
                <td><%=result.getString("plan_term")%></td>
                <td><%=result.getString("plan_sum_assured")%></td>
                <td><%=result.getString("plan_premium")%></td>
            </tr>
            <%
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


