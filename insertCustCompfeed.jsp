<%-- 
    Document   : insertCustFeedback
    Created on : 9 Nov, 2020, 11:16:34 AM
    Author     : Mansi Pal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html"%>
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
        <title>Customer Complaint/Feedback</title>
    </head>
    <body  leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
        <%@ include file="header_logout.jsp" %>

        <%            Connection con = null;
            TestConnect obj = null;
            ResultSet result = null;
            PreparedStatement pstmt = null, pstmt1;
            String strQuery = null, strQuery1 = null;
            obj = new TestConnect();
            try {
                con = obj.connectURL();

                if (con != null) {

                    int newCompfeedNo = 0;
                    String custid = session.getAttribute("CUSTOMERID").toString();
                    strQuery = "select max(Comp_feed_number) from compfeed ;";
                    pstmt = con.prepareStatement(strQuery);
                    result = pstmt.executeQuery();
                    if (result.next()) {
                        newCompfeedNo = result.getInt(1) + 1;
                    }
                    String polno = request.getParameter("polno").trim();
                    String type = request.getParameter("type").trim();
                    String about = request.getParameter("about").trim();
                    String describe = request.getParameter("describe").trim();
                    strQuery1 = "insert into compfeed(comp_feed_number,plan_number,customer_id,type,comp_feed_nature,comp_feed_description,comp_feed_date) values(?,?,?,?,?,?,current_date);";
                    pstmt1 = con.prepareStatement(strQuery1);
                    pstmt1.setInt(1, newCompfeedNo);
                    pstmt1.setString(2, polno);
                    pstmt1.setString(3, custid);
                    pstmt1.setString(4, type);
                    pstmt1.setString(5, about);
                    pstmt1.setString(6, describe);
                    int k = pstmt1.executeUpdate();
                    if (k >= 1) {

        %>

        <BR>
        <table width="100%">
            <tr>
                <td align="center" width="100%">
                    <font color="Red" size="4">YOUR COMPLAINT/FEEDBACK HAS BEEN SUBMITTED SUCCESSFULLY!!</font>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <font color="blue" size="4">
                    <%
                            out.println("YOUR SUBMISSION NUMBER IS : " +newCompfeedNo);
                        %>
                    </font>
                </td>
            </tr>
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

