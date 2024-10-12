<%-- 
    Document   : register
    Created on : 14 Aug 2024, 12:51:33 pm
    Author     : Rushikesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
        <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
         
        <div class="row">
            <div class="col-md-5 offset-md-3 mt-5">
                <div class="card">
                      <%@include file="component/message.jsp" %>
                     <div class="card-header text-center">
                        <h3>Sign In Form</h3>
                    </div>
                    
                    <div class="card-body ">
                        
                      
                        
                        <form action="RegisterServlet" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input name="user_name" type="text" class="form-control" id="username" required>
                            </div>
                             
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" required>
                            </div>
                             
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input name="user_password" type="password" class="form-control" id="password"  required>
                            </div>
                             
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input name="user_phone" type="tel" class="form-control" id="phone" required>
                            </div>
                             
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <textarea name="user_address" class="form-control" id="address"  rows="3" required></textarea>
                            </div>
                             
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                
                            </div>
                        </form>
                         
                    </div>
                     
                     
                     
                </div>
            </div>
        </div>
    </body>
</html>
