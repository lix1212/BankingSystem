<%-- 
    Document   : mainMenu
    Created on : 8 Nov, 2020, 9:16:43 PM
    Author     : 91996
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" session="true"%>
<%@ page import="java.sql.Connection;"%>
<%@ page import="java.sql.ResultSet;"%>
<%@ page import="java.sql.SQLException;"%>
<%@ page import="java.sql.Statement;"%>
<%@ page import="java.sql.PreparedStatement;"%>
<%@ page import="crm.servlet.TestConnect;"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <SCRIPT src="scripts/rightclick.js" type=text/javascript></SCRIPT>
        <title>Menu Screen</title>
        <style>
            <!--
            .font5
            {color:windowtext;font-size:12.0pt;     font-weight:400;font-style:normal;text-decoration:none;font-family:"Times New Roman", serif;}
            td
            {color: black; font-family: Tahoma, Verdana; font-size: 12px}
            .intd
            {color: #000000; font-family: Tahoma, Verdana; font-size: 11px; padding-left: 14px;}
            a, A:link, a:visited, a:active
            {color: #0000aa; text-decoration: none; font-family: Tahoma, Verdana; font-size: 12px}
            A:hover
            {color: red; text-decoration: underline; font-family: Tahoma, Verdana; font-size: 12px}
            -->
        </style>
    </head>
    <%
        if (session.getAttribute("CUSTOMERID") == null) {
            out.println("No Session Exist");

        } else {

            Connection con = null;
            TestConnect obj2 = null, obj3 = null;
            ResultSet result = null, result2 = null, resultchk = null, result3 = null;
            PreparedStatement pstmt = null, pstmt1 = null, pstmtchk = null, pstmt2 = null;
            String strQuery = null, absemailid = null, getMailID = null, strQuery1 = null, strQuerychk = null, strQuery2 = null;
            int result1 = 0;

            //       Connection con=null;
            //  TestConnect obj2=null;
            //  ResultSet result = null;
            //  PreparedStatement pstmt = null;
            //  String strQuery = null;
            //  obj2=new TestConnect();
            try {

                //    con = obj2.connectURL();
                //     if (con != null) {
                strQuery = "select * from empmast where srno=?;";
                //  strQuery1 = "select * from reviewmast where srno=? and reviewflag=?;";
                //String srno=session.getAttribute("SRNO").toString();

                //  System.out.println("SR NO is " + srno);
                //      pstmt=con.prepareStatement(strQuery);
                //  pstmt1=con.prepareStatement(strQuery1);
                //    pstmt.setString(1,srno);
                // pstmt1.setString(1,srno);
                // pstmt1.setInt(2,1);
                //  result=pstmt.executeQuery();
                //  result2=pstmt1.executeQuery();
                //  session.setAttribute("button",null);
                //  if (result != null) {
                //     if(result.next()) {

    %>

    <body  leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
        <%@ include file="header_logout.jsp" %>

        <table  width="100%" height="24" border="0" style="background:white">            <tr><td align="center"><font size="2pt" style="color:rgb(6,79,143)"></font></td>

            <tr>
                <td align="center"><font size="4pt" style="color:#3399FF"></font></td>
            </tr>
            <tr><td align="center"><font size="2pt" style="color:#3399FF"></font></td>
            </tr>
        </table>
        <table width="100%" border="0" height="28">
            <tr>
                <td align="left"><strong><font size="2pt" style="color:#3399FF" face="Times New Roman"></font></strong></td>
            </tr>
        </table>
        <table width="100%" height="45%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="45%" width="40%" style="background:#3399FF">
                    <table border="0">
                        <tr>
                            <td></td>
                            <td><p align="justify"><font face="arial" size="2" color="#FFFFFF"></font></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p align="justify"><font face="arial" size="2" color="#FFFFFF"></font></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p align="justify"><font face="arial" size="2" color="#FFFFFF"></font></p></td>
                        </tr>
                    </table> 
                </td>  
                <td height="45%" width="60%" style="background:#FF99CC">
                    <table width="100%" height="10%" border="0" cellspacing="0" cellpadding="0">
                        <tr>  
                            <td width="100%" colspan="6" align="center">
                                <B><font face="Times New Roman" style="color:rgb(6,79,143)" size="4">MAIN MENU SCREEN</font></B>
                            </td>
                        </tr></table>
                       
                    <table width="100%" height="85%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="53%" >
                                <table width="100%" height="46%" border="0" cellspacing="0" cellpadding="0">
                                    <tr height="2%"></tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  size="2">1</font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman" size="2">
                                                    <a href="purchasePlan.jsp">PURCHASE A PLAN</a></font></B>
                                        </td>

                                    </tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  size="2">2</font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman"  size="2">
                                                    <a href="premiumRenewal.jsp">PAY RENEWAL PREMIUM</a></font></B>
                                        </td>
                                    </tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  size="2">3</font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman"  size="2">
                                                    <a href="displayPolDetails.jsp">DISPLAY POLICY DETAILS</a></font></B>
                                        </td>
                                    </tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  size="2">4</font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman"  size="2">
                                                    <a href="displayPersonalDetails.jsp">DISPLAY PERSONAL DETAILS</a></font></B>
                                        </td>
                                    </tr>

                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  size="2">5</font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman"  size="2">
                                                    <a href="custCompfeed.jsp">CUSTOMER FEEDBACK</a></font></B>
                                        </td>
                                    </tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  size="2">6</font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman"  size="2">
                                                    <a href="survey.jsp">MARKET SURVEY</a></font></B>
                                        </td>
                                    </tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  size="2"></font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman" size="2">
                                                    <a></a></font></B>
                                        </td>
                                    </tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  style="color:rgb(6,79,143)" size="3"></font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman"  style="color:rgb(6,79,143)" size="2">
                                                    <a></a></font></B>
                                        </td>
                                    </tr>


                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  style="color:rgb(6,79,143)" size="2"></font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman"  style="color:rgb(6,79,143)" size="2">
                                                    <a href="#" style="color:rgb(6,79,143)">&nbsp;</a></font></B>
                                        </td>
                                    </tr>
                                    <tr height="2%">
                                        <td width="10%" align="right"><B><font face="Times New Roman"  style="color:rgb(6,79,143)" size="2"></font></B></td>
                                        <td width="1%" align="right"></td>
                                        <td width="89%" align="left">
                                            <B><font face="Times New Roman" style="color:rgb(6,79,143)" size="2">
                                                    <a href="#" style="color:rgb(6,79,143)">&nbsp;</a></font></B>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                    <%                                                        /*}
else
{
                         */
                    %>

                    <%                        // }
                    %>
                </td>
            </tr>
        </table>

        <%                    /*   }
                            else
                                out.println("NO Data");
                            }else
                                out.println("result is null");
                     */
 /*}else {
        out.println("Con is NULL");
        }*/
                } catch (Exception Ex) {
                    out.println("Exception is  : " + Ex.getMessage());
                    Ex.printStackTrace();
                    //  DTLog.info(Ex.getMessage());
                } finally {
                    //   obj2.closeConnection(con);
                }
            }%>
        <%@ include file="footer.jsp"%>
    </body>
</html>
