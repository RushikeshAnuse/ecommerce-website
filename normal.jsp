
<%@page import="com.ecommerce.entities.User"%>
<%
    User user =(User) session.getAttribute("current-user");
    
    if(user == null){
       session.setAttribute("message", "you are not loggend in !!! please try again");
       response.sendRedirect("login.jsp");
       return;
    }
//    else{
//    
//         if(user.getUserType().equals("normal")){
//         session.setAttribute("message", "You are not access this page because you are not admin");
//         response.sendRedirect("login.jsp");
//         return;
//    }
//    }
 
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        
         <%@include file="component/common_css_js.jsp" %>
         
    </head>
    <body>
        
        <%@include file="component/navbar.jsp" %>
        
        <h1>This is normal user page</h1>
        
    </body>
</html>
