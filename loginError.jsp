<%-- 
    Document   : loginError
    Created on : 8 Nov, 2020, 9:16:43 PM
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
        <title>Error</title>
    </head>
    <body>
        <%@ include file="header.jsp"%>
        <table border="0" width="100%">
                <tr>
                    <td width="100%" align="Center">Authentication Failed.</td>
                </tr>
                <br>
                <tr>
                <td width="100%" align="center"><a href="login.jsp"><font size="4" color="red">Click Here to Re-Login</font></a></td>
            </tr>
    
        </form>
            
        </table>
       <br> <br> <br> <br> <br>
<%--    
 <html dir="ltr"><head><meta http-equiv="content-type" content="text/html;charset=UTF-8"><title>Sign In LIC-EDMS </title><link rel="stylesheet" href="css/ewgeneral.css" type="text/css">
 <script language="javascript" src="scripts/constants.js"></script>
 <script language="javascript" src="scripts/estyle.js"></script>
 <script language="javascript" src="scripts/login.js"></script>
 <script language=javascript>
     var bclicked = 0;
     var loginFlag = true;
     var cabRegistered = true;
     tvar bites = document.cookie.split(";");
 </script>
 <script>
     function Help()
     {
     var LeftPosition = (screen.availWidth) ? (screen.availWidth-700)/2 : 0;
     var TopPosition = (screen.availHeight) ? (screen.availHeight-500)/2 : 0;
     var win=window.open("help/Login Page.html","PopupWindow","scrollbars=1, statusbar = 0, menubar = 0,  resizable = 0, width = 700, height = 500, left = "+LeftPosition+" ,top = "+TopPosition );
     }
     
     function downloadjre()
     {
     var url="downloadjre.jsp";
     window.open(url,'download','toolbar=no,menubar=no,scrollbars=yes');
     }
     
     function Resolution()
     {
     var screenWidth = screen.width;
     var screenHeight = screen.height;
     if ((screenWidth<=800) && (screenHeight<=600))
     {
     alert('Your Screen Resolution is '+screenWidth+'x'+screenHeight+' For best view switch to 1024x768 mode' );
     }
     SetFocus();
     }
     
 </script>
 
 </head>
 <body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" onload="Resolution();return false" >
     <form method="post" name="frm1" action="main.jsp" target="_self">
         <input type="hidden" name="A" value="estyle,11011,">
         <input type="hidden" name="Locale" value="en-US">
         <input type="hidden" name="OrigUserName" value>
         <input type="hidden" name="rid" value="">
         <input type="hidden" name="cabinetName" value="">
         <input type="hidden" name="timeZone" value>
         <table width="100%" border="0" height="10%">
             <tr>
                 <td align=left width="20%">
                     <img alt="Life Insurance Corporation" src="images/logo.gif"  height="60">
                 </td>
                 <td align=center width="60%"><font size="5pt" style="color:rgb(6,79,143)">
                     <B>LIC Header</B></font>
                 </td>
                 <td align="right" width="20%">
                     <!--<img alt="EDMS @ powered by Omnidocs" src="images/logo1.gif" height="50">-->
                 </td>
                 </tr>
           </table>
           <table width="100%" border="0" height="3%" style="background:rgb(6,79,143)" valign="bottom">
               <tr>
                   <td width="100%" align="right" valign="bottom">
                       <a href="" onclick="Help();return false;"><img alt="Help" src="images/help1.gif" border="0"></a>
                       <a href="" onclick="PasswordWindow();return false;"><img alt="Change Password" src="images/Change_Password_button.gif" border="0">
                   </td>
               </tr>
           </table>
           <table>
           
            <tr><td width="30%" align="center"></td></tr>
            <td width="30%" align="center"></td>
           <td align="left"  width="20%" class=EWLabel3></td>
           <td width="20%" align="left">
               <A onmousemove="window.status='Click here to Login'" onclick="var val = LoginClick(); 
               if (val==true) window.document.forms[0].submit(); return false;" 
               onmouseout="window.status=''" href="">
                   <IMG height=24 alt="Click here to Login" title="Click here to Login" src="images/Login.gif" width=54 border=0>
                   </A>
               </td>
               <td width="30%" align="center"></td>
           </table>
               
               
               <br><br><br><br><br><td align="left" hspace="0" width="20%" colspan="2"  class=EWLabel3>
                   <input type=checkbox name=SetCookie>
                   <B><font size="2pt" style="color:rgb(6,79,143)" face="Times New Roman">

               Remember_Sr_No</font></b></td>
               <script>
               function PasswordWindow()
               {
               var LeftPosition = (screen.availWidth) ? (screen.availWidth-350)/2 : 0;
               var TopPosition = (screen.availHeight) ? (screen.availHeight-300)/2 : 0;
               var win=window.open("updatePswd.jsp","updatePswd","toolbar=no, width = 350,height = 300,left = "+LeftPosition+" ,top = "+TopPosition);
                if (window.focus)
                {
                win.focus()
                }
               }
           </script>
           <script FOR="window">
               var isNav = (navigator.appName.indexOf("Netscape") != -1);
               var isIE  = (navigator.appName.indexOf("Microsoft") != -1);
               function handler(e)    {
               if(isNav)
               {
               if((e.which == 13) && (e.target.type != 'textarea'))
               {
               var val = LoginClick();
               if (val==true)
               window.document.forms[0].submit();return false; 
               }
               }
               if(isIE)
               {
               e=window.event;
               if(e.keyCode == 13 && e.srcElement.type != 'reset' && e.srcElement.type != 'button' && e.srcElement.type != 'textarea' && e.srcElement.type != 'submit' && e.srcElement.tagName.toUpperCase() != 'A')
               {
               var val = LoginClick();
               if (val==true)
               window.document.forms[0].submit();
               return false;
               }
               }
               return true;
               }
               if(isNav)
               {
               document.captureEvents(Event.KEYDOWN);
               document.forms[0].userName.focus();
               }
               window.document.onkeydown=handler;
      if (j == 1)
      {
        window.document.getElementById("cabinetdiv").style.visibility = "hidden";
        window.document.getElementById("selectdiv").style.visibility = "hidden";
      }
      else if (j > 1)
      {
        window.document.getElementById("cabinetdiv").style.visibility = "visible";
        window.document.getElementById("selectdiv").style.visibility = "visible";
        
      }

      </script>
--%>
    <%--
    
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
    </body>
</html>
<%@ include file="footer.jsp"%>
