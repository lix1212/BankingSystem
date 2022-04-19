<%-- 
    Document   : signupLanding
    Created on : 6 Nov, 2020, 11:40:35 PM
    Author     : 91996
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <SCRIPT src="scripts/rightclick.js" type=text/javascript></SCRIPT>
        <title>Logout</title>

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%

            request.getSession(false).invalidate();
            //out.println("SR NO IS " + session.getAttribute("SRNO").toString());
            //out.println("Session xdsdsv " + request.getSession(false));
        %>
        <table border="0" width="100%">
            <tr>
                <td width="100%" align="Center">Customer Id does not exist, pls Check Id/Password or If you are new customer complete registration process by sign up</td>
            </tr>
            <br>
            <tr>
                <td width="100%" align="center"><a href="login.jsp"><font size="4" color="red">Click Here to Re-Login</font></a></td>
            </tr>

            <tr>
                <td width="100%" align="center"><a href="signup.jsp"><font size="4" color="red">Click Here to Sign Up</font></a></td>
            </tr>

        </form>

    </table>
    <%@ include file="footer.jsp" %>
</body>
</html>
