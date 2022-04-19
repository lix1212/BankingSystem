<%-- 
    Document   : insertSurvey
    Created on : 9 Nov, 2020, 1:41:32 PM
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
        <title>SURVEY</title>
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
                    
                    int newSurveyNo = 0;
                    String custid = session.getAttribute("CUSTOMERID").toString();
                    strQuery = "select max(survey_number) from survey ;";
                    pstmt = con.prepareStatement(strQuery);
                    result = pstmt.executeQuery();
                    if (result.next()) {
                        newSurveyNo = result.getInt(1) + 1;
                    }
                    String quest1 = request.getParameter("quest1").trim();
                    String quest2 = request.getParameter("quest2").trim();
                    String quest3 = request.getParameter("quest3").trim();
                    String quest4 = request.getParameter("quest4").trim();
                    String quest5 = request.getParameter("quest5").trim();
                    strQuery1 = "insert into survey(survey_number,customer_id,question1,question2,question3,question4,question5) values(?,?,?,?,?,?,?);";
                    pstmt1 = con.prepareStatement(strQuery1);
                    pstmt1.setInt(1, newSurveyNo);
                    pstmt1.setString(2, custid);
                    pstmt1.setString(3, quest1);
                    pstmt1.setString(4, quest2);
                    pstmt1.setString(5, quest3);
                    pstmt1.setString(6, quest4);
                    pstmt1.setString(7, quest5);
                    int k = pstmt1.executeUpdate();
                    if (k >= 1) {

        %>

        <BR>
        <table width="100%">
            <tr>
                <td align="center" width="100%">
                    <font color="Red" size="4">YOUR SURVEY FORM HAS BEEN SUBMITTED SUCCESSFULLY !!!</font>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <font color="blue" size="4">
                    <%
                            out.println("YOUR SURVEY ID IS : " +newSurveyNo);
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

