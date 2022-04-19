<%@page import="java.nio.charset.Charset"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement;"%>
<%@ page import="java.sql.Connection;"%>
<%@ page import="java.sql.ResultSet;"%>
<%@ page import="java.sql.SQLException;"%>
<%@ page import="java.sql.Statement;"%>
<%@ page import="crm.java.RandomExample;"%>
<%@ page import="crm.servlet.TestConnect;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <SCRIPT src="scripts/rightclick.js" type=text/javascript></SCRIPT>
        <title>Customer Data Creation</title>
    </head>
    <body  leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
        <%

            //  if(session.getAttribute("SRNO") != null) {
            // if(session.getAttribute("SRNO") == null) {
            // out.println("NO Session Exist.");
            // }else {

        %>
        <%@ include file="header.jsp" %>

        <%            Connection con = null;
            TestConnect obj = null;
            ResultSet result = null;
            PreparedStatement pstmt = null, pstmt1 = null;
            String strQuery = null, strQuery1 = null;
            obj = new TestConnect();
            RandomExample objRandomExample = new RandomExample();

            try {
                con = obj.connectURL();

                if (con != null) {

                    int newCustomerId = 0;
                    String newPassword = objRandomExample.generateRandomString(7);
                    strQuery = "select max(Customer_id) from customer ;";
                    //String srno = session.getAttribute("SRNO").toString();
                    pstmt = con.prepareStatement(strQuery);
                    result = pstmt.executeQuery();
                    if (result.next()) {
                        out.println("max id==" + result.getInt(1));
                        newCustomerId = result.getInt(1) + 1;
                        out.println("new id==" + newCustomerId);
                    }
                    String name = request.getParameter("name").trim();
                    //out.println("name" + name);
                    String dateofbirth = request.getParameter("dateofbirth").trim();
                    String age = request.getParameter("age").trim();
                    String gender = request.getParameter("gender").trim();
                    String mobile = request.getParameter("mobile").trim();
                    String email = request.getParameter("email").trim();

                    //      out.println("in 1:::::::::");
                    strQuery1 = "insert into customer(customer_id,psswd,customer_name,date_of_birth,age,gender,mobile_number,email_id) values(?,?,?,?,?,?,?,?);";
                    pstmt1 = con.prepareStatement(strQuery1);
                    pstmt1.setInt(1, newCustomerId);
                    pstmt1.setString(2, newPassword);
                    pstmt1.setString(3, name);
                    pstmt1.setString(4, dateofbirth);
                    pstmt1.setString(5, age);
                    pstmt1.setString(6, gender);
                    pstmt1.setString(7, mobile);
                    pstmt1.setString(8, email);
                    
                    int k = pstmt1.executeUpdate();

                    if (k >= 1) {

        %>

        <BR>
        <table width="100%">
            <tr>
                <td align="center" width="100%">
                    <font color="Red" size="4">YOUR REGISTRATION IS SUCCESSFUL, PLEASE NOTE YOUR CUSTOMER ID & PASSWORD FOR LOGIN</font>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%"><font color="blue" size="4">
                        <%                    out.println("YOUR CUSTOMER ID : " + newCustomerId);
                        %>
                    </font></td>
            </tr>
            <tr>
                <td align="center" width="100%"><font color="blue" size="4">
                        <%
                            out.println("YOUR PASSWORD : " + newPassword);
                        %>
                    </font></td>
            </tr>
            <tr>
                <td width="100%" align="center"><a href="login.jsp"><font size="4" color="red">Click Here to Login CRM Portal </font></a></td>
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
