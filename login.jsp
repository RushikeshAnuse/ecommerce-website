<%-- 
    Document   : login
    Created on : 18 Aug 2024, 4:49:59 pm
    Author     : Rushikesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%@include file="component/common_css_js.jsp" %>
        
    </head>
    <body>
        
        <%@include file="component/navbar.jsp" %>
        
        <div class="card col-md-5 offset-md-3 mt-5">
            
            <div class="card-header">
                <h3>Login Page</h3>
            </div>
            
            <div class="card-body">
                
                <%@include file="component/message.jsp" %>
                
                <form action="LoginServlet" method="post">
                   <div class="mb-3">
                   <label for="exampleInputEmail1" class="form-label">Email address</label>
                   <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                   <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                  </div>
                    
                  <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input name = "password" type="password" class="form-control" id="exampleInputPassword1" required>
                  </div>
   
                    <a href="register.jsp" class="text-center d-block mb-2" >if not registered click here</a>
                    
                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                    
                </form>
                
            </div>
            
        </div>
        
    </body>
</html>
