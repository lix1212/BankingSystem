<%-- 
    Document   : displayPersonalDetails
    Created on : 9 Nov, 2020, 10:10:24 AM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <SCRIPT src="scripts/rightclick.js" type=text/javascript></SCRIPT>
        <title>PERSONAL DETAILS</title>
    </head>
    <body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
        <%@ include file="header_logout.jsp" %>
        <table align="center" cellpadding="4" cellspacing="4">
            <tr>
                <td colspan="7" align="center" bgcolor="#e6a83e">PERSONAL DETAILS &nbsp;</td>
            </tr>
            <tr bgcolor="#f08522">
                <td><b>YOUR CUSTOMER ID :</b></td>
                <td><b>NAME :</b></td>
                <td><b>DATE OF BIRTH :</b></td>
                <td><b>AGE : </b></td>
                <td><b>GENDER :</b></td>
                <td><b>MOBILE NUMBER :</b></td>
                <td><b>EMAIL ID :</b></td>
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
                        strQuery = "select * from customer where customer_id=?;";
                        pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, custid);
                        result = pstmt.executeQuery();
                        while (result.next()) {
            %>
            <tr bgcolor="#f7c602">

                <td><%=result.getString("customer_id")%></td>
                <td><%=result.getString("customer_name")%></td>
                <td><%=result.getString("date_of_birth")%></td>
                <td><%=result.getString("age")%></td>
                <td><%=result.getString("gender")%></td>
                <td><%=result.getString("mobile_number")%></td>
                <td><%=result.getString("email_id")%></td>
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
