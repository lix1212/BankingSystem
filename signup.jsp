<%-- 
    Document   : signup
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
       

        <title>SIGN UP PROCESS</title>
        <link rel="stylesheet" type="text/css" media="all" href="calendar/calendar-tas.css" title="win2k-cold-1" />
        <script type="text/javascript" src="calendar/calendar.js"></script>
        <script type="text/javascript" src="calendar/lang/calendar-en.js"></script>
        <script type="text/javascript" src="calendar/calendar-setup.js"></script>
        <script language="JavaScript" src="scripts/login.js"></script>
    </head>
    <body>
        <%
        //if(session.getAttribute("CUSTOMERID") == null) {
          //  out.println("NO Session Exist.");
        //} else {
            Connection con1=null;
            TestConnect obj=null;
            ResultSet result = null,result2 = null;
            PreparedStatement pstmt = null,pstmt1 = null;
            String strQuery = null,absemailid=null,getMailID=null;
            int result1=0;
        %>
        
        <%
        
        obj=new TestConnect();
        try {
            
            con1 = obj.connectURL();
            
            
            if (con1 != null) {
//                strQuery = "select * from empmast where srno=?;";
//                String srno=session.getAttribute("SRNO").toString();
//                //  out.println("SR NO is " + srno);
//                pstmt=con1.prepareStatement(strQuery);
//                pstmt.setString(1,srno);
//                result=pstmt.executeQuery();
                
                //if(result != null)
                
                //{
        
        %>
        <%@ include file="header.jsp"%>
        <%
        //if(result.next()) {
            
            //out.println("FLAG1===" + Integer.parseInt(result.getObject("flag1").toString()));
           // if(Integer.parseInt(result.getObject("flag1").toString()) == 0) {
        
        %>
        <table border='1' width="100%">
            <form name="entermasterdata" action="insertMasterData.jsp" method="post" onsubmit="return validatedata();" >
                                
                <tr>
                    <td colspan="6" align="center" bgcolor="pink">SIGN UP PROCESS &nbsp;</td>
                </tr>
                <tr>
                    <th colspan="6">Enter your Basic Details for Registration</th>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td width="15%" align="right">NAME</td>
                        <td width="15%"><input type="text" size="50" name="name" value=""/></td>
                    <td width="15%" align="center">DATE OF BIRTH</td>
                        <td width="20%" align="left"><input type="text" name="dateofbirth" id="f_date_cadreentry" readonly="1" value="0000-00-00" size="10">
                        <img src="calendar/img.gif" id="f_trigger_cadreentry" style="cursor: pointer; border: 1px solid blue;" title="Date selector"
                             onmouseover="this.style.background='red';" onmouseout="this.style.background='yellow'" />
                        <script type="text/javascript">
    Calendar.setup({
        inputField     :    "f_date_cadreentry",     // id of the input field
        ifFormat       :    "%Y-%m-%d",      // format of the input field
        button         :    "f_trigger_cadreentry",  // trigger for the calendar (button ID)
        align          :    "Tl",           // alignment (defaults to "Bl")
        singleClick    :    true
    });
                    </script></td>
                <tr>
                 <td width="15%" align="right">AGE</td>
                        <td width="15%"><input type="text" size="20" name="age" value=""/></td>
                    <td width="15%" align="right">GENDER</td>
                    <td width="15%"><select name="gender"><option selected>Male</option>        
                            <option>Female</option>
                            <option>Transgender</option>
                            
                    </select>
                    </td>
                    
                </tr>    
                <tr>
                 <td width="15%" align="right">MOBILE NUMBER</td>
                        <td width="15%"><input type="text" size="20" name="mobile" value=""/></td>
                    <td width="15%" align="right">EMAIL ID</td>
                    <td width="20%"><input type="text" size="50" maxlength="50" name="email" value=""/></td>
                    
                </tr>
                
                
                <tr bgcolor="pink">
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr bgcolor="rgb(6,79,143)">
                    <td colspan="6">&nbsp;</td>
                </tr>
               
                <tr>
                    <td align="center" colspan="6"><input type="submit" value="Submit the Details" name="insertdata" />&nbsp;</td>
                </tr>
            </form>
        </table>
        <%
            //}else{
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
